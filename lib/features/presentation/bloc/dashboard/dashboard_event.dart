part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.getCourse({String? query, int? page}) = _Started;
  const factory DashboardEvent.getCoursePaginate({
    String? query,
    int? page,
    required List<Course> course,
  }) = _Paginate;
  const factory DashboardEvent.update({required KtList<Course> course}) =
      _Update;
}
