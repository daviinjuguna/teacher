import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/course.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';

@lazySingleton
class UpdateCourse extends UseCase<KtList<Course>, NoParams> {
  UpdateCourse(this._repository);

  @override
  Future<Either<String, KtList<Course>>> call(NoParams p) {
    return _repository.updateCourse();
  }

  final Repository _repository;
}
