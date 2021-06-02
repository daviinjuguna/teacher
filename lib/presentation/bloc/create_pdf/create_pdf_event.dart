part of 'create_pdf_bloc.dart';

@freezed
class CreatePdfEvent with _$CreatePdfEvent {
  const factory CreatePdfEvent.create({
    required int courseId,
    required String title,
    required String pdf,
  }) = _Started;

  const factory CreatePdfEvent.edit({
    required int pdfId,
    String? title,
    String? pdf,
  }) = _Edit;

  const factory CreatePdfEvent.delete({required int pdfId}) = _Delete;
}
