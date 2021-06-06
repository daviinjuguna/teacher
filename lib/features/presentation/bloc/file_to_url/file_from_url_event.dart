part of 'file_from_url_bloc.dart';

@freezed
class FileFromUrlEvent with _$FileFromUrlEvent {
  const factory FileFromUrlEvent.started({required String url}) = _Started;
}
