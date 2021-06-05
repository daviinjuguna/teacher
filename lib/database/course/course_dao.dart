import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/database/app_database.dart';
import 'package:teacher/database/course/course_table.dart';

part 'course_dao.g.dart';

@UseDao(tables: [CourseTable])
@lazySingleton
class CourseDao extends DatabaseAccessor<AppDatabase> with _$CourseDaoMixin {
  CourseDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future insertCourse(CourseDataClass course) =>
      into(courseTable).insert(course).onError((error, stackTrace) {
        print("FAILED INSERT COURSE: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future<List<CourseDataClass>> getCourse() =>
      select(courseTable).get().onError((error, stackTrace) {
        print("FAILED GET COURSE: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future deleteAll() => delete(courseTable).go().onError((error, stackTrace) {
        print("FAILED DELETE COURSE: $error, $stackTrace");
        throw DatabaseExeption();
      });
}
