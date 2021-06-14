import 'package:flutter/material.dart';
import 'package:teacher/features/domain/entities/course.dart';

typedef OnSearchChanged = Future<List<String>> Function(String);

class SearchCourse extends SearchDelegate<Course?> {
  final OnSearchChanged? _onSearchChanged;

  SearchCourse({OnSearchChanged? onSearchChanged, String? searchFieldLabel})
      : _onSearchChanged = onSearchChanged,
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
    return Container();
  }
}
