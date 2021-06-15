import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teacher/features/data/models/course_model.dart';
import 'package:teacher/features/data/models/course_paginated_model.dart';
import 'package:teacher/features/domain/entities/course.dart';

part 'course_paginated.freezed.dart';

@freezed
class CoursePaginated with _$CoursePaginated {
  factory CoursePaginated({
    required int currentPage,
    required List<Course> course,
    required int lastPage,
  }) = _CoursePaginated;

  factory CoursePaginated.fromModel(CoursePaginatedModel c) => CoursePaginated(
        currentPage: c.currentPage,
        course: c.course.map((e) => e.toEntity()).toList(),
        lastPage: c.lastPage,
      );
}

extension CoursePaginatedX on CoursePaginated {
  CoursePaginatedModel toModel() => CoursePaginatedModel(
        currentPage: currentPage,
        course: course.map((e) => e.toModel()).toList(),
        lastPage: lastPage,
      );
}
