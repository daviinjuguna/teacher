// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_paginated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoursePaginatedModel _$_$_CoursePaginatedModelFromJson(
    Map<String, dynamic> json) {
  return _$_CoursePaginatedModel(
    currentPage: json['current_page'] as int,
    course: (json['data'] as List<dynamic>)
        .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastPage: json['last_page'] as int,
  );
}

Map<String, dynamic> _$_$_CoursePaginatedModelToJson(
        _$_CoursePaginatedModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.course,
      'last_page': instance.lastPage,
    };
