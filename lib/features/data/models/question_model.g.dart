// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionModel _$_$_QuestionModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'question', 'choices']);
  return _$_QuestionModel(
    id: json['id'] as int,
    question: json['question'] as String,
    answer: ChoiceModel.fromJson(json['answer'] as Map<String, dynamic>),
    choices: (json['choices'] as List<dynamic>)
        .map((e) => ChoiceModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    assignmentId: json['assignment_id'] as int?,
  );
}

Map<String, dynamic> _$_$_QuestionModelToJson(_$_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'choices': instance.choices,
      'assignment_id': instance.assignmentId,
    };
