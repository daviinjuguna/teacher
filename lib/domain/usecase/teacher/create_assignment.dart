import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/success.dart';
import 'package:teacher/domain/repository/eshule_repository.dart';

@lazySingleton
class CreateAssignment extends UseCase<Success, CreateAssignmentParams> {
  CreateAssignment(this._repository);

  @override
  Future<Either<String, Success>> call(CreateAssignmentParams p) {
    return _repository.createAssignment(courseId: p.id, title: p.title);
  }

  final Repository _repository;
}

class CreateAssignmentParams {
  final int id;
  final String title;
  CreateAssignmentParams({
    required this.id,
    required this.title,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateAssignmentParams &&
        other.id == id &&
        other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  @override
  String toString() => 'CreateAssignmentParams(id: $id, title: $title)';

  CreateAssignmentParams copyWith({
    int? id,
    String? title,
  }) {
    return CreateAssignmentParams(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
