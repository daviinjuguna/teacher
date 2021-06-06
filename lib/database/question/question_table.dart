import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:teacher/features/data/models/choice_model.dart';
import 'dart:convert';

class QuestionTable extends Table {
  IntColumn get id => integer()();
  TextColumn get question => text()();
  TextColumn get choices =>
      text().map(const ChoiceModelConverter()).nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class ChoiceModelConverter extends TypeConverter<List<ChoiceModel>, String> {
  const ChoiceModelConverter();
  @override
  List<ChoiceModel>? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    final _choice = json.decode(fromDb);
    return (_choice as List).map((e) => ChoiceModel.fromJson(e)).toList();
  }

  @override
  String? mapToSql(List<ChoiceModel>? value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toList());
  }
}
