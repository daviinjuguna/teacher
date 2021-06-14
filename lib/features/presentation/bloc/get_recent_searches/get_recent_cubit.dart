import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/usecase/common/get_recent_search.dart';

part 'get_recent_state.dart';
part 'get_recent_cubit.freezed.dart';

@injectable
class GetRecentCubit extends Cubit<GetRecentState> {
  GetRecentCubit(this._get) : super(GetRecentState.initial());
  final GetRecentSearch _get;

  void getRecentSearchesLike(String? query) async {
    final _res = await _get.call(ParamsStringNullable(string: query));
    emit(_res.fold(
      (l) => GetRecentState.error(),
      (r) => GetRecentState.success(r),
    ));
  }
}
