// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
class _$QuestionModelTearOff {
  const _$QuestionModelTearOff();

  _QuestionModel call(
      {@JsonKey(name: "id", required: true)
          required int id,
      @JsonKey(name: "question", required: true)
          required String question,
      @JsonKey(name: "answer")
          required ChoiceModel answer,
      @JsonKey(name: 'choices', required: true)
          required List<ChoiceModel> choices,
      @JsonKey(name: "assignment_id")
          int? assignmentId}) {
    return _QuestionModel(
      id: id,
      question: question,
      answer: answer,
      choices: choices,
      assignmentId: assignmentId,
    );
  }

  QuestionModel fromJson(Map<String, Object> json) {
    return QuestionModel.fromJson(json);
  }
}

/// @nodoc
const $QuestionModel = _$QuestionModelTearOff();

/// @nodoc
mixin _$QuestionModel {
  @JsonKey(name: "id", required: true)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "question", required: true)
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: "answer")
  ChoiceModel get answer =>
      throw _privateConstructorUsedError; // @JsonKey(name: "")requ
  @JsonKey(name: 'choices', required: true)
  List<ChoiceModel> get choices => throw _privateConstructorUsedError;
  @JsonKey(name: "assignment_id")
  int? get assignmentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id", required: true) int id,
      @JsonKey(name: "question", required: true) String question,
      @JsonKey(name: "answer") ChoiceModel answer,
      @JsonKey(name: 'choices', required: true) List<ChoiceModel> choices,
      @JsonKey(name: "assignment_id") int? assignmentId});

  $ChoiceModelCopyWith<$Res> get answer;
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  final QuestionModel _value;
  // ignore: unused_field
  final $Res Function(QuestionModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answer = freezed,
    Object? choices = freezed,
    Object? assignmentId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as ChoiceModel,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChoiceModel>,
      assignmentId: assignmentId == freezed
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $ChoiceModelCopyWith<$Res> get answer {
    return $ChoiceModelCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value));
    });
  }
}

/// @nodoc
abstract class _$QuestionModelCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$QuestionModelCopyWith(
          _QuestionModel value, $Res Function(_QuestionModel) then) =
      __$QuestionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id", required: true) int id,
      @JsonKey(name: "question", required: true) String question,
      @JsonKey(name: "answer") ChoiceModel answer,
      @JsonKey(name: 'choices', required: true) List<ChoiceModel> choices,
      @JsonKey(name: "assignment_id") int? assignmentId});

  @override
  $ChoiceModelCopyWith<$Res> get answer;
}

/// @nodoc
class __$QuestionModelCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res>
    implements _$QuestionModelCopyWith<$Res> {
  __$QuestionModelCopyWithImpl(
      _QuestionModel _value, $Res Function(_QuestionModel) _then)
      : super(_value, (v) => _then(v as _QuestionModel));

  @override
  _QuestionModel get _value => super._value as _QuestionModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answer = freezed,
    Object? choices = freezed,
    Object? assignmentId = freezed,
  }) {
    return _then(_QuestionModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as ChoiceModel,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChoiceModel>,
      assignmentId: assignmentId == freezed
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionModel extends _QuestionModel {
  _$_QuestionModel(
      {@JsonKey(name: "id", required: true) required this.id,
      @JsonKey(name: "question", required: true) required this.question,
      @JsonKey(name: "answer") required this.answer,
      @JsonKey(name: 'choices', required: true) required this.choices,
      @JsonKey(name: "assignment_id") this.assignmentId})
      : super._();

  factory _$_QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$_$_QuestionModelFromJson(json);

  @override
  @JsonKey(name: "id", required: true)
  final int id;
  @override
  @JsonKey(name: "question", required: true)
  final String question;
  @override
  @JsonKey(name: "answer")
  final ChoiceModel answer;
  @override // @JsonKey(name: "")requ
  @JsonKey(name: 'choices', required: true)
  final List<ChoiceModel> choices;
  @override
  @JsonKey(name: "assignment_id")
  final int? assignmentId;

  @override
  String toString() {
    return 'QuestionModel(id: $id, question: $question, answer: $answer, choices: $choices, assignmentId: $assignmentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuestionModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.choices, choices) ||
                const DeepCollectionEquality()
                    .equals(other.choices, choices)) &&
            (identical(other.assignmentId, assignmentId) ||
                const DeepCollectionEquality()
                    .equals(other.assignmentId, assignmentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(choices) ^
      const DeepCollectionEquality().hash(assignmentId);

  @JsonKey(ignore: true)
  @override
  _$QuestionModelCopyWith<_QuestionModel> get copyWith =>
      __$QuestionModelCopyWithImpl<_QuestionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionModelToJson(this);
  }
}

abstract class _QuestionModel extends QuestionModel {
  factory _QuestionModel(
      {@JsonKey(name: "id", required: true)
          required int id,
      @JsonKey(name: "question", required: true)
          required String question,
      @JsonKey(name: "answer")
          required ChoiceModel answer,
      @JsonKey(name: 'choices', required: true)
          required List<ChoiceModel> choices,
      @JsonKey(name: "assignment_id")
          int? assignmentId}) = _$_QuestionModel;
  _QuestionModel._() : super._();

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionModel.fromJson;

  @override
  @JsonKey(name: "id", required: true)
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "question", required: true)
  String get question => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "answer")
  ChoiceModel get answer => throw _privateConstructorUsedError;
  @override // @JsonKey(name: "")requ
  @JsonKey(name: 'choices', required: true)
  List<ChoiceModel> get choices => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "assignment_id")
  int? get assignmentId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuestionModelCopyWith<_QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
