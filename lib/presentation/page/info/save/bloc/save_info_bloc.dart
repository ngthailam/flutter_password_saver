import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/data/util/id_generator.dart';
import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:flutter_password_saver/domain/usecase/info/get_info_by_id_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/info/save_info_use_case.dart';
import 'package:flutter_password_saver/presentation/page/info/save/bloc/save_info_event.dart';
import 'package:flutter_password_saver/presentation/page/info/save/bloc/save_info_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveInfoBloc extends Bloc<SaveInfoEvent, SaveInfoState> {
  final SaveInfoUsecase _saveInfoUsecase;
  final GetInfoByIdUseCase _getInfoByIdUseCase;

  SaveInfoBloc(this._saveInfoUsecase, this._getInfoByIdUseCase)
      : super(SaveInfoState()) {
    on<ConfirmSaveInfoEvent>(_saveInfo);
    on<PrefetchInfoEvent>(_prefetchInfo);
  }

  Info? _preFetchInfo;
  late Info _inputInfo;

  bool get isDataChanged => _preFetchInfo != _inputInfo;

  FutureOr<void> _saveInfo(
    ConfirmSaveInfoEvent event,
    Emitter<SaveInfoState> emit,
  ) async {
    final infoToSave = _inputInfo.copyWith(
      createdAt: _inputInfo.createdAt == 0
          ? DateTime.now().millisecondsSinceEpoch
          : _inputInfo.createdAt,
    );
    await _saveInfoUsecase.execute(infoToSave);
    emit(state.copyWith(loadState: LoadState.success));
  }

  FutureOr<void> _prefetchInfo(
    PrefetchInfoEvent event,
    Emitter<SaveInfoState> emit,
  ) async {
    if (event.infoId == null) {
      final randomId = generateRandomUuid();
      _inputInfo = Info(
        id: randomId,
        name: '',
        desc: '',
      );
      return;
    }

    try {
      final info = await _getInfoByIdUseCase.execute(event.infoId!);
      if (info != null) {
        _inputInfo = info;
        _preFetchInfo = info;
      }
      emit(state.copyWith(info: info ?? _inputInfo));
    } catch (e) {
      // Do nothing
    }
  }

  void onNameChanged(String text) {
    _inputInfo = _inputInfo.copyWith(name: text);
  }

  void onDescChanged(String text) {
    _inputInfo = _inputInfo.copyWith(desc: text);
  }
}
