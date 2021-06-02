import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/user.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUser extends UseCase<User, NoParams> {
  GetUser(this._repository);

  @override
  Future<Either<String, User>> call(NoParams params) {
    return _repository.getUser();
  }

  final Repository _repository;
}
