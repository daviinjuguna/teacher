import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/errors/exeptions.dart';

abstract class FileDataSource {
  Future<String?> selectFile();
  Future<List<String?>> selectMultipleFiles();
}

@LazySingleton(as: FileDataSource)
class FileDataSourceImpl implements FileDataSource {
  final FilePicker _filePicker;

  FileDataSourceImpl(this._filePicker);
  @override
  Future<String?> selectFile() async {
    try {
      final file = await _filePicker.pickFiles(
        allowedExtensions: ['pdf'],
        type: FileType.custom,
      );
      if (file != null) {
        return file.files.single.path;
      } else {
        throw SelectFileException();
      }
    } catch (e) {
      print(e.toString());
      throw SelectFileFromPhoneExeption();
    }
  }

  @override
  Future<List<String?>> selectMultipleFiles() async {
    try {
      final file = await _filePicker.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (file != null) {
        return file.files.map((single) => single.path).toList();
      } else {
        throw SelectFileException();
      }
    } catch (e) {
      print(e.toString());
      throw SelectFileFromPhoneExeption();
    }
  }
}
