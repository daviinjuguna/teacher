import 'dart:convert';

import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:teacher/features/data/models/attempted_model.dart';

@DataClassName("AssignmentDataClass")
class AssignmentTable extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  IntColumn get questions => integer().nullable()();
  TextColumn get attempted =>
      text().map(const AttemptedModelConverter()).nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class AttemptedModelConverter extends TypeConverter<AttemptedModel, String> {
  const AttemptedModelConverter();

  @override
  AttemptedModel? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return AttemptedModel.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String? mapToSql(AttemptedModel? user) {
    if (user == null) {
      return null;
    }
    return json.encode(user.toJson());
  }
}
