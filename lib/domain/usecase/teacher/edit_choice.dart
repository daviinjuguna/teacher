import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/success.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';
import 'package:teacher/domain/usecase/teacher/create_assignment.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditChoice extends UseCase<Success, CreateAssignmentParams> {
  EditChoice(this._repository);

  @override
  Future<Either<String, Success>> call(CreateAssignmentParams p) {
    return _repository.editChoice(choiceId: p.id, title: p.title);
  }

  final Repository _repository;
}
