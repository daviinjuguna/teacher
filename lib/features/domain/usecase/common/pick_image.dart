import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickImage extends UseCase<String, ParamsString> {
  PickImage(this._repository);

  @override
  Future<Either<String, String>> call(ParamsString params) {
    return _repository.fetchImageUrl(url: params.string);
  }

  final Repository _repository;
}
