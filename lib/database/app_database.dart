import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:teacher/database/assignment/assignment_dao.dart';
import 'package:teacher/database/assignment/assignment_table.dart';
import 'package:teacher/database/choice/choice_table.dart';
import 'package:teacher/database/course/course_dao.dart';
import 'package:teacher/database/course/course_table.dart';
import 'package:teacher/database/pdf/pdf_dao.dart';
import 'package:teacher/database/pdf/pdf_table.dart';
import 'package:teacher/database/question/question_table.dart';
import 'package:teacher/database/user/user_dao.dart';
import 'package:teacher/database/user/user_table.dart';
import 'package:teacher/features/data/models/attempted_model.dart';
import 'package:teacher/features/data/models/user_model.dart';
import 'package:teacher/features/data/models/choice_model.dart';

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
  daos: [CourseDao, UserDao, AssignmentDao, PdfDao],
)
@lazySingleton
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          (FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
          )),
        ) {
    moorRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  }

  @override
  int get schemaVersion => 1;
}
