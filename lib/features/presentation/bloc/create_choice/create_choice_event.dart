part of 'create_choice_bloc.dart';

@freezed
class CreateChoiceEvent with _$CreateChoiceEvent {
  const factory CreateChoiceEvent.create({
    required int questionId,
    required String title,
  }) = _Started;
  const factory CreateChoiceEvent.edit({
    required int choiceId,
    required String title,
  }) = _Edit;
  const factory CreateChoiceEvent.delete({
    required int choiceId,
  }) = _Delete;

  const factory CreateChoiceEvent.setAnswer({
    required int choiceId,
    required int questionId,
  }) = _SetAns;
}
