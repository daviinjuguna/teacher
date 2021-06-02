part of 'create_pdf_bloc.dart';

@freezed
class CreatePdfState with _$CreatePdfState {
  const factory CreatePdfState.initial() = _Initial;
  const factory CreatePdfState.load() = _Load;
  const factory CreatePdfState.success(String message) = _Success;
  const factory CreatePdfState.error(String message) = _Error;
}
