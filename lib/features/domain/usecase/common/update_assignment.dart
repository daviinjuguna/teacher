import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/assignment.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';

@lazySingleton
class UpdateAssignment extends UseCase<KtList<Assignment>, ParamsId> {
  UpdateAssignment(this._repository);

  @override
  Future<Either<String, KtList<Assignment>>> call(ParamsId params) {
    return _repository.updateAssignment(courseId: params.id);
  }

  final Repository _repository;
}
