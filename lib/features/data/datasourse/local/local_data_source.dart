import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/core/util/constant.dart';

import 'package:teacher/features/data/models/token_model.dart';

abstract class LocalDataSource {
  Future<void> cacheToken({required TokenModel? model});
  Future<TokenModel>? getToken();
  Future<void> clearPrefs();
  Future<bool> checkAuthenticatedUser();

  //*searches
  Future saveToRecentSearches(String? searchText);
  Future<List<String>?> getRecentSearchesLike(String? query);
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences _prefs;

  LocalDataSourceImpl(
    this._prefs,
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

  @override
  Future saveToRecentSearches(String? searchText) async {
    try {
      if (searchText == null) return;
      Set<String> allSearches =
          _prefs.getStringList(RECENT_SEARCH)?.toSet() ?? {};
      allSearches = {searchText, ...allSearches};
      await _prefs.setStringList(RECENT_SEARCH, allSearches.toList());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<String>?> getRecentSearchesLike(String? query) async {
    try {
      final allSearches = _prefs.getStringList(RECENT_SEARCH);
      return allSearches
          ?.where((search) => search.startsWith(query ?? ""))
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }
}
