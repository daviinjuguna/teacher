import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/database/app_database.dart';
import 'package:teacher/database/course/course_dao.dart';
import 'package:teacher/features/data/models/course_model.dart';
import 'package:teacher/features/data/models/token_model.dart';

abstract class LocalDataSource {
  Future<void> cacheToken({required TokenModel? model});
  Future<TokenModel>? getToken();
  Future<void> clearPrefs();
  Future<bool> checkAuthenticatedUser();
  Future<dynamic> insertCourse(List<CourseModel> course);
  Future<List<CourseModel>> getCourse();
  Future<dynamic> deleteCourse();
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences _prefs;
  final CourseDao _courseDao;

  LocalDataSourceImpl(this._prefs, this._courseDao);

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
}
