import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/choice.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@lazySingleton
class UpdateChoice extends UseCase<KtList<Choice>, ParamsId> {
  UpdateChoice(this._repository);

  @override
  Future<Either<String, KtList<Choice>>> call(ParamsId params) {
    return _repository.updateChoice(questionId: params.id);
  }

  final Repository _repository;
}
