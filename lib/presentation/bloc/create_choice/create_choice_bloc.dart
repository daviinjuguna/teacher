import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/domain/usecase/teacher/create_choice.dart';
import 'package:teacher/domain/usecase/teacher/delete_choice.dart';
import 'package:teacher/domain/usecase/teacher/edit_choice.dart';
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
    // TODO: implement mapEventToState
  }
}
