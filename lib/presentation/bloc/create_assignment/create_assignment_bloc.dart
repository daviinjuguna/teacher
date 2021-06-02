import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/domain/usecase/teacher/create_assignment.dart';
import 'package:teacher/domain/usecase/teacher/delete_assigment.dart';
import 'package:teacher/domain/usecase/teacher/edit_assignment.dart';
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
    // TODO: implement mapEventToState
  }
}
