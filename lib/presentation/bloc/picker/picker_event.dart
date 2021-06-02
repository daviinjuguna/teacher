part of 'picker_bloc.dart';

@freezed
class PickerEvent with _$PickerEvent {
  const factory PickerEvent.pickFile() = _File;
  const factory PickerEvent.pickImage({required String imageLocation}) = _Image;
}
