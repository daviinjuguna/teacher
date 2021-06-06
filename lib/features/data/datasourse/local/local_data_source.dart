import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/database/app_database.dart';
import 'package:teacher/database/assignment/assignment_dao.dart';
import 'package:teacher/database/choice/choice_dao.dart';
import 'package:teacher/database/course/course_dao.dart';
import 'package:teacher/database/pdf/pdf_dao.dart';
import 'package:teacher/database/question/question_dao.dart';
import 'package:teacher/database/user/user_dao.dart';
import 'package:teacher/features/data/models/assignment_model.dart';
import 'package:teacher/features/data/models/choice_model.dart';
import 'package:teacher/features/data/models/course_model.dart';
import 'package:teacher/features/data/models/pdf_model.dart';
import 'package:teacher/features/data/models/question_model.dart';
import 'package:teacher/features/data/models/token_model.dart';
import 'package:teacher/features/data/models/user_model.dart';
import 'package:teacher/features/domain/entities/choice.dart';

abstract class LocalDataSource {
  Future<void> cacheToken({required TokenModel? model});
  Future<TokenModel>? getToken();
  Future<void> clearPrefs();
  Future<bool> checkAuthenticatedUser();

  //*USER
  Future insertUser(UserModel user);
  Future<UserModel?> getUser();
  Future deleteUser();

  //*COURSE
  Future<dynamic> insertCourse(List<CourseModel> course);
  Future<List<CourseModel>> getCourse();
  Future<dynamic> deleteCourse();

  //*PDF
  Future insertPdf(List<PdfModel> pdf);
  Future<List<PdfModel>> getPdf(int id);
  Future<dynamic> deletePdf();
  Future deletePdfWhere(int id);

  //*ASSIGNMENT
  Future insertAss(List<AssignmentModel> ass);
  Future<List<AssignmentModel>> getAss(int id);
  Future deleteAss();
  Future deleteAssWhere(int id);

  //*QUESTION
  Future insertQuestion(List<QuestionModel> question);
  Future<List<QuestionModel>> getQuestion(int id);
  Future deleteQuestion();
  Future deleteQuestionWhere(int id);

  //*CHOICE
  Future insertChoice(List<ChoiceModel> choice);
  Future<List<ChoiceModel>> getChoice(int id);
  Future deleteChoices();
  Future deleteChoicesWhere(int id);
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences _prefs;
  final CourseDao _courseDao;
  final PdfDao _pdfDao;
  final AssignmentDao _assignmentDao;
  final ChoiceDao _choiceDao;
  final QuestionDao _questionDao;
  final UserDao _userDao;

  LocalDataSourceImpl(
    this._prefs,
    this._courseDao,
    this._pdfDao,
    this._assignmentDao,
    this._choiceDao,
    this._questionDao,
    this._userDao,
  );

  @override
  Future<void> clearPrefs() {
    try {
      return _prefs.clear();
    } catch (e) {
      print(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<void> cacheToken({model}) {
    try {
      return _prefs.setString(ACCESS_TOKEN, jsonEncode(model!.toJson()));
    } catch (e) {
      print(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<TokenModel>? getToken() {
    try {
      String? token = _prefs.getString(ACCESS_TOKEN);
      if (token != null) {
        return Future.value(TokenModel.fromJson(json.decode(token)));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<bool> checkAuthenticatedUser() {
    try {
      final checkLogin = _prefs.get(ACCESS_TOKEN);
      if (checkLogin != null) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (e) {
      print(e.toString());
      throw CacheException();
    }
  }

  //*USER
  @override
  Future insertUser(UserModel e) async {
    try {
      await _userDao.insertUser(UserDataClass(
        name: e.name,
        email: e.email,
        status: e.status,
        createdAt: e.createdAt,
      ));
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      final _data = await _userDao.getUser();
      if (_data == null) return null;
      return UserModel(
        name: _data.name,
        email: _data.email,
        status: _data.status,
        createdAt: _data.createdAt,
      );
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deleteUser() async {
    try {
      await _userDao.deleteAll();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

//*COURSE
  @override
  Future insertCourse(List<CourseModel> course) async {
    try {
      course.forEach((e) async {
        await _courseDao.insertCourse(
          CourseDataClass(
            id: e.id,
            title: e.title,
            desc: e.desc,
            photo: e.photo,
            appCount: e.appCount,
            applied: e.applied,
            teachedBy: e.teachedBy,
          ),
        );
      });
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CourseModel>> getCourse() async {
    try {
      final _data = await _courseDao.getCourse();
      List<CourseModel> _course = _data
          .map((e) => CourseModel(
                id: e.id,
                title: e.title,
                desc: e.desc,
                photo: e.photo,
                appCount: e.appCount,
                applied: e.applied,
                teachedBy: e.teachedBy,
              ))
          .toList();
      return _course;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deleteCourse() async {
    try {
      await _courseDao.deleteAll();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

//*PDF
  @override
  Future insertPdf(List<PdfModel> pdf) async {
    try {
      pdf.forEach((e) async {
        await _pdfDao.insertPdf(PdfDataClass(
          id: e.id,
          name: e.name,
          pdfDoc: e.pdfDoc,
          courseId: e.courseId,
        ));
      });
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<PdfModel>> getPdf(int id) async {
    try {
      final _data = await _pdfDao.getPdf(id);

      return _data
          .map((e) => PdfModel(
                id: e.id,
                name: e.name,
                pdfDoc: e.pdfDoc,
                courseId: e.courseId,
              ))
          .toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deletePdf() async {
    try {
      await _pdfDao.deleteAll();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deletePdfWhere(int id) async {
    try {
      await _pdfDao.deleteWhere(id);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

//*ASSIGNMENT
  @override
  Future insertAss(List<AssignmentModel> ass) async {
    try {
      ass.forEach((e) async {
        await _assignmentDao.insertAss(AssignmentDataClass(
          id: e.id,
          title: e.title,
          attempted: e.attempted,
          courseId: e.courseId,
          questions: e.questions,
        ));
      });
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<AssignmentModel>> getAss(int id) async {
    try {
      final _data = await _assignmentDao.getAss(id);
      return _data
          .map((e) => AssignmentModel(
                id: e.id,
                title: e.title,
                attempted: e.attempted,
                courseId: e.courseId,
                questions: e.questions ?? 0,
              ))
          .toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deleteAss() async {
    try {
      await _assignmentDao.deleteAll();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deleteAssWhere(int id) async {
    try {
      await _assignmentDao.deleteWhere(id);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  //*QUESTION

  @override
  Future insertQuestion(List<QuestionModel> question) async {
    try {
      question.forEach((e) async {
        await _questionDao.insertQuestion(QuestionDataClass(
          id: e.id,
          question: e.question,
          choices: e.choices,
          assignmentId: e.assignmentId,
          answer: e.answer,
        ));
      });
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<QuestionModel>> getQuestion(int id) async {
    try {
      final _data = await _questionDao.getQuestion(id);
      return _data
          .map((e) => QuestionModel(
                id: e.id,
                question: e.question,
                choices: e.choices ?? [],
                assignmentId: e.assignmentId,
                answer: e.answer ?? ChoiceModel(id: 0, title: "title"),
              ))
          .toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deleteQuestion() async {
    try {
      await _questionDao.deleteAll();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deleteQuestionWhere(int id) async {
    try {
      await _questionDao.deleteWhere(id);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

//*CHOICE
  @override
  Future insertChoice(List<ChoiceModel> choice) async {
    try {
      choice.forEach((e) async {
        await _choiceDao.insertChoice(ChoiceDataClass(
          id: e.id,
          title: e.title,
          questionId: e.questionId,
          sort: e.sort,
        ));
      });
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ChoiceModel>> getChoice(int id) async {
    try {
      final _data = await _choiceDao.getChoice(id);
      return _data
          .map((e) => ChoiceModel(
                id: e.id,
                title: e.title,
                questionId: e.questionId,
                sort: e.sort,
              ))
          .toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deleteChoices() async {
    try {
      await _choiceDao.deleteAll();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future deleteChoicesWhere(id) async {
    try {
      await _choiceDao.deleteWhere(id);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
