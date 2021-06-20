// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'get_choice_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GetChoiceEventTearOff {
  const _$GetChoiceEventTearOff();

  _Started started({required int id}) {
    return _Started(
      id: id,
    );
  }

  _Update update({required int id}) {
    return _Update(
      id: id,
    );
  }

  _Sort sort({required int questionId}) {
    return _Sort(
      questionId: questionId,
    );
  }
}

/// @nodoc
const $GetChoiceEvent = _$GetChoiceEventTearOff();

/// @nodoc
mixin _$GetChoiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) started,
    required TResult Function(int id) update,
    required TResult Function(int questionId) sort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    TResult Function(int id)? update,
    TResult Function(int questionId)? sort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Update value) update,
    required TResult Function(_Sort value) sort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Update value)? update,
    TResult Function(_Sort value)? sort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetChoiceEventCopyWith<$Res> {
  factory $GetChoiceEventCopyWith(
          GetChoiceEvent value, $Res Function(GetChoiceEvent) then) =
      _$GetChoiceEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetChoiceEventCopyWithImpl<$Res>
    implements $GetChoiceEventCopyWith<$Res> {
  _$GetChoiceEventCopyWithImpl(this._value, this._then);

  final GetChoiceEvent _value;
  // ignore: unused_field
  final $Res Function(GetChoiceEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$GetChoiceEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_Started(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'GetChoiceEvent.started(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Started &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) started,
    required TResult Function(int id) update,
    required TResult Function(int questionId) sort,
  }) {
    return started(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    TResult Function(int id)? update,
    TResult Function(int questionId)? sort,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Update value) update,
    required TResult Function(_Sort value) sort,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Update value)? update,
    TResult Function(_Sort value)? sort,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetChoiceEvent {
  const factory _Started({required int id}) = _$_Started;

  int get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$StartedCopyWith<_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) then) =
      __$UpdateCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class __$UpdateCopyWithImpl<$Res> extends _$GetChoiceEventCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(_Update _value, $Res Function(_Update) _then)
      : super(_value, (v) => _then(v as _Update));

  @override
  _Update get _value => super._value as _Update;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_Update(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Update implements _Update {
  const _$_Update({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'GetChoiceEvent.update(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Update &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$UpdateCopyWith<_Update> get copyWith =>
      __$UpdateCopyWithImpl<_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) started,
    required TResult Function(int id) update,
    required TResult Function(int questionId) sort,
  }) {
    return update(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    TResult Function(int id)? update,
    TResult Function(int questionId)? sort,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Update value) update,
    required TResult Function(_Sort value) sort,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Update value)? update,
    TResult Function(_Sort value)? sort,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements GetChoiceEvent {
  const factory _Update({required int id}) = _$_Update;

  int get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UpdateCopyWith<_Update> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SortCopyWith<$Res> {
  factory _$SortCopyWith(_Sort value, $Res Function(_Sort) then) =
      __$SortCopyWithImpl<$Res>;
  $Res call({int questionId});
}

/// @nodoc
class __$SortCopyWithImpl<$Res> extends _$GetChoiceEventCopyWithImpl<$Res>
    implements _$SortCopyWith<$Res> {
  __$SortCopyWithImpl(_Sort _value, $Res Function(_Sort) _then)
      : super(_value, (v) => _then(v as _Sort));

  @override
  _Sort get _value => super._value as _Sort;

  @override
  $Res call({
    Object? questionId = freezed,
  }) {
    return _then(_Sort(
      questionId: questionId == freezed
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Sort implements _Sort {
  const _$_Sort({required this.questionId});

  @override
  final int questionId;

  @override
  String toString() {
    return 'GetChoiceEvent.sort(questionId: $questionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Sort &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(questionId);

  @JsonKey(ignore: true)
  @override
  _$SortCopyWith<_Sort> get copyWith =>
      __$SortCopyWithImpl<_Sort>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) started,
    required TResult Function(int id) update,
    required TResult Function(int questionId) sort,
  }) {
    return sort(questionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    TResult Function(int id)? update,
    TResult Function(int questionId)? sort,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(questionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Update value) update,
    required TResult Function(_Sort value) sort,
  }) {
    return sort(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Update value)? update,
    TResult Function(_Sort value)? sort,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(this);
    }
    return orElse();
  }
}

abstract class _Sort implements GetChoiceEvent {
  const factory _Sort({required int questionId}) = _$_Sort;

  int get questionId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SortCopyWith<_Sort> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$GetChoiceStateTearOff {
  const _$GetChoiceStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Load loading() {
    return const _Load();
  }

  _Sorting sorting() {
    return const _Sorting();
  }

  _Updating updating() {
    return const _Updating();
  }

  _Success success({required KtList<Choice> course}) {
    return _Success(
      course: course,
    );
  }

  _Error error({required String message}) {
    return _Error(
      message: message,
    );
  }
}

/// @nodoc
const $GetChoiceState = _$GetChoiceStateTearOff();

/// @nodoc
mixin _$GetChoiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() sorting,
    required TResult Function() updating,
    required TResult Function(KtList<Choice> course) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? sorting,
    TResult Function()? updating,
    TResult Function(KtList<Choice> course)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Sorting value) sorting,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Sorting value)? sorting,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetChoiceStateCopyWith<$Res> {
  factory $GetChoiceStateCopyWith(
          GetChoiceState value, $Res Function(GetChoiceState) then) =
      _$GetChoiceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetChoiceStateCopyWithImpl<$Res>
    implements $GetChoiceStateCopyWith<$Res> {
  _$GetChoiceStateCopyWithImpl(this._value, this._then);

  final GetChoiceState _value;
  // ignore: unused_field
  final $Res Function(GetChoiceState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$GetChoiceStateCopyWithImpl<$Res>
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
    return 'GetChoiceState.initial()';
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
    required TResult Function() sorting,
    required TResult Function() updating,
    required TResult Function(KtList<Choice> course) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? sorting,
    TResult Function()? updating,
    TResult Function(KtList<Choice> course)? success,
    TResult Function(String message)? error,
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
    required TResult Function(_Sorting value) sorting,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Sorting value)? sorting,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GetChoiceState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) then) =
      __$LoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> extends _$GetChoiceStateCopyWithImpl<$Res>
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
    return 'GetChoiceState.loading()';
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
    required TResult Function() sorting,
    required TResult Function() updating,
    required TResult Function(KtList<Choice> course) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? sorting,
    TResult Function()? updating,
    TResult Function(KtList<Choice> course)? success,
    TResult Function(String message)? error,
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
    required TResult Function(_Sorting value) sorting,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Sorting value)? sorting,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Load implements GetChoiceState {
  const factory _Load() = _$_Load;
}

/// @nodoc
abstract class _$SortingCopyWith<$Res> {
  factory _$SortingCopyWith(_Sorting value, $Res Function(_Sorting) then) =
      __$SortingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SortingCopyWithImpl<$Res> extends _$GetChoiceStateCopyWithImpl<$Res>
    implements _$SortingCopyWith<$Res> {
  __$SortingCopyWithImpl(_Sorting _value, $Res Function(_Sorting) _then)
      : super(_value, (v) => _then(v as _Sorting));

  @override
  _Sorting get _value => super._value as _Sorting;
}

/// @nodoc

class _$_Sorting implements _Sorting {
  const _$_Sorting();

  @override
  String toString() {
    return 'GetChoiceState.sorting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Sorting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() sorting,
    required TResult Function() updating,
    required TResult Function(KtList<Choice> course) success,
    required TResult Function(String message) error,
  }) {
    return sorting();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? sorting,
    TResult Function()? updating,
    TResult Function(KtList<Choice> course)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (sorting != null) {
      return sorting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Sorting value) sorting,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return sorting(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Sorting value)? sorting,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sorting != null) {
      return sorting(this);
    }
    return orElse();
  }
}

abstract class _Sorting implements GetChoiceState {
  const factory _Sorting() = _$_Sorting;
}

/// @nodoc
abstract class _$UpdatingCopyWith<$Res> {
  factory _$UpdatingCopyWith(_Updating value, $Res Function(_Updating) then) =
      __$UpdatingCopyWithImpl<$Res>;
}

/// @nodoc
class __$UpdatingCopyWithImpl<$Res> extends _$GetChoiceStateCopyWithImpl<$Res>
    implements _$UpdatingCopyWith<$Res> {
  __$UpdatingCopyWithImpl(_Updating _value, $Res Function(_Updating) _then)
      : super(_value, (v) => _then(v as _Updating));

  @override
  _Updating get _value => super._value as _Updating;
}

/// @nodoc

class _$_Updating implements _Updating {
  const _$_Updating();

  @override
  String toString() {
    return 'GetChoiceState.updating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Updating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() sorting,
    required TResult Function() updating,
    required TResult Function(KtList<Choice> course) success,
    required TResult Function(String message) error,
  }) {
    return updating();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? sorting,
    TResult Function()? updating,
    TResult Function(KtList<Choice> course)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Sorting value) sorting,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return updating(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Sorting value)? sorting,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(this);
    }
    return orElse();
  }
}

abstract class _Updating implements GetChoiceState {
  const factory _Updating() = _$_Updating;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  $Res call({KtList<Choice> course});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$GetChoiceStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? course = freezed,
  }) {
    return _then(_Success(
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as KtList<Choice>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required this.course});

  @override
  final KtList<Choice> course;

  @override
  String toString() {
    return 'GetChoiceState.success(course: $course)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success &&
            (identical(other.course, course) ||
                const DeepCollectionEquality().equals(other.course, course)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(course);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() sorting,
    required TResult Function() updating,
    required TResult Function(KtList<Choice> course) success,
    required TResult Function(String message) error,
  }) {
    return success(course);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? sorting,
    TResult Function()? updating,
    TResult Function(KtList<Choice> course)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(course);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Sorting value) sorting,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Sorting value)? sorting,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements GetChoiceState {
  const factory _Success({required KtList<Choice> course}) = _$_Success;

  KtList<Choice> get course => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$GetChoiceStateCopyWithImpl<$Res>
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
    return 'GetChoiceState.error(message: $message)';
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
    required TResult Function() sorting,
    required TResult Function() updating,
    required TResult Function(KtList<Choice> course) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? sorting,
    TResult Function()? updating,
    TResult Function(KtList<Choice> course)? success,
    TResult Function(String message)? error,
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
    required TResult Function(_Sorting value) sorting,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Sorting value)? sorting,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GetChoiceState {
  const factory _Error({required String message}) = _$_Error;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
