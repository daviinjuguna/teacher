import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/database/app_database.dart';

import 'assignment_table.dart';

part 'assignment_dao.g.dart';

@UseDao(tables: [AssignmentTable])
@lazySingleton
class AssignmentDao extends DatabaseAccessor<AppDatabase>
    with _$AssignmentDaoMixin {
  AssignmentDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future insertAss(AssignmentDataClass ass) =>
      into(assignmentTable).insert(ass).onError((error, stackTrace) {
        print("FAILED INSERT ASS: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future<List<AssignmentDataClass>> getAss(int id) =>
      (select(assignmentTable)..where((tbl) => tbl.courseId.equals(id)))
          .get()
          .onError((error, stackTrace) {
        print("FAILED GET ASS: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future deleteAll() =>
      delete(assignmentTable).go().onError((error, stackTrace) {
        print("FAILED DELETE ASS: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future deleteWhere(int id) =>
      (delete(assignmentTable)..where((tbl) => tbl.courseId.equals(id)))
          .go()
          .onError((error, stackTrace) {
        print("FAILED DELETE ASS: $error, $stackTrace");
        throw DatabaseExeption();
      });
}
