import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("UserDataClass")
class UserTable extends Table {
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get status => text()();
  TextColumn get createdAt => text()();
}
