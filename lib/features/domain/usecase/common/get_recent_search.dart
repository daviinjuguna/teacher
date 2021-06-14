import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';

@lazySingleton
class GetRecentSearch extends UseCase<List<String>?, ParamsStringNullable> {
  GetRecentSearch(this._repository);

  @override
  Future<Either<String, List<String>?>> call(ParamsStringNullable p) {
    return _repository.getRecentSearchesLike(p.string);
  }

  final Repository _repository;
}
