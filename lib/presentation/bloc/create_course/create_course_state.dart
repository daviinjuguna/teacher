part of 'create_course_bloc.dart';

@freezed
class CreateCourseState with _$CreateCourseState {
  const factory CreateCourseState.initial() = _Initial;
  const factory CreateCourseState.loading() = _Load;
  const factory CreateCourseState.success({required String message}) = _Success;
  const factory CreateCourseState.error({required String message}) = _Error;
}
