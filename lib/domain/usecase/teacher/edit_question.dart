import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/success.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditQuestion extends UseCase<Success, EditQuestionParams> {
  EditQuestion(this._repository);

  @override
  Future<Either<String, Success>> call(EditQuestionParams p) {
    return _repository.editQuestion(
      questionId: p.questionId,
      question: p.question,
      answer: p.answer,
    );
  }

  final Repository _repository;
}

class EditQuestionParams {
  final int questionId;
  final String? question;
  final String? answer;
  EditQuestionParams({
    required this.questionId,
    required this.question,
    required this.answer,
  });

  EditQuestionParams copyWith({
    int? questionId,
    String? question,
    String? answer,
  }) {
    return EditQuestionParams(
      questionId: questionId ?? this.questionId,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EditQuestionParams &&
        other.questionId == questionId &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => questionId.hashCode ^ question.hashCode ^ answer.hashCode;

  @override
  String toString() =>
      'EditQuestionParams(questionId: $questionId, question: $question, answer: $answer)';
}
