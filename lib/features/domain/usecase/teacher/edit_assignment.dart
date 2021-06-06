import 'package:dartz/dartz.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/success.dart';
import 'package:teacher/features/domain/repository/eshule_repository.dart';
import 'package:teacher/features/domain/usecase/teacher/create_assignment.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditAssignment extends UseCase<Success, CreateAssignmentParams> {
  EditAssignment(this._repository);

  @override
  Future<Either<String, Success>> call(CreateAssignmentParams p) {
    return _repository.editAssignment(assignmentId: p.id, title: p.title);
  }

  final Repository _repository;
}
