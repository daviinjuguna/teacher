import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:teacher/core/errors/exeptions.dart';
import 'package:teacher/database/app_database.dart';
import 'package:teacher/database/user/user_table.dart';
part 'user_dao.g.dart';

@UseDao(tables: [UserTable])
@lazySingleton
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future insertUser(UserDataClass user) =>
      into(userTable).insert(user).onError((error, stackTrace) {
        print("FAILED INSERT USER: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future<UserDataClass?> getUser() => select(userTable).getSingleOrNull();

  Future deleteAll() => delete(userTable).go().onError((error, stackTrace) {
        print("FAILED DELETE USER: $error, $stackTrace");
        throw DatabaseExeption();
      });
}
