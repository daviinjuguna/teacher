import 'package:moor/moor.dart';
import 'package:teacher/features/data/models/choice_model.dart';
import 'dart:convert';

@DataClassName("QuestionDataClass")
class QuestionTable extends Table {
  IntColumn get id => integer()();
  TextColumn get question => text()();
  TextColumn get answer =>
      text().map(const ChoiceModelConverter()).nullable()();
  TextColumn get choices =>
      text().map(const ListChoiceModelConverter()).nullable()();
  IntColumn get assignmentId => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class ListChoiceModelConverter
    extends TypeConverter<List<ChoiceModel>, String> {
  const ListChoiceModelConverter();
  @override
  List<ChoiceModel>? mapToDart(String? fromDb) {
    if (fromDb == null) return null;
    final _choice = json.decode(fromDb);
    return (_choice as List).map((e) => ChoiceModel.fromJson(e)).toList();
  }

  @override
  String? mapToSql(List<ChoiceModel>? value) {
    if (value != null) return json.encode(value.toList());
  }
}

class ChoiceModelConverter extends TypeConverter<ChoiceModel, String> {
  const ChoiceModelConverter();
  @override
  ChoiceModel? mapToDart(String? fromDb) {
    if (fromDb != null)
      return ChoiceModel.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String? mapToSql(ChoiceModel? value) {
    if (value != null) return json.encode(value.toJson());
  }
}
