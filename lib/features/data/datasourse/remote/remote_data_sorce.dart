import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/core/util/handle_call.dart';
import 'package:teacher/features/data/datasourse/api/teacher_api.dart';
import 'package:teacher/features/data/datasourse/api/teacher_service.dart';
import 'package:teacher/features/data/models/assignment_model.dart';
import 'package:teacher/features/data/models/choice_model.dart';
import 'package:teacher/features/data/models/course_model.dart';
import 'package:teacher/features/data/models/pdf_model.dart';
import 'package:teacher/features/data/models/question_model.dart';
import 'package:teacher/features/data/models/success_model.dart';

import 'package:teacher/features/data/models/token_model.dart';
import 'package:teacher/features/data/models/user_model.dart';

//* calling remote data source interface
abstract class RemoteDataSource {
  Future<TokenModel> login({required String email, required String password});
  Future<TokenModel> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<TokenModel> refreshToken({required String refreshToken});
  Future<UserModel> getUser({required String accessToken});
  Future<void> logout({required String accessToken});

  Future<KtList<CourseModel>> getCourses({required String accessToken});

  Future<KtList<PdfModel>> getPdf({
    required int courseId,
    required String accessToken,
  });
  Future<KtList<AssignmentModel>> getAssignment({
    required int courseId,
    required String accessToken,
  });
  Future<KtList<QuestionModel>> getQuestions({
    required int assignmentId,
    required String accessToken,
  });
  Future<KtList<ChoiceModel>> getChoices({
    required int questionId,
    required String accessToken,
  });

  Future<SuccessModel> createCourse({
    required String title,
    required String desc,
    required String photo,
    required String accessToken,
  });
  Future<SuccessModel> editCourse({
    required int courseId,
    required String accessToken,
    required String? title,
    required String? desc,
    required String? photo,
  });
  Future<SuccessModel> deleteCourse({
    required int courseId,
    required String accessToken,
  });
  Future<http.Response> fetchFileFromUrl({required String url});

  Future<SuccessModel> createPdf({
    required String accessToken,
    required int courseId,
    required String title,
    required String pdf,
  });

  Future<SuccessModel> editPdf({
    required String accessToken,
    required int pdfId,
    required String? title,
    required String? pdf,
  });

  Future<SuccessModel> deletePdf({
    required String accessToken,
    required int pdfId,
  });

  Future<SuccessModel> createAssignment({
    required String accessToken,
    required int courseId,
    required String title,
  });

  Future<SuccessModel> editAssignment({
    required String accessToken,
    required int assignmentId,
    required String title,
  });

  Future<SuccessModel> deleteAssignment({
    required String accessToken,
    required int assignmentId,
  });

  Future<SuccessModel> createQuestion({
    required int assignmentId,
    required String accessToken,
    required String question,
    required String answer,
  });

  Future<SuccessModel> editQuestion({
    required int questionId,
    required String accessToken,
    required String? question,
    required String? answer,
  });

  Future<SuccessModel> deleteQuestion({
    required int questionId,
    required String accessToken,
  });

  Future<SuccessModel> createChoice({
    required int questionId,
    required String accessToken,
    required String title,
  });

  Future<SuccessModel> editChoice({
    required int choiceId,
    required String accessToken,
    required String title,
  });

  Future<SuccessModel> deleteChoice({
    required int choiceId,
    required String accessToken,
  });

  Future<KtList<ChoiceModel>> sortChoices({
    required int questionId,
    required String accessToken,
  });
  Future<SuccessModel> selectAnswer({
    required int choiceId,
    required String accessToken,
    required int questionId,
  });
}

//* injecting the class with its abstract class
@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final TeacherService _teacher;
  final HandleNetworkCall _call;
  final TeacherServiceApi _api;

  RemoteDataSourceImpl(this._teacher, this._call, this._api);

  //*using flavors...if the flavor of the app is teacher call teachers api
  //* if the flavor is student call student api
  @override
  Future<TokenModel> login(
      {required String email, required String password}) async {
    try {
      final response = await _api.login(email: email, password: password);

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        final body = response.body;
        return TokenModel.fromJson(body['token']);
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<TokenModel> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _api.register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        final body = response.body;
        return TokenModel.fromJson(body);
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<TokenModel> refreshToken({required String refreshToken}) async {
    try {
      final response = await _api.refreshToken(refreshToken: refreshToken);

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        final body = response.body;
        return TokenModel.fromJson(body);
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser({required String accessToken}) async {
    try {
      final response = await _api.getUser(accessToken: 'Bearer $accessToken');

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        final body = response.body;
        return UserModel.fromJson(body['user']);
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<void> logout({required String accessToken}) async {
    try {
      final response = await _api.logout(accessToken: 'Bearer $accessToken');

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        return;
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  //*studentis also teacher
  @override
  Future<KtList<CourseModel>> getCourses({required String accessToken}) async {
    try {
      final response =
          await _api.getCourses(accessToken: 'Bearer $accessToken');

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        List<CourseModel> courses = [];
        final body = response.body;
        try {
          courses = (body['course']['data'] as List)
              .map((body) => CourseModel.fromJson(body))
              .toList();
        } catch (e) {
          print(e.toString());
          // break;
        }
        return courses.toImmutableList();
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<KtList<PdfModel>> getPdf({
    required int courseId,
    required String accessToken,
  }) async {
    try {
      final response = await _api.getPdf(
        accessToken: 'Bearer $accessToken',
        courseId: courseId,
      );

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        List<PdfModel> pdf = [];
        final body = response.body;
        try {
          pdf = (body['pdf'] as List)
              .map((body) => PdfModel.fromJson(body))
              .toList();
        } catch (e) {
          print(e.toString());
          // break;
        }
        return pdf.toImmutableList();
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<KtList<AssignmentModel>> getAssignment(
      {required int courseId, required String accessToken}) async {
    try {
      final response = await _api.getAssignment(
        accessToken: 'Bearer $accessToken',
        courseId: courseId,
      );

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        List<AssignmentModel> ass = [];
        final body = response.body;
        try {
          ass = (body['assignment'] as List)
              .map((body) => AssignmentModel.fromJson(body))
              .toList();
        } catch (e) {
          print(e.toString());
          // break;
        }
        return ass.toImmutableList();
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<KtList<QuestionModel>> getQuestions(
      {required int assignmentId, required String accessToken}) async {
    try {
      final response = await _api.getQuestions(
        accessToken: 'Bearer $accessToken',
        assignmentId: assignmentId,
      );

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        List<QuestionModel> quest = [];
        final body = response.body;
        try {
          quest = (body['question'] as List)
              .map((body) => QuestionModel.fromJson(body))
              .toList();
        } catch (e) {
          print(e.toString());
          // break;
        }
        return quest.toImmutableList();
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<KtList<ChoiceModel>> getChoices(
      {required int questionId, required String accessToken}) async {
    try {
      final response = await _api.getChoices(
        accessToken: 'Bearer $accessToken',
        questionId: questionId,
      );

      final status = _call.checkStatusCode(response.statusCode);
      if (status) {
        List<ChoiceModel> choice = [];
        final body = response.body;
        try {
          choice = (body['choice'] as List)
              .map((body) => ChoiceModel.fromJson(body))
              .toList();
        } catch (e) {
          print(e.toString());
          // break;
        }
        return choice.toImmutableList();
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> createCourse({
    required String title,
    required String desc,
    required String photo,
    required String accessToken,
  }) async {
    try {
      final response = await _api.createCourse(
        title: title,
        desc: desc,
        photo: photo,
        accessToken: 'Bearer $accessToken',
      );
      final status = _call.checkStatusCode(response.statusCode);
      //final body = response.body;
      if (status) {
        return SuccessModel(success: true, message: "Created");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> editCourse({
    required int courseId,
    required String accessToken,
    required String? title,
    required String? desc,
    required String? photo,
  }) async {
    try {
      final response = await _api.editCourse(
        accessToken: 'Bearer $accessToken',
        courseId: courseId,
        title: title,
        desc: desc,
        photo: photo,
      );
      final status = _call.checkStatusCode(response.statusCode);
      //final body = response.body;
      if (status) {
        return SuccessModel(success: true, message: "Edited");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> deleteCourse({
    required int courseId,
    required String accessToken,
  }) async {
    try {
      final response = await _api.deleteCourse(
        accessToken: 'Bearer $accessToken',
        courseId: courseId,
      );
      final status = _call.checkStatusCode(response.statusCode);
      //final body = response.body;
      if (status) {
        return SuccessModel(success: true, message: "Deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<http.Response> fetchFileFromUrl({required String url}) async {
    try {
      final _resp = await _teacher.fetchFileFromUrl(url: url);
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return _resp;
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> createPdf({
    required String accessToken,
    required String title,
    required String pdf,
    required int courseId,
  }) async {
    try {
      final _resp = await _api.createPdf(
        courseId: courseId,
        accessToken: 'Bearer $accessToken',
        link: pdf,
        name: title,
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf created");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> editPdf({
    required String accessToken,
    required int pdfId,
    required String? title,
    required String? pdf,
  }) async {
    try {
      final _resp = await _api.editPdf(
        pdfId: pdfId,
        accessToken: 'Bearer $accessToken',
        link: pdf,
        name: title,
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf edited");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> deletePdf({
    required String accessToken,
    required int pdfId,
  }) async {
    try {
      final _resp = await _api.deletePdf(
        pdfId: pdfId,
        accessToken: 'Bearer $accessToken',
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> createAssignment({
    required String accessToken,
    required int courseId,
    required String title,
  }) async {
    try {
      final _resp = await _api.createAssignment(
        courseId: courseId,
        accessToken: 'Bearer $accessToken',
        title: title,
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> editAssignment({
    required String accessToken,
    required int assignmentId,
    required String title,
  }) async {
    try {
      final _resp = await _api.editAssignment(
        assignmentId: assignmentId,
        accessToken: 'Bearer $accessToken',
        title: title,
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> deleteAssignment({
    required String accessToken,
    required int assignmentId,
  }) async {
    try {
      final _resp = await _api.deleteAssignment(
        assignmentId: assignmentId,
        accessToken: 'Bearer $accessToken',
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> createQuestion({
    required int assignmentId,
    required String accessToken,
    required String question,
    required String answer,
  }) async {
    try {
      final _resp = await _api.createQuestions(
        assignmentId: assignmentId,
        accessToken: 'Bearer $accessToken',
        question: question,
        answer: answer,
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> editQuestion({
    required int questionId,
    required String accessToken,
    required String? question,
    required String? answer,
  }) async {
    try {
      final _resp = await _api.editQuestions(
        questionId: questionId,
        accessToken: 'Bearer $accessToken',
        question: question,
        answer: answer,
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> deleteQuestion(
      {required int questionId, required String accessToken}) async {
    try {
      final _resp = await _api.deleteQuestions(
        questionId: questionId,
        accessToken: 'Bearer $accessToken',
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> createChoice({
    required int questionId,
    required String accessToken,
    required String title,
  }) async {
    try {
      final _resp = await _api.createChoices(
        questionId: questionId,
        accessToken: 'Bearer $accessToken',
        title: title,
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> editChoice(
      {required int choiceId,
      required String accessToken,
      required String title}) async {
    try {
      final _resp = await _api.editChoices(
        choiceId: choiceId,
        accessToken: 'Bearer $accessToken',
        title: title,
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> deleteChoice(
      {required int choiceId, required String accessToken}) async {
    try {
      final _resp = await _api.deleteChoices(
        choiceId: choiceId,
        accessToken: 'Bearer $accessToken',
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "pdf deleted");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<KtList<ChoiceModel>> sortChoices(
      {required int questionId, required String accessToken}) async {
    try {
      final _resp = await _api.sortChoices(
        questionId: questionId,
        accessToken: 'Bearer $accessToken',
      );
      final status = _call.checkStatusCode(_resp.statusCode);
      if (status) {
        List<ChoiceModel> choice = [];
        final body = _resp.body;
        try {
          choice = (body['choice'] as List)
              .map((body) => ChoiceModel.fromJson(body))
              .toList();
        } catch (e) {
          print(e.toString());
          // break;
        }
        return choice.toImmutableList();
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }

  @override
  Future<SuccessModel> selectAnswer(
      {required int choiceId,
      required String accessToken,
      required int questionId}) async {
    try {
      final _resp = await _api.setAnswer(
        questionId: questionId,
        choiceId: choiceId,
        accessToken: 'Bearer $accessToken',
      );
      final _status = _call.checkStatusCode(_resp.statusCode);
      if (_status) {
        return SuccessModel(success: true, message: "answer selected");
      } else {
        throw ServerException();
      }
    } catch (e, s) {
      print("$e,$s");
      rethrow;
    }
  }
}
