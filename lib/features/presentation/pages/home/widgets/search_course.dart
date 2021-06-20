import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/features/domain/entities/course.dart';
import 'package:teacher/features/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:teacher/features/presentation/bloc/get_recent_searches/get_recent_cubit.dart';
import 'package:teacher/features/presentation/bloc/save_recent_searches/save_recent_cubit.dart';

class SearchCourse extends SearchDelegate<Course?> {
  final GetRecentCubit _getRecentCubit;
  final DashboardBloc _dashboardBloc;
  final SaveRecentCubit _saveRecentCubit;

  SearchCourse({
    String? searchFieldLabel,
    required GetRecentCubit getRecentCubit,
    required DashboardBloc dashboardBloc,
    required SaveRecentCubit saveRecentCubit,
  })  : _getRecentCubit = getRecentCubit,
        _dashboardBloc = dashboardBloc,
        _saveRecentCubit = saveRecentCubit,
        super(searchFieldLabel: searchFieldLabel);

  List<String> _oldFilters = const [];
  KtList<Course> _course = emptyList();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    _saveRecentCubit.saveToRecentSearches(query);
    _dashboardBloc.add(DashboardEvent.getCourse(query: query));
    return BlocConsumer(
      bloc: _dashboardBloc,
      listener: (context, DashboardState state) {
        state.maybeMap(
            orElse: () {},
            success: (state) {
              _course = state.course;
            });
      },
      builder: (context, DashboardState state) {
        return state.map(
          paginating: (state) => Center(
            child: CircularProgressIndicator(),
          ),
          initial: (state) => Container(),
          loading: (state) => Center(
            child: CircularProgressIndicator(),
          ),
          success: (state) => _course.isEmpty()
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    children: [
                      LottieBuilder.asset(
                        "assets/lottie/empty.json",
                        repeat: true,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _course.size,
                  itemBuilder: (c, i) => GestureDetector(
                    onTap: () => close(context, _course[i]),
                    child: Card(
                      margin: EdgeInsets.all(3),
                      elevation: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                // height: double.maxFinite,
                                child: Image.network(
                                  FILE_URL + _course[i].photo,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    // Appropriate logging or analytics, e.g.
                                    // myAnalytics.recordError(
                                    //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                                    //   exception,
                                    //   stackTrace,
                                    // );
                                    return const Text('😢');
                                  },
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_course[i].title}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "${_course[i].desc}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          error: (state) => Container(
            child: MaterialButton(
              onPressed: () =>
                  _dashboardBloc.add(DashboardEvent.getCourse(query: query)),
              child: Text("RETRY"),
            ),
          ),
          updating: (state) => Center(
            child: CircularProgressIndicator(),
          ),
          paginatedError: (value) => Container(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _getRecentCubit.getRecentSearchesLike(query);
    return BlocConsumer(
      bloc: _getRecentCubit,
      listener: (context, GetRecentState state) {
        state.maybeMap(
          orElse: () {},
          success: (state) {
            _oldFilters = state.string ?? [];
          },
        );
      },
      builder: (context, GetRecentState state) => ListView.builder(
        itemCount: _oldFilters.length,
        itemBuilder: (c, i) => Padding(
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text(
              "${_oldFilters[i]}",
            ),
            onTap: () {
              query = "${_oldFilters[i]}";
            },
          ),
        ),
      ),
    );
  }
}
