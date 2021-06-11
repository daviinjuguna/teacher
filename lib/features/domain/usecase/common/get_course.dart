import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/course.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

@lazySingleton
class GetCourse extends UseCase<KtList<Course>, ParamsStringNullable> {
  GetCourse(this._repository);

  @override
  Future<Either<String, KtList<Course>>> call(ParamsStringNullable params) {
    return _repository.getCourses(query: params.string);
  }

  final Repository _repository;
}
