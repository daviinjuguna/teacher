import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:teacher/core/usecase/usecase.dart';
import 'package:teacher/features/domain/usecase/common/pick_file.dart';
import 'package:teacher/features/domain/usecase/common/pick_image.dart';

part 'picker_bloc.freezed.dart';
part 'picker_event.dart';
part 'picker_state.dart';

@injectable
class PickerBloc extends Bloc<PickerEvent, PickerState> {
  PickerBloc(this._image, this._file) : super(PickerState.initial());
  final PickImage _image;
  final PickFile _file;

  @override
  Stream<PickerState> mapEventToState(
    PickerEvent event,
  ) async* {
    yield* event.map(
      pickFile: (e) async* {
        yield PickerState.loading();
        final _pickedFile = await _file.call(NoParams());
        yield _pickedFile.fold(
          (l) => PickerState.error(message: l),
          (file) => PickerState.success(file: file!),
        );
      },
      pickImage: (e) async* {
        yield PickerState.loading();
        final _pickedImage =
            await _image.call(ParamsString(string: e.imageLocation));
        yield _pickedImage.fold(
          (l) => PickerState.error(message: l),
          (image) => PickerState.success(file: image),
        );
      },
    );
  }
}
