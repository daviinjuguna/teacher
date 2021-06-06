import 'package:dartz/dartz.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/success.dart';

@lazySingleton
class CreateQuestion extends UseCase<Success, CreateQuestionParams> {
  CreateQuestion(this._repository);

  @override
  Future<Either<String, Success>> call(CreateQuestionParams p) {
    return _repository.createQuestion(
      assignmentId: p.assignmentId,
      question: p.question,
      answer: p.answer,
    );
  }

  final Repository _repository;
}

class CreateQuestionParams {
  final int assignmentId;
  final String question;
  final String answer;
  CreateQuestionParams({
    required this.assignmentId,
    required this.question,
    required this.answer,
  });

  CreateQuestionParams copyWith({
    int? assignmentId,
    String? question,
    String? answer,
  }) {
    return CreateQuestionParams(
      assignmentId: assignmentId ?? this.assignmentId,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateQuestionParams &&
        other.assignmentId == assignmentId &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode =>
      assignmentId.hashCode ^ question.hashCode ^ answer.hashCode;

  @override
  String toString() =>
      'CreateQuestionParams(assignmentId: $assignmentId, question: $question, answer: $answer)';
}
