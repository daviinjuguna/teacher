import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/choice.dart';
import 'package:teacher/features/domain/usecase/common/get_choice.dart';
import 'package:teacher/features/domain/usecase/common/update_choice.dart';
import 'package:teacher/features/domain/usecase/teacher/sort_choice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'get_choice_event.dart';
part 'get_choice_state.dart';
part 'get_choice_bloc.freezed.dart';

@injectable
class GetChoiceBloc extends Bloc<GetChoiceEvent, GetChoiceState> {
  GetChoiceBloc(this._choice, this._sort, this._updateChoice)
      : super(GetChoiceState.initial());
  final GetChoice _choice;
  final SortChoice _sort;
  final UpdateChoice _updateChoice;

  @override
  Stream<GetChoiceState> mapEventToState(
    GetChoiceEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        yield GetChoiceState.loading();
        final _choices = await _choice.call(ParamsId(id: e.id));
        yield _choices.fold(
          (l) => GetChoiceState.error(message: l),
          (r) => GetChoiceState.success(course: r),
        );
      },
      update: (e) async* {
        yield GetChoiceState.updating();
        final _choices = await _updateChoice.call(ParamsId(id: e.id));
        yield _choices.fold(
          (l) => GetChoiceState.error(message: l),
          (r) => GetChoiceState.success(course: r),
        );
      },
      sort: (e) async* {
        yield GetChoiceState.loading();
        final _choices = await _sort.call(ParamsId(id: e.questionId));
        yield _choices.fold(
          (l) => GetChoiceState.error(message: l),
          (r) => GetChoiceState.success(course: r),
        );
      },
    );
  }
}
