import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/entities/user.dart';
import 'package:teacher/features/domain/usecase/common/get_user.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._user) : super(UserState.initial());
  final GetUser _user;

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        yield UserState.loading();
        final _res = await _user.call(NoParams());
        yield _res.fold((l) => UserState.error(l), (r) => UserState.success(r));
      },
    );
  }
}
