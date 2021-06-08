import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/success.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';

@lazySingleton
class SetAnswer extends UseCase<Success, SetAnswerParams> {
  final Repository _repository;

  SetAnswer(this._repository);

  @override
  Future<Either<String, Success>> call(SetAnswerParams p) {
    return _repository.selectAnswer(
      choiceId: p.choiceId,
      questionId: p.questionId,
    );
  }
}

class SetAnswerParams {
  final int choiceId;
  final int questionId;
  SetAnswerParams({
    required this.choiceId,
    required this.questionId,
  });

  @override
  String toString() =>
      'SetAnswerParams(choiceId: $choiceId, questionId: $questionId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SetAnswerParams &&
        other.choiceId == choiceId &&
        other.questionId == questionId;
  }

  @override
  int get hashCode => choiceId.hashCode ^ questionId.hashCode;

  SetAnswerParams copyWith({
    int? choiceId,
    int? questionId,
  }) {
    return SetAnswerParams(
      choiceId: choiceId ?? this.choiceId,
      questionId: questionId ?? this.questionId,
    );
  }
}
