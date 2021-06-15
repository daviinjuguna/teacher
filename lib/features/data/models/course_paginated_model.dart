import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teacher/features/domain/entities/course.dart';
import 'package:teacher/features/domain/entities/course_paginated.dart';

import 'course_model.dart';

part 'course_paginated_model.freezed.dart';
part 'course_paginated_model.g.dart';

@freezed
class CoursePaginatedModel with _$CoursePaginatedModel {
  factory CoursePaginatedModel({
    @JsonKey(name: "current_page") required int currentPage,
    @JsonKey(name: "data") required List<CourseModel> course,
    @JsonKey(name: "last_page") required int lastPage,
  }) = _CoursePaginatedModel;

  factory CoursePaginatedModel.fromJson(Map<String, dynamic> json) =>
      _$CoursePaginatedModelFromJson(json);

  factory CoursePaginatedModel.fromEntity(CoursePaginated c) =>
      CoursePaginatedModel(
        lastPage: c.lastPage,
        currentPage: c.currentPage,
        course: c.course.map((e) => e.toModel()).toList(),
      );
}

extension CoursePaginatedModelX on CoursePaginatedModel {
  CoursePaginated toEntity() => CoursePaginated(
        currentPage: currentPage,
        course: course.map((e) => e.toEntity()).toList(),
        lastPage: lastPage,
      );
}
