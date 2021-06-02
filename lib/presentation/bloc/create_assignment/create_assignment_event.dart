part of 'create_assignment_bloc.dart';

@freezed
class CreateAssignmentEvent with _$CreateAssignmentEvent {
  const factory CreateAssignmentEvent.create({
    required int courseId,
    required String title,
  }) = _Started;

  const factory CreateAssignmentEvent.edit({
    required int assignmentId,
    required String title,
  }) = _Edit;

  const factory CreateAssignmentEvent.delete({
    required int assignmentId,
  }) = _Delete;
}
