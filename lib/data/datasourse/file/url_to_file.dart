import 'dart:io';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/data/datasourse/remote/remote_data_sorce.dart';
// import 'package:flutter/services.dart' show rootBundle;

abstract class UrlToFile {
  Future<File> urlToFile({required String url});
}

@LazySingleton(as: UrlToFile)
class UrlToFileImp implements UrlToFile {
  final RemoteDataSource _remote;

  UrlToFileImp(this._remote);

  @override
  Future<File> urlToFile({required String url}) async {
    try {
      final response = await _remote.fetchFileFromUrl(url: url);
      final _rdn = Random();
      final _tempDir =
          await getApplicationDocumentsDirectory().catchError((e, s) {
        print("GET TEMPORARY DIRECTORY ERROR: $e, $s");
        throw SelectFileException();
      });
      File _file = File(join(_tempDir.path, '${_rdn.nextInt(1000)}.png'));

      await _file.writeAsBytes(response.bodyBytes).catchError((e, s) {
        print("WRITE AS BYTES ERROR: $e, $s");
        throw SelectFileException();
      });
      return _file;
    } catch (e, s) {
      print("URL TO FILE ERROR: $e, $s");
      rethrow;
      // break;
    }
  }
}
