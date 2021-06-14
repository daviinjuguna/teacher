part of 'get_recent_cubit.dart';

@freezed
class GetRecentState with _$GetRecentState {
  const factory GetRecentState.initial() = _Initial;
  // const factory GetRecentState.load() = _Load;
  const factory GetRecentState.success(List<String>? string) = _Success;
  const factory GetRecentState.error() = _Error;
}
