import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/choice.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@lazySingleton
class GetChoice extends UseCase<KtList<Choice>, ParamsId> {
  GetChoice(this._repository);

  @override
  Future<Either<String, KtList<Choice>>> call(ParamsId params) {
    return _repository.getChoice(questionId: params.id);
  }

  final Repository _repository;
}
