import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/usecase/common/save_to_resent.dart';

part 'save_recent_state.dart';
part 'save_recent_cubit.freezed.dart';

@injectable
class SaveRecentCubit extends Cubit<SaveRecentState> {
  SaveRecentCubit(this._save) : super(SaveRecentState.initial());
  final SaveToRecent _save;

  void saveToRecentSearches(String? searchTex) async {
    final _res = await _save.call(ParamsStringNullable(string: searchTex));
    emit(_res.fold(
      (l) => SaveRecentState.error(l),
      (r) => SaveRecentState.success(),
    ));
  }
}
