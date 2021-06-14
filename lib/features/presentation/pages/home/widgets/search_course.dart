import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher/features/domain/entities/course.dart';
import 'package:teacher/features/presentation/bloc/get_recent_searches/get_recent_cubit.dart';
import 'package:teacher/features/presentation/bloc/save_recent_searches/save_recent_cubit.dart';

typedef OnSearchChanged = Future<List<String>> Function(String);

class SearchCourse extends SearchDelegate<Course?> {
  final OnSearchChanged? _onSearchChanged;
  final SaveRecentCubit _saveCubit;
  final GetRecentCubit _getRecentCubit;

  SearchCourse({
    OnSearchChanged? onSearchChanged,
    String? searchFieldLabel,
    required GetRecentCubit getRecentCubit,
    required SaveRecentCubit saveCubit,
  })  : _onSearchChanged = onSearchChanged,
        _saveCubit = saveCubit,
        _getRecentCubit = getRecentCubit,
        super(searchFieldLabel: searchFieldLabel);

  List<String> _oldFilters = const [];

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
    return Container();
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
        itemBuilder: (c, i) => ListTile(),
      ),
    );
  }
}
