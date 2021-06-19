import 'dart:convert';

import 'package:moor/moor.dart';
import 'package:teacher/features/data/models/user_model.dart';

@DataClassName("CourseDataClass")
class CourseTable extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get desc => text()();
  TextColumn get photo => text().withDefault(Constant(""))();
  IntColumn get appCount => integer().nullable()();
  BoolColumn get applied => boolean().nullable()();
  TextColumn get teachedBy =>
      text().map(const UserModelConverter()).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class UserModelConverter extends TypeConverter<UserModel, String> {
  const UserModelConverter();

  @override
  UserModel? mapToDart(String? fromDb) {
    if (fromDb != null)
      return UserModel.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String? mapToSql(UserModel? user) {
    if (user != null) return json.encode(user.toJson());
  }
}
