import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/usecase/teacher/create_course.dart';
import 'package:teacher/features/domain/usecase/teacher/delete_course.dart';
import 'package:teacher/features/domain/usecase/teacher/edit_course.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_course_event.dart';
part 'create_course_state.dart';
part 'create_course_bloc.freezed.dart';

@injectable
class CreateCourseBloc extends Bloc<CreateCourseEvent, CreateCourseState> {
  CreateCourseBloc(this._course, this._edit, this._delete)
      : super(CreateCourseState.initial());
  final CreateCourse _course;
  final EditCourse _edit;
  final DeleteCourse _delete;

  @override
  Stream<CreateCourseState> mapEventToState(
    CreateCourseEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        yield CreateCourseState.loading();
        final _res = await _course.call(
          CreateCourseParams(
            title: e.title,
            description: e.description,
            photo: e.photo,
          ),
        );
        yield _res.fold(
          (l) => CreateCourseState.error(message: l),
          (r) => CreateCourseState.success(message: r.message),
        );
      },
      edit: (e) async* {
        yield CreateCourseState.loading();
        final _res = await _edit.call(
          EditCourseParams(
            courseId: e.courseId,
            title: e.title,
            description: e.description,
            photo: e.photo,
          ),
        );
        yield _res.fold(
          (l) => CreateCourseState.error(message: l),
          (r) => CreateCourseState.success(message: r.message),
        );
      },
      delete: (e) async* {
        yield CreateCourseState.loading();
        final _res = await _delete.call(ParamsId(id: e.courseId));
        yield _res.fold(
          (l) => CreateCourseState.error(message: l),
          (r) => CreateCourseState.success(message: r.message),
        );
      },
    );
  }
}
