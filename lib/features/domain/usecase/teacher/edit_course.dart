import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/success.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditCourse extends UseCase<Success, EditCourseParams> {
  EditCourse(this._repository);

  @override
  Future<Either<String, Success>> call(EditCourseParams params) {
    return _repository.editCourse(
      courseId: params.courseId,
      title: params.title,
      desc: params.description,
      photo: params.photo,
    );
  }

  final Repository _repository;
}

class EditCourseParams {
  final int courseId;
  String? title;
  String? description;
  String? photo;
  EditCourseParams({
    required this.courseId,
    this.title,
    this.description,
    this.photo,
  });

  @override
  String toString() {
    return 'EditCourseParams(courseId: $courseId, title: $title, description: $description, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EditCourseParams &&
        other.courseId == courseId &&
        other.title == title &&
        other.description == description &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return courseId.hashCode ^
        title.hashCode ^
        description.hashCode ^
        photo.hashCode;
  }

  EditCourseParams copyWith({
    int? courseId,
    String? title,
    String? description,
    String? photo,
  }) {
    return EditCourseParams(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      description: description ?? this.description,
      photo: photo ?? this.photo,
    );
  }
}
