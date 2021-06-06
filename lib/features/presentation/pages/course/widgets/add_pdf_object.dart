class AddPdfObject {
  final String? _title;
  final String? _pdf;
  AddPdfObject({
    required String? title,
    required String? pdf,
  })  : _title = title,
        _pdf = pdf;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddPdfObject &&
        other._title == _title &&
        other._pdf == _pdf;
  }

  @override
  int get hashCode => _title.hashCode ^ _pdf.hashCode;

  @override
  String toString() => 'AddPdfObject(title: $_title, pdf: $_pdf)';

  String? get title => this._title;
  String? get pdf => this._pdf;
}
