import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:teacher/core/errors/exeptions.dart';

import 'package:teacher/database/app_database.dart';
import 'package:teacher/database/pdf/pdf_table.dart';

part 'pdf_dao.g.dart';

@UseDao(tables: [PdfTable])
@lazySingleton
class PdfDao extends DatabaseAccessor<AppDatabase> with _$PdfDaoMixin {
  PdfDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future insertPdf(PdfDataClass pdf) =>
      into(pdfTable).insert(pdf).onError((error, stackTrace) {
        print("FAILED INSERT PDF: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future<List<PdfDataClass>> getPdf() =>
      select(pdfTable).get().onError((error, stackTrace) {
        print("FAILED GET PDF: $error, $stackTrace");
        throw DatabaseExeption();
      });

  Future deleteAll() => delete(pdfTable).go().onError((error, stackTrace) {
        print("FAILED DELETE PDF: $error, $stackTrace");
        throw DatabaseExeption();
      });
}
