part of 'create_assignment_bloc.dart';

@freezed
class CreateAssignmentState with _$CreateAssignmentState {
  const factory CreateAssignmentState.initial() = _Initial;
  const factory CreateAssignmentState.load() = _Load;
  const factory CreateAssignmentState.success(String message) = _Success;
  const factory CreateAssignmentState.error(String message) = _Error;
}
