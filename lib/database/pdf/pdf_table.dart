import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("PdfDataClass")
class PdfTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get pdfDoc => text()();
  @override
  Set<Column> get primaryKey => {id};
}
