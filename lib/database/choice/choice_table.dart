import 'package:moor/moor.dart';

@DataClassName("ChoiceDataClass")
class ChoiceTable extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  IntColumn get questionId => integer().nullable()();
  IntColumn get sort => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
