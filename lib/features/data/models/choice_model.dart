import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teacher/features/domain/entities/choice.dart';

part 'choice_model.freezed.dart';
part 'choice_model.g.dart';

@freezed
class ChoiceModel with _$ChoiceModel {
  const ChoiceModel._();
  factory ChoiceModel({
    @JsonKey(name: "id", required: true) required int id,
    @JsonKey(name: "title", required: true) required String title,
    @JsonKey(name: "sort") int? sort,
    @JsonKey(name: "question_id") int? questionId,
  }) = _ChoiceModel;

  factory ChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ChoiceModelFromJson(json);

  factory ChoiceModel.fromEntity(Choice choice) =>
      ChoiceModel(id: choice.id, title: choice.title);
}

extension ChoiceModelX on ChoiceModel {
  Choice toEntity() => Choice(id: id, title: title);
}
