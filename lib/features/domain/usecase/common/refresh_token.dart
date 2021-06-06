import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/token.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RefreshToken extends UseCase<Token, NoParams> {
  RefreshToken(this._repository);

  @override
  Future<Either<String, Token>> call(NoParams p) {
    return _repository.refreshToken();
  }

  final Repository _repository;
}
