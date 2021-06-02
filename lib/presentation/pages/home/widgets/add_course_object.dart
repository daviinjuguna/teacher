class AddCourseObject {
  final String? _title;
  final String? _desc;
  final String? _imgUrl;

  AddCourseObject({
    required String? title,
    required String? desc,
    required String? imgUrl,
  })   : _title = title,
        _desc = desc,
        _imgUrl = imgUrl;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddCourseObject &&
        other._title == _title &&
        other._desc == _desc &&
        other._imgUrl == _imgUrl;
  }

  @override
  int get hashCode => _title.hashCode ^ _desc.hashCode ^ _imgUrl.hashCode;

  String? get title => this._title;
  String? get desc => this._desc;
  String? get imgUrl => this._imgUrl;

  @override
  String toString() =>
      'AddCourseArguments(_title: $_title, _desc: $_desc, _imgUrl: $_imgUrl)';
}
