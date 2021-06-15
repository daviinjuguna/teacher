import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/course_paginated.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';

@lazySingleton
class UpdateCourse extends UseCase<CoursePaginated, NoParams> {
  UpdateCourse(this._repository);

  @override
  Future<Either<String, CoursePaginated>> call(NoParams p) {
    return _repository.updateCourse();
  }

  final Repository _repository;
}
