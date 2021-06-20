// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DashboardEventTearOff {
  const _$DashboardEventTearOff();

  _Started getCourse({String? query, int? page}) {
    return _Started(
      query: query,
      page: page,
    );
  }

  _Paginate getCoursePaginate(
      {String? query, int? page, required List<Course> course}) {
    return _Paginate(
      query: query,
      page: page,
      course: course,
    );
  }

  _Update update({required KtList<Course> course}) {
    return _Update(
      course: course,
    );
  }
}

/// @nodoc
const $DashboardEvent = _$DashboardEventTearOff();

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query, int? page) getCourse,
    required TResult Function(String? query, int? page, List<Course> course)
        getCoursePaginate,
    required TResult Function(KtList<Course> course) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query, int? page)? getCourse,
    TResult Function(String? query, int? page, List<Course> course)?
        getCoursePaginate,
    TResult Function(KtList<Course> course)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCourse,
    required TResult Function(_Paginate value) getCoursePaginate,
    required TResult Function(_Update value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCourse,
    TResult Function(_Paginate value)? getCoursePaginate,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  final DashboardEvent _value;
  // ignore: unused_field
  final $Res Function(DashboardEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({String? query, int? page});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$DashboardEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;

  @override
  $Res call({
    Object? query = freezed,
    Object? page = freezed,
  }) {
    return _then(_Started(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started({this.query, this.page});

  @override
  final String? query;
  @override
  final int? page;

  @override
  String toString() {
    return 'DashboardEvent.getCourse(query: $query, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Started &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(page);

  @JsonKey(ignore: true)
  @override
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query, int? page) getCourse,
    required TResult Function(String? query, int? page, List<Course> course)
        getCoursePaginate,
    required TResult Function(KtList<Course> course) update,
  }) {
    return getCourse(query, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query, int? page)? getCourse,
    TResult Function(String? query, int? page, List<Course> course)?
        getCoursePaginate,
    TResult Function(KtList<Course> course)? update,
    required TResult orElse(),
  }) {
    if (getCourse != null) {
      return getCourse(query, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCourse,
    required TResult Function(_Paginate value) getCoursePaginate,
    required TResult Function(_Update value) update,
  }) {
    return getCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCourse,
    TResult Function(_Paginate value)? getCoursePaginate,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (getCourse != null) {
      return getCourse(this);
    }
    return orElse();
  }
}

abstract class _Started implements DashboardEvent {
  const factory _Started({String? query, int? page}) = _$_Started;

  String? get query => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$StartedCopyWith<_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PaginateCopyWith<$Res> {
  factory _$PaginateCopyWith(_Paginate value, $Res Function(_Paginate) then) =
      __$PaginateCopyWithImpl<$Res>;
  $Res call({String? query, int? page, List<Course> course});
}

/// @nodoc
class __$PaginateCopyWithImpl<$Res> extends _$DashboardEventCopyWithImpl<$Res>
    implements _$PaginateCopyWith<$Res> {
  __$PaginateCopyWithImpl(_Paginate _value, $Res Function(_Paginate) _then)
      : super(_value, (v) => _then(v as _Paginate));

  @override
  _Paginate get _value => super._value as _Paginate;

  @override
  $Res call({
    Object? query = freezed,
    Object? page = freezed,
    Object? course = freezed,
  }) {
    return _then(_Paginate(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as List<Course>,
    ));
  }
}

/// @nodoc

class _$_Paginate implements _Paginate {
  const _$_Paginate({this.query, this.page, required this.course});

  @override
  final String? query;
  @override
  final int? page;
  @override
  final List<Course> course;

  @override
  String toString() {
    return 'DashboardEvent.getCoursePaginate(query: $query, page: $page, course: $course)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Paginate &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.course, course) ||
                const DeepCollectionEquality().equals(other.course, course)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(course);

  @JsonKey(ignore: true)
  @override
  _$PaginateCopyWith<_Paginate> get copyWith =>
      __$PaginateCopyWithImpl<_Paginate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query, int? page) getCourse,
    required TResult Function(String? query, int? page, List<Course> course)
        getCoursePaginate,
    required TResult Function(KtList<Course> course) update,
  }) {
    return getCoursePaginate(query, page, course);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query, int? page)? getCourse,
    TResult Function(String? query, int? page, List<Course> course)?
        getCoursePaginate,
    TResult Function(KtList<Course> course)? update,
    required TResult orElse(),
  }) {
    if (getCoursePaginate != null) {
      return getCoursePaginate(query, page, course);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCourse,
    required TResult Function(_Paginate value) getCoursePaginate,
    required TResult Function(_Update value) update,
  }) {
    return getCoursePaginate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCourse,
    TResult Function(_Paginate value)? getCoursePaginate,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (getCoursePaginate != null) {
      return getCoursePaginate(this);
    }
    return orElse();
  }
}

abstract class _Paginate implements DashboardEvent {
  const factory _Paginate(
      {String? query, int? page, required List<Course> course}) = _$_Paginate;

  String? get query => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  List<Course> get course => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PaginateCopyWith<_Paginate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) then) =
      __$UpdateCopyWithImpl<$Res>;
  $Res call({KtList<Course> course});
}

/// @nodoc
class __$UpdateCopyWithImpl<$Res> extends _$DashboardEventCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(_Update _value, $Res Function(_Update) _then)
      : super(_value, (v) => _then(v as _Update));

  @override
  _Update get _value => super._value as _Update;

  @override
  $Res call({
    Object? course = freezed,
  }) {
    return _then(_Update(
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as KtList<Course>,
    ));
  }
}

/// @nodoc

class _$_Update implements _Update {
  const _$_Update({required this.course});

  @override
  final KtList<Course> course;

  @override
  String toString() {
    return 'DashboardEvent.update(course: $course)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Update &&
            (identical(other.course, course) ||
                const DeepCollectionEquality().equals(other.course, course)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(course);

  @JsonKey(ignore: true)
  @override
  _$UpdateCopyWith<_Update> get copyWith =>
      __$UpdateCopyWithImpl<_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query, int? page) getCourse,
    required TResult Function(String? query, int? page, List<Course> course)
        getCoursePaginate,
    required TResult Function(KtList<Course> course) update,
  }) {
    return update(course);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query, int? page)? getCourse,
    TResult Function(String? query, int? page, List<Course> course)?
        getCoursePaginate,
    TResult Function(KtList<Course> course)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(course);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCourse,
    required TResult Function(_Paginate value) getCoursePaginate,
    required TResult Function(_Update value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCourse,
    TResult Function(_Paginate value)? getCoursePaginate,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements DashboardEvent {
  const factory _Update({required KtList<Course> course}) = _$_Update;

  KtList<Course> get course => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UpdateCopyWith<_Update> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DashboardStateTearOff {
  const _$DashboardStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Load loading() {
    return const _Load();
  }

  _Page paginating() {
    return const _Page();
  }

  _Success success(
      {required KtList<Course> course,
      required int currentPage,
      required int lastPage}) {
    return _Success(
      course: course,
      currentPage: currentPage,
      lastPage: lastPage,
    );
  }

  _Updating updating({required KtList<Course> course}) {
    return _Updating(
      course: course,
    );
  }

  _Error error({required String message}) {
    return _Error(
      message: message,
    );
  }

  _ErrorPaginated paginatedError({required String message}) {
    return _ErrorPaginated(
      message: message,
    );
  }
}

/// @nodoc
const $DashboardState = _$DashboardStateTearOff();

/// @nodoc
mixin _$DashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paginating,
    required TResult Function(
            KtList<Course> course, int currentPage, int lastPage)
        success,
    required TResult Function(KtList<Course> course) updating,
    required TResult Function(String message) error,
    required TResult Function(String message) paginatedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paginating,
    TResult Function(KtList<Course> course, int currentPage, int lastPage)?
        success,
    TResult Function(KtList<Course> course)? updating,
    TResult Function(String message)? error,
    TResult Function(String message)? paginatedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Page value) paginating,
    required TResult Function(_Success value) success,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorPaginated value) paginatedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Page value)? paginating,
    TResult Function(_Success value)? success,
    TResult Function(_Updating value)? updating,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorPaginated value)? paginatedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  final DashboardState _value;
  // ignore: unused_field
  final $Res Function(DashboardState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$DashboardStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'DashboardState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paginating,
    required TResult Function(
            KtList<Course> course, int currentPage, int lastPage)
        success,
    required TResult Function(KtList<Course> course) updating,
    required TResult Function(String message) error,
    required TResult Function(String message) paginatedError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paginating,
    TResult Function(KtList<Course> course, int currentPage, int lastPage)?
        success,
    TResult Function(KtList<Course> course)? updating,
    TResult Function(String message)? error,
    TResult Function(String message)? paginatedError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Page value) paginating,
    required TResult Function(_Success value) success,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorPaginated value) paginatedError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Page value)? paginating,
    TResult Function(_Success value)? success,
    TResult Function(_Updating value)? updating,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorPaginated value)? paginatedError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DashboardState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) then) =
      __$LoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> extends _$DashboardStateCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(_Load _value, $Res Function(_Load) _then)
      : super(_value, (v) => _then(v as _Load));

  @override
  _Load get _value => super._value as _Load;
}

/// @nodoc

class _$_Load implements _Load {
  const _$_Load();

  @override
  String toString() {
    return 'DashboardState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paginating,
    required TResult Function(
            KtList<Course> course, int currentPage, int lastPage)
        success,
    required TResult Function(KtList<Course> course) updating,
    required TResult Function(String message) error,
    required TResult Function(String message) paginatedError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paginating,
    TResult Function(KtList<Course> course, int currentPage, int lastPage)?
        success,
    TResult Function(KtList<Course> course)? updating,
    TResult Function(String message)? error,
    TResult Function(String message)? paginatedError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Page value) paginating,
    required TResult Function(_Success value) success,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorPaginated value) paginatedError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Page value)? paginating,
    TResult Function(_Success value)? success,
    TResult Function(_Updating value)? updating,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorPaginated value)? paginatedError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Load implements DashboardState {
  const factory _Load() = _$_Load;
}

/// @nodoc
abstract class _$PageCopyWith<$Res> {
  factory _$PageCopyWith(_Page value, $Res Function(_Page) then) =
      __$PageCopyWithImpl<$Res>;
}

/// @nodoc
class __$PageCopyWithImpl<$Res> extends _$DashboardStateCopyWithImpl<$Res>
    implements _$PageCopyWith<$Res> {
  __$PageCopyWithImpl(_Page _value, $Res Function(_Page) _then)
      : super(_value, (v) => _then(v as _Page));

  @override
  _Page get _value => super._value as _Page;
}

/// @nodoc

class _$_Page implements _Page {
  const _$_Page();

  @override
  String toString() {
    return 'DashboardState.paginating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Page);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paginating,
    required TResult Function(
            KtList<Course> course, int currentPage, int lastPage)
        success,
    required TResult Function(KtList<Course> course) updating,
    required TResult Function(String message) error,
    required TResult Function(String message) paginatedError,
  }) {
    return paginating();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paginating,
    TResult Function(KtList<Course> course, int currentPage, int lastPage)?
        success,
    TResult Function(KtList<Course> course)? updating,
    TResult Function(String message)? error,
    TResult Function(String message)? paginatedError,
    required TResult orElse(),
  }) {
    if (paginating != null) {
      return paginating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Page value) paginating,
    required TResult Function(_Success value) success,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorPaginated value) paginatedError,
  }) {
    return paginating(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Page value)? paginating,
    TResult Function(_Success value)? success,
    TResult Function(_Updating value)? updating,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorPaginated value)? paginatedError,
    required TResult orElse(),
  }) {
    if (paginating != null) {
      return paginating(this);
    }
    return orElse();
  }
}

abstract class _Page implements DashboardState {
  const factory _Page() = _$_Page;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  $Res call({KtList<Course> course, int currentPage, int lastPage});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$DashboardStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? course = freezed,
    Object? currentPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_Success(
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as KtList<Course>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(
      {required this.course,
      required this.currentPage,
      required this.lastPage});

  @override
  final KtList<Course> course;
  @override
  final int currentPage;
  @override
  final int lastPage;

  @override
  String toString() {
    return 'DashboardState.success(course: $course, currentPage: $currentPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success &&
            (identical(other.course, course) ||
                const DeepCollectionEquality().equals(other.course, course)) &&
            (identical(other.currentPage, currentPage) ||
                const DeepCollectionEquality()
                    .equals(other.currentPage, currentPage)) &&
            (identical(other.lastPage, lastPage) ||
                const DeepCollectionEquality()
                    .equals(other.lastPage, lastPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(course) ^
      const DeepCollectionEquality().hash(currentPage) ^
      const DeepCollectionEquality().hash(lastPage);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paginating,
    required TResult Function(
            KtList<Course> course, int currentPage, int lastPage)
        success,
    required TResult Function(KtList<Course> course) updating,
    required TResult Function(String message) error,
    required TResult Function(String message) paginatedError,
  }) {
    return success(course, currentPage, lastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paginating,
    TResult Function(KtList<Course> course, int currentPage, int lastPage)?
        success,
    TResult Function(KtList<Course> course)? updating,
    TResult Function(String message)? error,
    TResult Function(String message)? paginatedError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(course, currentPage, lastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Page value) paginating,
    required TResult Function(_Success value) success,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorPaginated value) paginatedError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Page value)? paginating,
    TResult Function(_Success value)? success,
    TResult Function(_Updating value)? updating,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorPaginated value)? paginatedError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements DashboardState {
  const factory _Success(
      {required KtList<Course> course,
      required int currentPage,
      required int lastPage}) = _$_Success;

  KtList<Course> get course => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdatingCopyWith<$Res> {
  factory _$UpdatingCopyWith(_Updating value, $Res Function(_Updating) then) =
      __$UpdatingCopyWithImpl<$Res>;
  $Res call({KtList<Course> course});
}

/// @nodoc
class __$UpdatingCopyWithImpl<$Res> extends _$DashboardStateCopyWithImpl<$Res>
    implements _$UpdatingCopyWith<$Res> {
  __$UpdatingCopyWithImpl(_Updating _value, $Res Function(_Updating) _then)
      : super(_value, (v) => _then(v as _Updating));

  @override
  _Updating get _value => super._value as _Updating;

  @override
  $Res call({
    Object? course = freezed,
  }) {
    return _then(_Updating(
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as KtList<Course>,
    ));
  }
}

/// @nodoc

class _$_Updating implements _Updating {
  const _$_Updating({required this.course});

  @override
  final KtList<Course> course;

  @override
  String toString() {
    return 'DashboardState.updating(course: $course)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Updating &&
            (identical(other.course, course) ||
                const DeepCollectionEquality().equals(other.course, course)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(course);

  @JsonKey(ignore: true)
  @override
  _$UpdatingCopyWith<_Updating> get copyWith =>
      __$UpdatingCopyWithImpl<_Updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paginating,
    required TResult Function(
            KtList<Course> course, int currentPage, int lastPage)
        success,
    required TResult Function(KtList<Course> course) updating,
    required TResult Function(String message) error,
    required TResult Function(String message) paginatedError,
  }) {
    return updating(course);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paginating,
    TResult Function(KtList<Course> course, int currentPage, int lastPage)?
        success,
    TResult Function(KtList<Course> course)? updating,
    TResult Function(String message)? error,
    TResult Function(String message)? paginatedError,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(course);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Page value) paginating,
    required TResult Function(_Success value) success,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorPaginated value) paginatedError,
  }) {
    return updating(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Page value)? paginating,
    TResult Function(_Success value)? success,
    TResult Function(_Updating value)? updating,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorPaginated value)? paginatedError,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(this);
    }
    return orElse();
  }
}

abstract class _Updating implements DashboardState {
  const factory _Updating({required KtList<Course> course}) = _$_Updating;

  KtList<Course> get course => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UpdatingCopyWith<_Updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$DashboardStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Error(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DashboardState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paginating,
    required TResult Function(
            KtList<Course> course, int currentPage, int lastPage)
        success,
    required TResult Function(KtList<Course> course) updating,
    required TResult Function(String message) error,
    required TResult Function(String message) paginatedError,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paginating,
    TResult Function(KtList<Course> course, int currentPage, int lastPage)?
        success,
    TResult Function(KtList<Course> course)? updating,
    TResult Function(String message)? error,
    TResult Function(String message)? paginatedError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Page value) paginating,
    required TResult Function(_Success value) success,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorPaginated value) paginatedError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Page value)? paginating,
    TResult Function(_Success value)? success,
    TResult Function(_Updating value)? updating,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorPaginated value)? paginatedError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DashboardState {
  const factory _Error({required String message}) = _$_Error;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorPaginatedCopyWith<$Res> {
  factory _$ErrorPaginatedCopyWith(
          _ErrorPaginated value, $Res Function(_ErrorPaginated) then) =
      __$ErrorPaginatedCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ErrorPaginatedCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$ErrorPaginatedCopyWith<$Res> {
  __$ErrorPaginatedCopyWithImpl(
      _ErrorPaginated _value, $Res Function(_ErrorPaginated) _then)
      : super(_value, (v) => _then(v as _ErrorPaginated));

  @override
  _ErrorPaginated get _value => super._value as _ErrorPaginated;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ErrorPaginated(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorPaginated implements _ErrorPaginated {
  const _$_ErrorPaginated({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DashboardState.paginatedError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorPaginated &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ErrorPaginatedCopyWith<_ErrorPaginated> get copyWith =>
      __$ErrorPaginatedCopyWithImpl<_ErrorPaginated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paginating,
    required TResult Function(
            KtList<Course> course, int currentPage, int lastPage)
        success,
    required TResult Function(KtList<Course> course) updating,
    required TResult Function(String message) error,
    required TResult Function(String message) paginatedError,
  }) {
    return paginatedError(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paginating,
    TResult Function(KtList<Course> course, int currentPage, int lastPage)?
        success,
    TResult Function(KtList<Course> course)? updating,
    TResult Function(String message)? error,
    TResult Function(String message)? paginatedError,
    required TResult orElse(),
  }) {
    if (paginatedError != null) {
      return paginatedError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Page value) paginating,
    required TResult Function(_Success value) success,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorPaginated value) paginatedError,
  }) {
    return paginatedError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Page value)? paginating,
    TResult Function(_Success value)? success,
    TResult Function(_Updating value)? updating,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorPaginated value)? paginatedError,
    required TResult orElse(),
  }) {
    if (paginatedError != null) {
      return paginatedError(this);
    }
    return orElse();
  }
}

abstract class _ErrorPaginated implements DashboardState {
  const factory _ErrorPaginated({required String message}) = _$_ErrorPaginated;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorPaginatedCopyWith<_ErrorPaginated> get copyWith =>
      throw _privateConstructorUsedError;
}
