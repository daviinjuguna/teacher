import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';

@lazySingleton
class SaveToRecent extends UseCase<dynamic, ParamsStringNullable> {
  SaveToRecent(this._repository);

  @override
  Future<Either<String, dynamic>> call(ParamsStringNullable p) {
    return _repository.saveToRecentSearches(p.string);
  }

  final Repository _repository;
}
