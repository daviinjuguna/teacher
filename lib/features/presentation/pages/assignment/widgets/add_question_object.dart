class AddQuestionObject {
  final String? _question;
  final String? _answer;
  AddQuestionObject({
    required String? question,
    required String? answer,
  })  : _question = question,
        _answer = answer;

  @override
  String toString() =>
      'AddQuestionObject(question: $_question, answer: $_answer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddQuestionObject &&
        other._question == _question &&
        other._answer == _answer;
  }

  @override
  int get hashCode => _question.hashCode ^ _answer.hashCode;

  String? get question => this._question;
  String? get answer => this._answer;
}
