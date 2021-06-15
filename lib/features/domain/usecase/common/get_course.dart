import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/course_paginated.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';

@lazySingleton
class GetCourse extends UseCase<CoursePaginated, GetCourseParams> {
  GetCourse(this._repository);

  @override
  Future<Either<String, CoursePaginated>> call(GetCourseParams p) {
    return _repository.getCourses(query: p.query, page: p.page);
  }

  final Repository _repository;
}

class GetCourseParams {
  final String? query;
  final int? page;
  GetCourseParams({
    this.query,
    this.page,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetCourseParams &&
        other.query == query &&
        other.page == page;
  }

  @override
  int get hashCode => query.hashCode ^ page.hashCode;

  GetCourseParams copyWith({
    String? query,
    int? page,
  }) {
    return GetCourseParams(
      query: query ?? this.query,
      page: page ?? this.page,
    );
  }

  @override
  String toString() => 'GetCourseParams(query: $query, page: $page)';
}
