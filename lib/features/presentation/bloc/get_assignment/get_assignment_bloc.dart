import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/assignment.dart';
import 'package:teacher/features/domain/usecase/common/get_assignment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:teacher/features/domain/usecase/common/update_assignment.dart';

part 'get_assignment_event.dart';
part 'get_assignment_state.dart';
part 'get_assignment_bloc.freezed.dart';

@injectable
class GetAssignmentBloc extends Bloc<GetAssignmentEvent, GetAssignmentState> {
  GetAssignmentBloc(this._getAssignment, this._updateAssignment)
      : super(GetAssignmentState.initial());

  final GetAssignment _getAssignment;
  final UpdateAssignment _updateAssignment;
  @override
  Stream<GetAssignmentState> mapEventToState(
    GetAssignmentEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        yield GetAssignmentState.loading();
        final _assignment = await _getAssignment.call(ParamsId(id: e.id));
        yield _assignment.fold(
          (l) => GetAssignmentState.error(message: l),
          (r) => GetAssignmentState.success(assignment: r),
        );
      },
      update: (e) async* {
        yield GetAssignmentState.updating();
        final _assignment = await _updateAssignment.call(ParamsId(id: e.id));
        yield _assignment.fold(
          (l) => GetAssignmentState.error(message: l),
          (r) => GetAssignmentState.success(assignment: r),
        );
      },
    );
  }
}
