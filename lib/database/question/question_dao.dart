import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/database/app_database.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:teacher/database/question/question_table.dart';

part 'question_dao.g.dart';

@UseDao(tables: [QuestionTable])
@lazySingleton
class QuestionDao extends DatabaseAccessor<AppDatabase>
    with _$QuestionDaoMixin {
  QuestionDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future insertQuestion(QuestionDataClass quesion) =>
      into(questionTable).insert(quesion).onError((error, stackTrace) {
        print("FAILED INSERT QUESTION: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future<List<QuestionDataClass>> getQuestion(int id) =>
      (select(questionTable)..where((tbl) => tbl.assignmentId.equals(id)))
          .get()
          .onError((error, stackTrace) {
        print("FAILED GET QUESTION: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future deleteAll() => delete(questionTable).go().onError((error, stackTrace) {
        print("FAILED DELETE QUESTION: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future deleteWhere(int id) =>
      (delete(questionTable)..where((tbl) => tbl.assignmentId.equals(id)))
          .go()
          .onError((error, stackTrace) {
        print("FAILED DELETE QUESTION: $error, $stackTrace");
        throw DatabaseExeption();
      });
}
