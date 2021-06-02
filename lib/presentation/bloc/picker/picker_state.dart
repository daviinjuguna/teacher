part of 'picker_bloc.dart';

@freezed
class PickerState with _$PickerState {
  const factory PickerState.initial() = _Initial;
  const factory PickerState.loading() = _Load;
  const factory PickerState.success({required String file}) = _Succes;
  const factory PickerState.error({required String message}) = _Error;
}
