import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickMultipleFile extends UseCase<List<String?>, NoParams> {
  PickMultipleFile(this._repository);

  final Repository _repository;

  @override
  Future<Either<String, List<String?>>> call(NoParams params) {
    return _repository.pickMultipleFiles();
  }
}
