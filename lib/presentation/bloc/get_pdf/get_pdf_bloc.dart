import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/data/models/pdf_model.dart';
import 'package:teacher/domain/entities/pdf.dart';
import 'package:teacher/domain/usecase/common/get_pdf.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'get_pdf_event.dart';
part 'get_pdf_state.dart';
part 'get_pdf_bloc.freezed.dart';

@injectable
class GetPdfBloc extends Bloc<GetPdfEvent, GetPdfState> {
  GetPdfBloc(this._getPdf) : super(GetPdfState.initial());
  final GetPdf _getPdf;

  @override
  Stream<GetPdfState> mapEventToState(
    GetPdfEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        yield GetPdfState.loading();
        final _pdf = await _getPdf.call(ParamsId(id: e.id));
        yield _pdf.fold(
          (l) => GetPdfState.error(message: l),
          (pdf) => GetPdfState.success(pdf: pdf),
        );
      },
      update: (e) async* {
        yield GetPdfState.updating();
        final _pdf = await _getPdf.call(ParamsId(id: e.id));
        yield _pdf.fold(
          (l) => GetPdfState.error(message: l),
          (pdf) => GetPdfState.success(pdf: pdf),
        );
      },
    );
  }
}
