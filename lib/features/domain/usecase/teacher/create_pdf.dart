import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/success.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreatePdf extends UseCase<Success, CreatePdfParams> {
  CreatePdf(this._repository);

  @override
  Future<Either<String, Success>> call(CreatePdfParams p) {
    return _repository.createPdf(
        courseId: p.courseId, title: p.title, pdf: p.pdf);
  }

  final Repository _repository;
}

class CreatePdfParams {
  final int courseId;
  final String title;
  final String pdf;
  CreatePdfParams({
    required this.courseId,
    required this.title,
    required this.pdf,
  });

  CreatePdfParams copyWith({
    int? courseId,
    String? title,
    String? pdf,
  }) {
    return CreatePdfParams(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      pdf: pdf ?? this.pdf,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreatePdfParams &&
        other.courseId == courseId &&
        other.title == title &&
        other.pdf == pdf;
  }

  @override
  int get hashCode => courseId.hashCode ^ title.hashCode ^ pdf.hashCode;

  @override
  String toString() =>
      'CreatePdfParams(courseId: $courseId, title: $title, pdf: $pdf)';
}
