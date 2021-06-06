import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickFile extends UseCase<String?, NoParams> {
  PickFile(this._repository);

  @override
  Future<Either<String, String?>> call(NoParams params) {
    return _repository.pickFiles();
  }

  final Repository _repository;
}
