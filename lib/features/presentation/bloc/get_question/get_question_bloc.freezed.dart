// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'get_question_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GetQuestionEventTearOff {
  const _$GetQuestionEventTearOff();

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

  _Refresh refresh({required int id}) {
    return _Refresh(
      id: id,
    );
  }
}

/// @nodoc
const $GetQuestionEvent = _$GetQuestionEventTearOff();

/// @nodoc
mixin _$GetQuestionEvent {
  int get id => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) started,
    required TResult Function(int id) update,
    required TResult Function(int id) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    TResult Function(int id)? update,
    TResult Function(int id)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Update value) update,
    required TResult Function(_Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Update value)? update,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetQuestionEventCopyWith<GetQuestionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetQuestionEventCopyWith<$Res> {
  factory $GetQuestionEventCopyWith(
          GetQuestionEvent value, $Res Function(GetQuestionEvent) then) =
      _$GetQuestionEventCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class _$GetQuestionEventCopyWithImpl<$Res>
    implements $GetQuestionEventCopyWith<$Res> {
  _$GetQuestionEventCopyWithImpl(this._value, this._then);

  final GetQuestionEvent _value;
  // ignore: unused_field
  final $Res Function(GetQuestionEvent) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StartedCopyWith<$Res>
    implements $GetQuestionEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  @override
  $Res call({int id});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$GetQuestionEventCopyWithImpl<$Res>
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
    return 'GetQuestionEvent.started(id: $id)';
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
    required TResult Function(int id) refresh,
  }) {
    return started(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    TResult Function(int id)? update,
    TResult Function(int id)? refresh,
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
    required TResult Function(_Refresh value) refresh,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Update value)? update,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetQuestionEvent {
  const factory _Started({required int id}) = _$_Started;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StartedCopyWith<_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateCopyWith<$Res>
    implements $GetQuestionEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) then) =
      __$UpdateCopyWithImpl<$Res>;
  @override
  $Res call({int id});
}

/// @nodoc
class __$UpdateCopyWithImpl<$Res> extends _$GetQuestionEventCopyWithImpl<$Res>
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
    return 'GetQuestionEvent.update(id: $id)';
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
    required TResult Function(int id) refresh,
  }) {
    return update(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    TResult Function(int id)? update,
    TResult Function(int id)? refresh,
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
    required TResult Function(_Refresh value) refresh,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Update value)? update,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements GetQuestionEvent {
  const factory _Update({required int id}) = _$_Update;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdateCopyWith<_Update> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RefreshCopyWith<$Res>
    implements $GetQuestionEventCopyWith<$Res> {
  factory _$RefreshCopyWith(_Refresh value, $Res Function(_Refresh) then) =
      __$RefreshCopyWithImpl<$Res>;
  @override
  $Res call({int id});
}

/// @nodoc
class __$RefreshCopyWithImpl<$Res> extends _$GetQuestionEventCopyWithImpl<$Res>
    implements _$RefreshCopyWith<$Res> {
  __$RefreshCopyWithImpl(_Refresh _value, $Res Function(_Refresh) _then)
      : super(_value, (v) => _then(v as _Refresh));

  @override
  _Refresh get _value => super._value as _Refresh;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_Refresh(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Refresh implements _Refresh {
  const _$_Refresh({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'GetQuestionEvent.refresh(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Refresh &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$RefreshCopyWith<_Refresh> get copyWith =>
      __$RefreshCopyWithImpl<_Refresh>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) started,
    required TResult Function(int id) update,
    required TResult Function(int id) refresh,
  }) {
    return refresh(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    TResult Function(int id)? update,
    TResult Function(int id)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Update value) update,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Update value)? update,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements GetQuestionEvent {
  const factory _Refresh({required int id}) = _$_Refresh;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RefreshCopyWith<_Refresh> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$GetQuestionStateTearOff {
  const _$GetQuestionStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Load loading() {
    return const _Load();
  }

  _Updating updating() {
    return const _Updating();
  }

  _Refreshings refreshing() {
    return const _Refreshings();
  }

  _Success success({required KtList<Question> question}) {
    return _Success(
      question: question,
    );
  }

  _Error error({required String message}) {
    return _Error(
      message: message,
    );
  }
}

/// @nodoc
const $GetQuestionState = _$GetQuestionStateTearOff();

/// @nodoc
mixin _$GetQuestionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updating,
    required TResult Function() refreshing,
    required TResult Function(KtList<Question> question) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updating,
    TResult Function()? refreshing,
    TResult Function(KtList<Question> question)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Refreshings value) refreshing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Updating value)? updating,
    TResult Function(_Refreshings value)? refreshing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetQuestionStateCopyWith<$Res> {
  factory $GetQuestionStateCopyWith(
          GetQuestionState value, $Res Function(GetQuestionState) then) =
      _$GetQuestionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetQuestionStateCopyWithImpl<$Res>
    implements $GetQuestionStateCopyWith<$Res> {
  _$GetQuestionStateCopyWithImpl(this._value, this._then);

  final GetQuestionState _value;
  // ignore: unused_field
  final $Res Function(GetQuestionState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$GetQuestionStateCopyWithImpl<$Res>
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
    return 'GetQuestionState.initial()';
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
    required TResult Function() updating,
    required TResult Function() refreshing,
    required TResult Function(KtList<Question> question) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updating,
    TResult Function()? refreshing,
    TResult Function(KtList<Question> question)? success,
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
    required TResult Function(_Updating value) updating,
    required TResult Function(_Refreshings value) refreshing,
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
    TResult Function(_Updating value)? updating,
    TResult Function(_Refreshings value)? refreshing,
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

abstract class _Initial implements GetQuestionState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) then) =
      __$LoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> extends _$GetQuestionStateCopyWithImpl<$Res>
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
    return 'GetQuestionState.loading()';
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
    required TResult Function() updating,
    required TResult Function() refreshing,
    required TResult Function(KtList<Question> question) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updating,
    TResult Function()? refreshing,
    TResult Function(KtList<Question> question)? success,
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
    required TResult Function(_Updating value) updating,
    required TResult Function(_Refreshings value) refreshing,
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
    TResult Function(_Updating value)? updating,
    TResult Function(_Refreshings value)? refreshing,
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

abstract class _Load implements GetQuestionState {
  const factory _Load() = _$_Load;
}

/// @nodoc
abstract class _$UpdatingCopyWith<$Res> {
  factory _$UpdatingCopyWith(_Updating value, $Res Function(_Updating) then) =
      __$UpdatingCopyWithImpl<$Res>;
}

/// @nodoc
class __$UpdatingCopyWithImpl<$Res> extends _$GetQuestionStateCopyWithImpl<$Res>
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
    return 'GetQuestionState.updating()';
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
    required TResult Function() updating,
    required TResult Function() refreshing,
    required TResult Function(KtList<Question> question) success,
    required TResult Function(String message) error,
  }) {
    return updating();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updating,
    TResult Function()? refreshing,
    TResult Function(KtList<Question> question)? success,
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
    required TResult Function(_Updating value) updating,
    required TResult Function(_Refreshings value) refreshing,
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
    TResult Function(_Updating value)? updating,
    TResult Function(_Refreshings value)? refreshing,
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

abstract class _Updating implements GetQuestionState {
  const factory _Updating() = _$_Updating;
}

/// @nodoc
abstract class _$RefreshingsCopyWith<$Res> {
  factory _$RefreshingsCopyWith(
          _Refreshings value, $Res Function(_Refreshings) then) =
      __$RefreshingsCopyWithImpl<$Res>;
}

/// @nodoc
class __$RefreshingsCopyWithImpl<$Res>
    extends _$GetQuestionStateCopyWithImpl<$Res>
    implements _$RefreshingsCopyWith<$Res> {
  __$RefreshingsCopyWithImpl(
      _Refreshings _value, $Res Function(_Refreshings) _then)
      : super(_value, (v) => _then(v as _Refreshings));

  @override
  _Refreshings get _value => super._value as _Refreshings;
}

/// @nodoc

class _$_Refreshings implements _Refreshings {
  const _$_Refreshings();

  @override
  String toString() {
    return 'GetQuestionState.refreshing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Refreshings);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updating,
    required TResult Function() refreshing,
    required TResult Function(KtList<Question> question) success,
    required TResult Function(String message) error,
  }) {
    return refreshing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updating,
    TResult Function()? refreshing,
    TResult Function(KtList<Question> question)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Refreshings value) refreshing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? loading,
    TResult Function(_Updating value)? updating,
    TResult Function(_Refreshings value)? refreshing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class _Refreshings implements GetQuestionState {
  const factory _Refreshings() = _$_Refreshings;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  $Res call({KtList<Question> question});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$GetQuestionStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? question = freezed,
  }) {
    return _then(_Success(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as KtList<Question>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required this.question});

  @override
  final KtList<Question> question;

  @override
  String toString() {
    return 'GetQuestionState.success(question: $question)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(question);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updating,
    required TResult Function() refreshing,
    required TResult Function(KtList<Question> question) success,
    required TResult Function(String message) error,
  }) {
    return success(question);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updating,
    TResult Function()? refreshing,
    TResult Function(KtList<Question> question)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(question);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) loading,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Refreshings value) refreshing,
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
    TResult Function(_Updating value)? updating,
    TResult Function(_Refreshings value)? refreshing,
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

abstract class _Success implements GetQuestionState {
  const factory _Success({required KtList<Question> question}) = _$_Success;

  KtList<Question> get question => throw _privateConstructorUsedError;
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
class __$ErrorCopyWithImpl<$Res> extends _$GetQuestionStateCopyWithImpl<$Res>
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
    return 'GetQuestionState.error(message: $message)';
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
    required TResult Function() updating,
    required TResult Function() refreshing,
    required TResult Function(KtList<Question> question) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updating,
    TResult Function()? refreshing,
    TResult Function(KtList<Question> question)? success,
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
    required TResult Function(_Updating value) updating,
    required TResult Function(_Refreshings value) refreshing,
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
    TResult Function(_Updating value)? updating,
    TResult Function(_Refreshings value)? refreshing,
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

abstract class _Error implements GetQuestionState {
  const factory _Error({required String message}) = _$_Error;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
