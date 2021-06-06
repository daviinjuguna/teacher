part of 'create_choice_bloc.dart';

@freezed
class CreateChoiceState with _$CreateChoiceState {
  const factory CreateChoiceState.initial() = _Initial;
  const factory CreateChoiceState.load() = _Load;
  const factory CreateChoiceState.success(String message) = _Success;
  const factory CreateChoiceState.error(String message) = _Error;
}
