import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/domain/usecase/teacher/create_question.dart';
import 'package:teacher/domain/usecase/teacher/delete_question.dart';
import 'package:teacher/domain/usecase/teacher/edit_question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_question_event.dart';
part 'create_question_state.dart';
part 'create_question_bloc.freezed.dart';

@injectable
class CreateQuestionBloc
    extends Bloc<CreateQuestionEvent, CreateQuestionState> {
  CreateQuestionBloc(this._question, this._edit, this._delete)
      : super(CreateQuestionState.initial());
  final CreateQuestion _question;
  final EditQuestion _edit;
  final DeleteQuestion _delete;
  @override
  Stream<CreateQuestionState> mapEventToState(
    CreateQuestionEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
