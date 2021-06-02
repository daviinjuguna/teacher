import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/success.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteAssignment extends UseCase<Success, ParamsId> {
  DeleteAssignment(this._repository);

  @override
  Future<Either<String, Success>> call(ParamsId params) {
    return _repository.deleteAssignment(assignmentId: params.id);
  }

  final Repository _repository;
}
