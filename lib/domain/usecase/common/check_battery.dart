import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';

@lazySingleton
class CheckBattery extends StreamUseCase<String, NoParams> {
  CheckBattery(this._repository);

  @override
  Stream<Either<String, String>> call(NoParams params) {
    return _repository.checkBattery();
  }

  final Repository _repository;
}
