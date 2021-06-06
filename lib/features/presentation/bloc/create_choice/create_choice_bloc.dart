import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/usecase/teacher/create_assignment.dart';
import 'package:teacher/features/domain/usecase/teacher/create_choice.dart';
import 'package:teacher/features/domain/usecase/teacher/delete_choice.dart';
import 'package:teacher/features/domain/usecase/teacher/edit_choice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_choice_event.dart';
part 'create_choice_state.dart';
part 'create_choice_bloc.freezed.dart';

@injectable
class CreateChoiceBloc extends Bloc<CreateChoiceEvent, CreateChoiceState> {
  CreateChoiceBloc(this._create, this._edit, this._choice)
      : super(CreateChoiceState.initial());
  final CreateChoice _create;
  final EditChoice _edit;
  final DeleteChoice _choice;

  @override
  Stream<CreateChoiceState> mapEventToState(
    CreateChoiceEvent event,
  ) async* {
    yield* event.map(
      create: (e) async* {
        yield CreateChoiceState.load();
        final _res = await _create
            .call(CreateAssignmentParams(id: e.questionId, title: e.title));
        yield _res.fold(
          (l) => CreateChoiceState.error(l),
          (r) => CreateChoiceState.success(r.message),
        );
      },
      edit: (e) async* {
        yield CreateChoiceState.load();
        final _res = await _edit
            .call(CreateAssignmentParams(id: e.choiceId, title: e.title));
        yield _res.fold(
          (l) => CreateChoiceState.error(l),
          (r) => CreateChoiceState.success(r.message),
        );
      },
      delete: (e) async* {
        yield CreateChoiceState.load();
        final _res = await _choice.call(ParamsId(id: e.choiceId));
        yield _res.fold(
          (l) => CreateChoiceState.error(l),
          (r) => CreateChoiceState.success(r.message),
        );
      },
    );
  }
}
