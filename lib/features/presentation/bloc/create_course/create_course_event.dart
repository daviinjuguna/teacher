part of 'create_course_bloc.dart';

@freezed
class CreateCourseEvent with _$CreateCourseEvent {
  const factory CreateCourseEvent.started({
    required String title,
    required String description,
    required String photo,
  }) = _Started;

  const factory CreateCourseEvent.edit({
    required int courseId,
    String? title,
    String? description,
    String? photo,
  }) = _Edit;

  const factory CreateCourseEvent.delete({
    required int courseId,
  }) = _Delete;
}
