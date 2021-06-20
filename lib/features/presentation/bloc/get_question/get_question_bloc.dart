import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/question.dart';
import 'package:teacher/features/domain/usecase/common/get_question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:teacher/features/domain/usecase/common/update_question.dart';

part 'get_question_event.dart';
part 'get_question_state.dart';
part 'get_question_bloc.freezed.dart';

@injectable
class GetQuestionBloc extends Bloc<GetQuestionEvent, GetQuestionState> {
  GetQuestionBloc(this._question, this._updateQuestion)
      : super(GetQuestionState.initial());
  final GetQuestion _question;
  final UpdateQuestion _updateQuestion;

  @override
  Stream<GetQuestionState> mapEventToState(
    GetQuestionEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        yield GetQuestionState.loading();
        final _questions = await _question.call(ParamsId(id: e.id));
        yield _questions.fold(
          (l) => GetQuestionState.error(message: l),
          (r) => GetQuestionState.success(question: r),
        );
      },
      update: (e) async* {
        yield GetQuestionState.updating();
        final _questions = await _updateQuestion.call(ParamsId(id: e.id));
        yield _questions.fold(
          (l) => GetQuestionState.error(message: l),
          (r) => GetQuestionState.success(question: r),
        );
      },
      refresh: (e) async* {
        yield GetQuestionState.refreshing();
        final _questions = await _updateQuestion.call(ParamsId(id: e.id));
        yield _questions.fold(
          (l) => GetQuestionState.error(message: l),
          (r) => GetQuestionState.success(question: r),
        );
      },
    );
  }
}
