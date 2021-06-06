import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/usecase/teacher/create_pdf.dart';
import 'package:teacher/features/domain/usecase/teacher/delete_pdf.dart';
import 'package:teacher/features/domain/usecase/teacher/edit_pdf.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_pdf_event.dart';
part 'create_pdf_state.dart';
part 'create_pdf_bloc.freezed.dart';

@injectable
class CreatePdfBloc extends Bloc<CreatePdfEvent, CreatePdfState> {
  CreatePdfBloc(this._pdf, this._edit, this._delete)
      : super(CreatePdfState.initial());
  final CreatePdf _pdf;
  final EditPdf _edit;
  final DeletePdf _delete;

  @override
  Stream<CreatePdfState> mapEventToState(
    CreatePdfEvent event,
  ) async* {
    yield* event.map(
      create: (e) async* {
        yield CreatePdfState.load();
        final _res = await _pdf.call(
            CreatePdfParams(courseId: e.courseId, title: e.title, pdf: e.pdf));
        yield _res.fold(
          (l) => CreatePdfState.error(l),
          (r) => CreatePdfState.success(r.message),
        );
      },
      edit: (e) async* {
        yield CreatePdfState.load();
        final _res = await _edit
            .call(EditPdfParams(pdfId: e.pdfId, title: e.title, pdf: e.pdf));
        yield _res.fold(
          (l) => CreatePdfState.error(l),
          (r) => CreatePdfState.success(r.message),
        );
      },
      delete: (e) async* {
        yield CreatePdfState.load();
        final _res = await _delete.call(ParamsId(id: e.pdfId));
        yield _res.fold(
          (l) => CreatePdfState.error(l),
          (r) => CreatePdfState.success(r.message),
        );
      },
    );
  }
}
