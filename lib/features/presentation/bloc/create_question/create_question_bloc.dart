import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/usecase/teacher/create_question.dart';
import 'package:teacher/features/domain/usecase/teacher/delete_question.dart';
import 'package:teacher/features/domain/usecase/teacher/edit_course.dart';
import 'package:teacher/features/domain/usecase/teacher/edit_question.dart';
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
    yield* event.map(
      create: (e) async* {
        yield CreateQuestionState.load();
        final _res = await _question.call(CreateQuestionParams(
            assignmentId: e.assignmentId,
            question: e.question,
            answer: e.answer));
        yield _res.fold(
          (l) => CreateQuestionState.error(l),
          (r) => CreateQuestionState.success(r.message),
        );
      },
      edit: (e) async* {
        yield CreateQuestionState.load();
        final _res = await _edit.call(EditQuestionParams(
            questionId: e.questionId, question: e.question, answer: e.answer));
        yield _res.fold(
          (l) => CreateQuestionState.error(l),
          (r) => CreateQuestionState.success(r.message),
        );
      },
      delete: (e) async* {
        yield CreateQuestionState.load();
        final _res = await _delete.call(ParamsId(id: e.questionId));
        yield _res.fold(
          (l) => CreateQuestionState.error(l),
          (r) => CreateQuestionState.success(r.message),
        );
      },
    );
  }
}
