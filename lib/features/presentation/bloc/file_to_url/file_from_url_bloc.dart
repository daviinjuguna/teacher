import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/usecase/common/get_file_from_url.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'file_from_url_event.dart';
part 'file_from_url_state.dart';
part 'file_from_url_bloc.freezed.dart';

@injectable
class FileFromUrlBloc extends Bloc<FileFromUrlEvent, FileFromUrlState> {
  FileFromUrlBloc(this._get) : super(FileFromUrlState.initial());
  final GetFileFromUrl _get;

  @override
  Stream<FileFromUrlState> mapEventToState(
    FileFromUrlEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        yield FileFromUrlState.loading();
        final _res = await _get.call(ParamsString(string: e.url));
        yield _res.fold(
          (l) => FileFromUrlState.error(message: l),
          (r) => FileFromUrlState.success(file: r),
        );
      },
    );
  }
}
