part of 'file_from_url_bloc.dart';

@freezed
class FileFromUrlState with _$FileFromUrlState {
  const factory FileFromUrlState.initial() = _Initial;
  const factory FileFromUrlState.loading() = _Load;
  const factory FileFromUrlState.success({required File file}) = _Success;
  const factory FileFromUrlState.error({required String message}) = _Error;
}
