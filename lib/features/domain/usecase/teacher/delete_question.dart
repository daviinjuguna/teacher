import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/success.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteQuestion extends UseCase<Success, ParamsId> {
  DeleteQuestion(this._repository);

  @override
  Future<Either<String, Success>> call(ParamsId params) {
    return _repository.deleteQuestion(questionId: params.id);
  }

  final Repository _repository;
}
