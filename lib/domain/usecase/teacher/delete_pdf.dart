import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/success.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeletePdf extends UseCase<Success, ParamsId> {
  DeletePdf(this._repository);

  @override
  Future<Either<String, Success>> call(ParamsId params) {
    return _repository.deletePdf(pdfId: params.id);
  }

  final Repository _repository;
}
