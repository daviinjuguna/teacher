import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/success.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditPdf extends UseCase<Success, EditPdfParams> {
  EditPdf(this._repository);

  @override
  Future<Either<String, Success>> call(EditPdfParams p) {
    return _repository.editPdf(pdfId: p.pdfId, title: p.title, pdf: p.pdf);
  }

  final Repository _repository;
}

class EditPdfParams {
  final int pdfId;
  final String? title;
  final String? pdf;
  EditPdfParams({
    required this.pdfId,
    required this.title,
    required this.pdf,
  });

  EditPdfParams copyWith({
    int? pdfId,
    String? title,
    String? pdf,
  }) {
    return EditPdfParams(
      pdfId: pdfId ?? this.pdfId,
      title: title ?? this.title,
      pdf: pdf ?? this.pdf,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EditPdfParams &&
        other.pdfId == pdfId &&
        other.title == title &&
        other.pdf == pdf;
  }

  @override
  int get hashCode => pdfId.hashCode ^ title.hashCode ^ pdf.hashCode;

  @override
  String toString() => 'EditPdfParams(pdfId: $pdfId, title: $title, pdf: $pdf)';
}
