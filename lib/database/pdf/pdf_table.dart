import 'package:moor/moor.dart';

@DataClassName("PdfDataClass")
class PdfTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get pdfDoc => text()();
  IntColumn get courseId => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
