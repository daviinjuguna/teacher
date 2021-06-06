import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckConnection extends StreamUseCase<bool, NoParams> {
  CheckConnection(this._repository);

  @override
  Stream<Either<String, bool>> call(NoParams params) {
    return _repository.checkConnection();
  }

  final Repository _repository;
}
