import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/success.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateCourse extends UseCase<Success, CreateCourseParams> {
  CreateCourse(this._repository);

  @override
  Future<Either<String, Success>> call(CreateCourseParams params) {
    return _repository.createCourse(
      title: params.title,
      desc: params.description,
      photo: params.photo,
    );
  }

  final Repository _repository;
}

class CreateCourseParams {
  final String title;
  final String description;
  final String photo;
  CreateCourseParams({
    required this.title,
    required this.description,
    required this.photo,
  });

  @override
  String toString() =>
      'CreateCourseParams(title: $title, description: $description, photo: $photo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateCourseParams &&
        other.title == title &&
        other.description == description &&
        other.photo == photo;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ photo.hashCode;

  CreateCourseParams copyWith({
    String? title,
    String? description,
    String? photo,
  }) {
    return CreateCourseParams(
      title: title ?? this.title,
      description: description ?? this.description,
      photo: photo ?? this.photo,
    );
  }
}
