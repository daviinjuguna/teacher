import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

class ChoiceTable extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  @override
  Set<Column> get primaryKey => {id};
}
