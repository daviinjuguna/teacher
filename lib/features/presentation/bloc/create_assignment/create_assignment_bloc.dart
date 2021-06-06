import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/usecase/teacher/create_assignment.dart';
import 'package:teacher/features/domain/usecase/teacher/delete_assigment.dart';
import 'package:teacher/features/domain/usecase/teacher/edit_assignment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_assignment_event.dart';
part 'create_assignment_state.dart';
part 'create_assignment_bloc.freezed.dart';

@injectable
class CreateAssignmentBloc
    extends Bloc<CreateAssignmentEvent, CreateAssignmentState> {
  CreateAssignmentBloc(this._create, this._edit, this._delete)
      : super(CreateAssignmentState.initial());
  final CreateAssignment _create;
  final EditAssignment _edit;
  final DeleteAssignment _delete;

  @override
  Stream<CreateAssignmentState> mapEventToState(
    CreateAssignmentEvent event,
  ) async* {
    yield* event.map(
      create: (e) async* {
        yield CreateAssignmentState.load();
        final _res = await _create
            .call(CreateAssignmentParams(id: e.courseId, title: e.title));
        yield _res.fold(
          (l) => CreateAssignmentState.error(l),
          (r) => CreateAssignmentState.success(r.message),
        );
      },
      edit: (e) async* {
        yield CreateAssignmentState.load();
        final _res = await _edit
            .call(CreateAssignmentParams(id: e.assignmentId, title: e.title));
        yield _res.fold(
          (l) => CreateAssignmentState.error(l),
          (r) => CreateAssignmentState.success(r.message),
        );
      },
      delete: (e) async* {
        yield CreateAssignmentState.load();
        final _res = await _delete.call(ParamsId(id: e.assignmentId));
        yield _res.fold(
          (l) => CreateAssignmentState.error(l),
          (r) => CreateAssignmentState.success(r.message),
        );
      },
    );
  }
}
