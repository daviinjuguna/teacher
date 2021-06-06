part of 'create_question_bloc.dart';

@freezed
class CreateQuestionEvent with _$CreateQuestionEvent {
  const factory CreateQuestionEvent.create({
    required int assignmentId,
    required String question,
    required String answer,
  }) = _Started;

  const factory CreateQuestionEvent.edit({
    required int questionId,
    String? question,
    String? answer,
  }) = _Edit;

  const factory CreateQuestionEvent.delete({
    required int questionId,
  }) = _Delete;
}
