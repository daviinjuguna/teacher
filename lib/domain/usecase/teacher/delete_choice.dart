import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/success.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteChoice extends UseCase<Success, ParamsId> {
  DeleteChoice(this._repository);

  @override
  Future<Either<String, Success>> call(ParamsId params) {
    return _repository.deleteChoice(choiceId: params.id);
  }

  final Repository _repository;
}
