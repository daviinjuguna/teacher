import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teacher/features/data/models/course_model.dart';
import 'package:teacher/features/domain/entities/user.dart';

part 'course.freezed.dart';

@freezed
class Course with _$Course {
  const Course._();
  factory Course({
    required int id,
    required String title,
    required String desc,
    required String photo,
    int? appCount,
    bool? applied,
    User? teachedBy,
    int? currentPage,
    int? lastPage,
  }) = _Course;

  factory Course.fromModel(CourseModel c) => Course(
        id: c.id,
        title: c.title,
        desc: c.desc,
        photo: c.photo,
        appCount: c.appCount,
        applied: c.applied,
        currentPage: c.currentPage,
        lastPage: c.lastPage,
      );
}

extension CourseX on Course {
  CourseModel toModel() => CourseModel(
        id: id,
        title: title,
        desc: desc,
        photo: photo,
        appCount: appCount,
        applied: applied,
        currentPage: currentPage,
        lastPage: lastPage,
      );
}
