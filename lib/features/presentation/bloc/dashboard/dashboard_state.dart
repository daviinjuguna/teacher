part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Load;
  const factory DashboardState.paginating() = _Page;
  const factory DashboardState.success(
      {required KtList<Course> course,
      required int currentPage,
      required int lastPage}) = _Success;
  const factory DashboardState.updating({required KtList<Course> course}) =
      _Updating;
  const factory DashboardState.error({required String message}) = _Error;
  const factory DashboardState.paginatedError({required String message}) =
      _ErrorPaginated;
}
