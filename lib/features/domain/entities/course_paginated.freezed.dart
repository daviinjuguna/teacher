// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'course_paginated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CoursePaginatedTearOff {
  const _$CoursePaginatedTearOff();

  _CoursePaginated call(
      {required int currentPage,
      required List<Course> course,
      required int lastPage}) {
    return _CoursePaginated(
      currentPage: currentPage,
      course: course,
      lastPage: lastPage,
    );
  }
}

/// @nodoc
const $CoursePaginated = _$CoursePaginatedTearOff();

/// @nodoc
mixin _$CoursePaginated {
  int get currentPage => throw _privateConstructorUsedError;
  List<Course> get course => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoursePaginatedCopyWith<CoursePaginated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoursePaginatedCopyWith<$Res> {
  factory $CoursePaginatedCopyWith(
          CoursePaginated value, $Res Function(CoursePaginated) then) =
      _$CoursePaginatedCopyWithImpl<$Res>;
  $Res call({int currentPage, List<Course> course, int lastPage});
}

/// @nodoc
class _$CoursePaginatedCopyWithImpl<$Res>
    implements $CoursePaginatedCopyWith<$Res> {
  _$CoursePaginatedCopyWithImpl(this._value, this._then);

  final CoursePaginated _value;
  // ignore: unused_field
  final $Res Function(CoursePaginated) _then;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? course = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as List<Course>,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CoursePaginatedCopyWith<$Res>
    implements $CoursePaginatedCopyWith<$Res> {
  factory _$CoursePaginatedCopyWith(
          _CoursePaginated value, $Res Function(_CoursePaginated) then) =
      __$CoursePaginatedCopyWithImpl<$Res>;
  @override
  $Res call({int currentPage, List<Course> course, int lastPage});
}

/// @nodoc
class __$CoursePaginatedCopyWithImpl<$Res>
    extends _$CoursePaginatedCopyWithImpl<$Res>
    implements _$CoursePaginatedCopyWith<$Res> {
  __$CoursePaginatedCopyWithImpl(
      _CoursePaginated _value, $Res Function(_CoursePaginated) _then)
      : super(_value, (v) => _then(v as _CoursePaginated));

  @override
  _CoursePaginated get _value => super._value as _CoursePaginated;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? course = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_CoursePaginated(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as List<Course>,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CoursePaginated implements _CoursePaginated {
  _$_CoursePaginated(
      {required this.currentPage,
      required this.course,
      required this.lastPage});

  @override
  final int currentPage;
  @override
  final List<Course> course;
  @override
  final int lastPage;

  @override
  String toString() {
    return 'CoursePaginated(currentPage: $currentPage, course: $course, lastPage: $lastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CoursePaginated &&
            (identical(other.currentPage, currentPage) ||
                const DeepCollectionEquality()
                    .equals(other.currentPage, currentPage)) &&
            (identical(other.course, course) ||
                const DeepCollectionEquality().equals(other.course, course)) &&
            (identical(other.lastPage, lastPage) ||
                const DeepCollectionEquality()
                    .equals(other.lastPage, lastPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentPage) ^
      const DeepCollectionEquality().hash(course) ^
      const DeepCollectionEquality().hash(lastPage);

  @JsonKey(ignore: true)
  @override
  _$CoursePaginatedCopyWith<_CoursePaginated> get copyWith =>
      __$CoursePaginatedCopyWithImpl<_CoursePaginated>(this, _$identity);
}

abstract class _CoursePaginated implements CoursePaginated {
  factory _CoursePaginated(
      {required int currentPage,
      required List<Course> course,
      required int lastPage}) = _$_CoursePaginated;

  @override
  int get currentPage => throw _privateConstructorUsedError;
  @override
  List<Course> get course => throw _privateConstructorUsedError;
  @override
  int get lastPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CoursePaginatedCopyWith<_CoursePaginated> get copyWith =>
      throw _privateConstructorUsedError;
}
