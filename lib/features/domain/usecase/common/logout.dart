import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Logout extends UseCase<void, NoParams> {
  Logout(this._repository);

  @override
  Future<Either<String, void>> call(NoParams params) {
    return _repository.logout();
  }

  final Repository _repository;
}
