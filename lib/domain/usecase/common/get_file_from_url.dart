import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFileFromUrl extends UseCase<File, ParamsString> {
  GetFileFromUrl(this._repository);

  @override
  Future<Either<String, File>> call(ParamsString params) {
    return _repository.urlToFile(url: params.string);
  }

  final Repository _repository;
}
