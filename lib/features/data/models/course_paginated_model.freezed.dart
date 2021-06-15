// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'course_paginated_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoursePaginatedModel _$CoursePaginatedModelFromJson(Map<String, dynamic> json) {
  return _CoursePaginatedModel.fromJson(json);
}

/// @nodoc
class _$CoursePaginatedModelTearOff {
  const _$CoursePaginatedModelTearOff();

  _CoursePaginatedModel call(
      {@JsonKey(name: "current_page") required int currentPage,
      @JsonKey(name: "data") required List<CourseModel> course,
      @JsonKey(name: "last_page") required int lastPage}) {
    return _CoursePaginatedModel(
      currentPage: currentPage,
      course: course,
      lastPage: lastPage,
    );
  }

  CoursePaginatedModel fromJson(Map<String, Object> json) {
    return CoursePaginatedModel.fromJson(json);
  }
}

/// @nodoc
const $CoursePaginatedModel = _$CoursePaginatedModelTearOff();

/// @nodoc
mixin _$CoursePaginatedModel {
  @JsonKey(name: "current_page")
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<CourseModel> get course => throw _privateConstructorUsedError;
  @JsonKey(name: "last_page")
  int get lastPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoursePaginatedModelCopyWith<CoursePaginatedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoursePaginatedModelCopyWith<$Res> {
  factory $CoursePaginatedModelCopyWith(CoursePaginatedModel value,
          $Res Function(CoursePaginatedModel) then) =
      _$CoursePaginatedModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "current_page") int currentPage,
      @JsonKey(name: "data") List<CourseModel> course,
      @JsonKey(name: "last_page") int lastPage});
}

/// @nodoc
class _$CoursePaginatedModelCopyWithImpl<$Res>
    implements $CoursePaginatedModelCopyWith<$Res> {
  _$CoursePaginatedModelCopyWithImpl(this._value, this._then);

  final CoursePaginatedModel _value;
  // ignore: unused_field
  final $Res Function(CoursePaginatedModel) _then;

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
              as List<CourseModel>,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CoursePaginatedModelCopyWith<$Res>
    implements $CoursePaginatedModelCopyWith<$Res> {
  factory _$CoursePaginatedModelCopyWith(_CoursePaginatedModel value,
          $Res Function(_CoursePaginatedModel) then) =
      __$CoursePaginatedModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "current_page") int currentPage,
      @JsonKey(name: "data") List<CourseModel> course,
      @JsonKey(name: "last_page") int lastPage});
}

/// @nodoc
class __$CoursePaginatedModelCopyWithImpl<$Res>
    extends _$CoursePaginatedModelCopyWithImpl<$Res>
    implements _$CoursePaginatedModelCopyWith<$Res> {
  __$CoursePaginatedModelCopyWithImpl(
      _CoursePaginatedModel _value, $Res Function(_CoursePaginatedModel) _then)
      : super(_value, (v) => _then(v as _CoursePaginatedModel));

  @override
  _CoursePaginatedModel get _value => super._value as _CoursePaginatedModel;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? course = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_CoursePaginatedModel(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoursePaginatedModel implements _CoursePaginatedModel {
  _$_CoursePaginatedModel(
      {@JsonKey(name: "current_page") required this.currentPage,
      @JsonKey(name: "data") required this.course,
      @JsonKey(name: "last_page") required this.lastPage});

  factory _$_CoursePaginatedModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CoursePaginatedModelFromJson(json);

  @override
  @JsonKey(name: "current_page")
  final int currentPage;
  @override
  @JsonKey(name: "data")
  final List<CourseModel> course;
  @override
  @JsonKey(name: "last_page")
  final int lastPage;

  @override
  String toString() {
    return 'CoursePaginatedModel(currentPage: $currentPage, course: $course, lastPage: $lastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CoursePaginatedModel &&
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
  _$CoursePaginatedModelCopyWith<_CoursePaginatedModel> get copyWith =>
      __$CoursePaginatedModelCopyWithImpl<_CoursePaginatedModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CoursePaginatedModelToJson(this);
  }
}

abstract class _CoursePaginatedModel implements CoursePaginatedModel {
  factory _CoursePaginatedModel(
          {@JsonKey(name: "current_page") required int currentPage,
          @JsonKey(name: "data") required List<CourseModel> course,
          @JsonKey(name: "last_page") required int lastPage}) =
      _$_CoursePaginatedModel;

  factory _CoursePaginatedModel.fromJson(Map<String, dynamic> json) =
      _$_CoursePaginatedModel.fromJson;

  @override
  @JsonKey(name: "current_page")
  int get currentPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "data")
  List<CourseModel> get course => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "last_page")
  int get lastPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CoursePaginatedModelCopyWith<_CoursePaginatedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
