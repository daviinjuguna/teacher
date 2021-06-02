part of 'get_choice_bloc.dart';

@freezed
class GetChoiceEvent with _$GetChoiceEvent {
  const factory GetChoiceEvent.started({required int id}) = _Started;
  const factory GetChoiceEvent.update({required int id}) = _Update;
  const factory GetChoiceEvent.sort({required int questionId}) = _Sort;
}
