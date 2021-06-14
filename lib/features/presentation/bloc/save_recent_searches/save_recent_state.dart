part of 'save_recent_cubit.dart';

@freezed
abstract class SaveRecentState with _$SaveRecentState {
  const factory SaveRecentState.initial() = _Initial;
  // const factory SaveRecentState.load() = _Load;
  const factory SaveRecentState.success() = _Success;
  const factory SaveRecentState.error(String message) = _Error;
}
