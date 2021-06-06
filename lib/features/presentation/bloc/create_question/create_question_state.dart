part of 'create_question_bloc.dart';

@freezed
class CreateQuestionState with _$CreateQuestionState {
  const factory CreateQuestionState.initial() = _Initial;
  const factory CreateQuestionState.load() = _Load;
  const factory CreateQuestionState.error(String message) = _Error;
  const factory CreateQuestionState.success(String message) = _Success;
}
