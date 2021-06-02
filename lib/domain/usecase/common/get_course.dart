import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/course.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

@lazySingleton
class GetCourse extends UseCase<KtList<Course>, NoParams> {
  GetCourse(this._repository);

  @override
  Future<Either<String, KtList<Course>>> call(NoParams params) {
    return _repository.getCourses();
  }

  final Repository _repository;
}
