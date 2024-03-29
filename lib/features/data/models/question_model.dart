import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:teacher/features/domain/entities/choice.dart';

import 'package:teacher/features/domain/entities/question.dart';

import 'choice_model.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const QuestionModel._();
  factory QuestionModel({
    @JsonKey(name: "id", required: true) required int id,
    @JsonKey(name: "question", required: true) required String question,
    @JsonKey(name: "answer") required ChoiceModel answer,
    // @JsonKey(name: "")requ
    @JsonKey(name: 'choices', required: true)
        required List<ChoiceModel> choices,
    @JsonKey(name: "assignment_id") int? assignmentId,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  factory QuestionModel.fromEntity(Question question) => QuestionModel(
        id: question.id,
        question: question.question,
        choices: question.choices.map((e) => e.toModel()).asList(),
        answer: question.answer.toModel(),
      );
}

extension QuestionModelX on QuestionModel {
  Question toEntity() => Question(
        id: id,
        question: question,
        choices: choices.map((e) => e.toEntity()).toImmutableList(),
        answer: answer.toEntity(),
      );
}
