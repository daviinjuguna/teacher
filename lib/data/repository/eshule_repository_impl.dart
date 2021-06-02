import 'dart:io';

import 'package:battery/battery.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/data/datasourse/file/file_data_source.dart';
import 'package:teacher/data/datasourse/file/url_to_file.dart';
import 'package:teacher/data/datasourse/image/image_data_source.dart';
import 'package:teacher/data/datasourse/local/local_data_source.dart';
import 'package:teacher/data/datasourse/remote/remote_data_sorce.dart';
import 'package:teacher/data/models/assignment_model.dart';
import 'package:teacher/data/models/choice_model.dart';
import 'package:teacher/data/models/course_model.dart';
import 'package:teacher/data/models/pdf_model.dart';
import 'package:teacher/data/models/question_model.dart';
import 'package:teacher/data/models/success_model.dart';
import 'package:teacher/data/models/token_model.dart';
import 'package:teacher/data/models/user_model.dart';
import 'package:teacher/di/injection.dart';
import 'package:teacher/domain/entities/assignment.dart';
import 'package:teacher/domain/entities/choice.dart';
import 'package:teacher/domain/entities/course.dart';
import 'package:teacher/domain/entities/pdf.dart';
import 'package:teacher/domain/entities/question.dart';
import 'package:teacher/domain/entities/success.dart';
import 'package:teacher/domain/entities/token.dart';
import 'package:teacher/domain/entities/user.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  final LocalDataSource _local;
  final RemoteDataSource _remote;
  final Connectivity _connectivity;
  final FileDataSource _file;
  final ImageDataSource _image;
  final Battery _battery;
  final UrlToFile _urlToFile;

  RepositoryImpl(
    this._local,
    this._remote,
    this._connectivity,
    this._file,
    this._image,
    this._battery,
    this._urlToFile,
  );

  //!Connection CHecker
  @override
  Stream<Either<String, bool>> checkConnection() async* {
    yield* _connectivity.onConnectivityChanged.map((e) {
      if (e == ConnectivityResult.none) {
        return right<String, bool>(false);
      }
      return right<String, bool>(true);
    }).onErrorReturnWith((e, s) {
      print('$e, $s');
      final failure = returnFailure(e);
      return left(failure);
    });
  }

  //!battery checker
  @override
  Stream<Either<String, String>> checkBattery() async* {
    yield* _battery.onBatteryStateChanged.map((e) {
      if (e == BatteryState.full) {
        return right<String, String>(CHARGED);
      } else if (e == BatteryState.charging) {
        return right<String, String>(CHARGING);
      } else {
        return right<String, String>(DISCHARGING);
      }
    }).onErrorReturnWith((e, s) {
      print('$e, $s');
      final failure = returnFailure(e);
      return left(failure);
    });
  }

  //!checkAuth
  @override
  Future<Either<String, bool>> checkAuth() async {
    try {
      return right(await _local.checkAuthenticatedUser());
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //!clear auth
  @override
  Future<Either<String, void>> clearPrefs() async {
    try {
      return right(await _local.clearPrefs());
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //!pick files
  @override
  Future<Either<String, String?>> pickFiles() async {
    try {
      return right(await _file.selectFile());
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //!pick multiple files
  @override
  Future<Either<String, List<String?>>> pickMultipleFiles() async {
    try {
      return right(await _file.selectMultipleFiles());
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //!pick images
  @override
  Future<Either<String, String>> fetchImageUrl({required String url}) async {
    if (url == "Camera") {
      try {
        final imageFile = await _image.selectFromCamera();
        return Right(imageFile);
      } catch (e) {
        print(e.toString());
        final failure = returnFailure(e);
        return Left(failure);
      }
    } else {
      try {
        final imageFile = await _image.selectFromGallery();
        return Right(imageFile);
      } catch (e) {
        print(e.toString());
        final failure = returnFailure(e);
        return Left(failure);
      }
    }
  }

  //!login
  @override
  Future<Either<String, Token>> login(
      {required String email, required String password}) async {
    try {
      // TokenEntity interface;

      final token = await _remote.login(email: email, password: password);
      await _local.cacheToken(model: token);
      return right(token.toEntity());
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //!Register
  @override
  Future<Either<String, Token>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final token = await _remote.register(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword);
      await _local.cacheToken(model: token);
      return right(token.toEntity());
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //*refreshToken
  @override
  Future<Either<String, Token>> refreshToken() async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final _response =
            await _remote.refreshToken(refreshToken: tokenModel.refreshToken);
        await _local.cacheToken(model: _response);
        return right(_response.toEntity());
      } else {
        await getIt<LocalDataSource>().clearPrefs();
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //!get user
  @override
  Future<Either<String, User>> getUser() async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final user = await _remote.getUser(accessToken: tokenModel.accessToken);
        return right(user.toEntity());
      } else {
        await getIt<LocalDataSource>().clearPrefs();
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //!logout..basic auth
  @override
  Future<Either<String, void>> logout() async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        await _remote.logout(accessToken: tokenModel.accessToken);
        return right(await _local.clearPrefs());
      } else {
        await getIt<LocalDataSource>().clearPrefs();
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //fetch courses
  @override
  Future<Either<String, KtList<Course>>> getCourses() async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model =
            await _remote.getCourses(accessToken: tokenModel.accessToken);
        final entities =
            model.map((e) => e.toEntity()).asList().toImmutableList();
        return right(entities);
      } else {
        await getIt<LocalDataSource>().clearPrefs();
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, KtList<Assignment>>> getAssignment(
      {required int courseId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.getAssignment(
          courseId: courseId,
          accessToken: tokenModel.accessToken,
        );
        final entities =
            model.map((e) => e.toEntity()).asList().toImmutableList();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, KtList<Pdf>>> getPdf({required int courseId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.getPdf(
          courseId: courseId,
          accessToken: tokenModel.accessToken,
        );
        final entities =
            model.map((e) => e.toEntity()).asList().toImmutableList();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, KtList<Question>>> getQuestion(
      {required int assignmentId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.getQuestions(
          assignmentId: assignmentId,
          accessToken: tokenModel.accessToken,
        );
        final entities =
            model.map((e) => e.toEntity()).asList().toImmutableList();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, KtList<Choice>>> getChoice(
      {required int questionId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.getChoices(
          questionId: questionId,
          accessToken: tokenModel.accessToken,
        );
        final entities =
            model.map((e) => e.toEntity()).asList().toImmutableList();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> createCourse({
    required String title,
    required String desc,
    required String photo,
  }) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.createCourse(
          title: title,
          desc: desc,
          photo: photo,
          accessToken: tokenModel.accessToken,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> editCourse({
    required int courseId,
    required String? title,
    required String? desc,
    required String? photo,
  }) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.editCourse(
          courseId: courseId,
          accessToken: tokenModel.accessToken,
          title: title,
          desc: desc,
          photo: photo,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> deleteCourse({required int courseId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.deleteCourse(
          courseId: courseId,
          accessToken: tokenModel.accessToken,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, File>> urlToFile({required String url}) async {
    try {
      return right(await _urlToFile.urlToFile(url: url));
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> createPdf(
      {required int courseId,
      required String title,
      required String pdf}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.createPdf(
          courseId: courseId,
          accessToken: tokenModel.accessToken,
          pdf: pdf,
          title: title,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> editPdf(
      {required int pdfId,
      required String? title,
      required String? pdf}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.editPdf(
          accessToken: tokenModel.accessToken,
          pdfId: pdfId,
          title: title,
          pdf: pdf,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> deletePdf({required int pdfId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.deletePdf(
          accessToken: tokenModel.accessToken,
          pdfId: pdfId,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> createAssignment(
      {required int courseId, required String title}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.createAssignment(
          accessToken: tokenModel.accessToken,
          courseId: courseId,
          title: title,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> editAssignment(
      {required int assignmentId, required String title}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.editAssignment(
          accessToken: tokenModel.accessToken,
          assignmentId: assignmentId,
          title: title,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> deleteAssignment(
      {required int assignmentId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.deleteAssignment(
          accessToken: tokenModel.accessToken,
          assignmentId: assignmentId,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> createQuestion(
      {required int assignmentId,
      required String question,
      required String answer}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.createQuestion(
          assignmentId: assignmentId,
          accessToken: tokenModel.accessToken,
          question: question,
          answer: answer,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> editQuestion(
      {required int questionId,
      required String? question,
      required String? answer}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.editQuestion(
          questionId: questionId,
          accessToken: tokenModel.accessToken,
          question: question,
          answer: answer,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> deleteQuestion(
      {required int questionId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.deleteQuestion(
          questionId: questionId,
          accessToken: tokenModel.accessToken,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> createChoice(
      {required int questionId, required String title}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.createChoice(
          questionId: questionId,
          accessToken: tokenModel.accessToken,
          title: title,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> editChoice(
      {required int choiceId, required String title}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.editChoice(
          choiceId: choiceId,
          accessToken: tokenModel.accessToken,
          title: title,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, Success>> deleteChoice({required int choiceId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.deleteChoice(
          choiceId: choiceId,
          accessToken: tokenModel.accessToken,
        );
        final entities = model.toEntity();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, KtList<Choice>>> sortChoice(
      {required int questionId}) async {
    try {
      final tokenModel = await _local.getToken();
      if (tokenModel != null) {
        final model = await _remote.sortChoices(
            questionId: questionId, accessToken: tokenModel.accessToken);
        final entities =
            model.map((e) => e.toEntity()).asList().toImmutableList();
        return right(entities);
      } else {
        throw UnAuthenticatedException();
      }
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }
}