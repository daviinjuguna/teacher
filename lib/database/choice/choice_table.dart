import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("ChoiceDataClass")
class ChoiceTable extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  IntColumn get questionId => integer().nullable()();
  IntColumn get sort => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
