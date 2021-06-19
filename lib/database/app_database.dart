import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:teacher/database/assignment/assignment_dao.dart';
import 'package:teacher/database/assignment/assignment_table.dart';
import 'package:teacher/database/choice/choice_dao.dart';
import 'package:teacher/database/choice/choice_table.dart';
import 'package:teacher/database/course/course_dao.dart';
import 'package:teacher/database/course/course_table.dart';
import 'package:teacher/database/pdf/pdf_dao.dart';
import 'package:teacher/database/pdf/pdf_table.dart';
import 'package:teacher/database/question/question_dao.dart';
import 'package:teacher/database/question/question_table.dart';
import 'package:teacher/database/user/user_dao.dart';
import 'package:teacher/database/user/user_table.dart';
import 'package:teacher/features/data/models/attempted_model.dart';
import 'package:teacher/features/data/models/choice_model.dart';
import 'package:teacher/features/data/models/user_model.dart';

part 'app_database.g.dart';

//*LOCAL DATABASE CACHE
@UseMoor(
  tables: [
    CourseTable,
    UserTable,
    AssignmentTable,
    PdfTable,
    QuestionTable,
    ChoiceTable,
  ],
  daos: [CourseDao, UserDao, AssignmentDao, PdfDao, QuestionDao, ChoiceDao],
)
@lazySingleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection()) {
    moorRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}
