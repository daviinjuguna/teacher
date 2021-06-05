import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/domain/entities/course.dart';
import 'package:teacher/domain/usecase/common/get_course.dart';
import 'package:teacher/domain/usecase/common/update_course.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._course, this._update) : super(DashboardState.initial());
  final GetCourse _course;
  final UpdateCourse _update;

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    yield* event.map(
      getCourse: (e) async* {
        yield DashboardState.loading();
        final _result = await _course.call(NoParams());
        yield _result.fold(
          (l) => DashboardState.error(message: l),
          (course) => DashboardState.success(course: course),
        );
      },
      update: (e) async* {
        yield DashboardState.updating(course: e.course);
        final _result = await _update.call(NoParams());
        yield _result.fold(
          (error) => DashboardState.success(course: e.course),
          (course) => DashboardState.success(course: course),
        );
      },
    );
  }
}
