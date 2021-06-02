import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/assignment.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@lazySingleton
class GetAssignment extends UseCase<KtList<Assignment>, ParamsId> {
  GetAssignment(this._repository);

  @override
  Future<Either<String, KtList<Assignment>>> call(ParamsId params) {
    return _repository.getAssignment(courseId: params.id);
  }

  final Repository _repository;
}
