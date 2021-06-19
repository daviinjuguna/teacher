import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/database/app_database.dart';
import 'package:teacher/database/choice/choice_table.dart';
import 'package:rxdart/rxdart.dart';

part 'choice_dao.g.dart';

@UseDao(tables: [ChoiceTable])
@lazySingleton
class ChoiceDao extends DatabaseAccessor<AppDatabase> with _$ChoiceDaoMixin {
  ChoiceDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future insertChoice(ChoiceDataClass choice) => into(choiceTable)
          .insert(choice, mode: InsertMode.insertOrReplace)
          .onError((error, stackTrace) {
        print("FAILED INSERT CHOICE: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Stream<List<ChoiceDataClass>> getChoice(int id) => (select(choiceTable)
            ..where((tbl) => tbl.questionId.equals(id))
            ..orderBy([(choice) => OrderingTerm(expression: choice.sort)]))
          .watch()
          .onErrorReturnWith((error, stackTrace) {
        print("FAILED GET CHOICE: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future deleteAll() => delete(choiceTable).go().onError((error, stackTrace) {
        print("FAILED DELETE CHOICE: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future deleteWhere(int id) =>
      (delete(choiceTable)..where((tbl) => tbl.questionId.equals(id)))
          .go()
          .onError((error, stackTrace) {
        print("FAILED DELETE CHOICE: $error, $stackTrace");
        throw DatabaseExeption();
      });
}
