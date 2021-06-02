import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';

@lazySingleton
class CheckAuth extends UseCase<bool, NoParams> {
  CheckAuth(this._repository);

  @override
  Future<Either<String, bool>> call(NoParams params) {
    return _repository.checkAuth();
  }

  final Repository _repository;
}
