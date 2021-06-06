import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/pdf.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@lazySingleton
class UpdatePdf extends UseCase<KtList<Pdf>, ParamsId> {
  UpdatePdf(this._repository);

  @override
  Future<Either<String, KtList<Pdf>>> call(ParamsId params) {
    return _repository.updatePdf(courseId: params.id);
  }

  final Repository _repository;
}
