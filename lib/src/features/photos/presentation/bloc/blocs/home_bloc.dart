import 'dart:async';
import 'package:code_test_flutter/src/app/core/utils/load_state.dart';
import 'package:code_test_flutter/src/features/photos/domain/usecase/get_photos_use_case.dart';
import 'package:code_test_flutter/src/features/photos/presentation/bloc/blocs/home_contract.dart';

class HomeBloc {
  final _controller = StreamController<HomeData>.broadcast();

  Stream<HomeData> get stream => _controller.stream;

  HomeData _state = HomeData();

  final GetPhotosUseCase _getPhotosUseCase;

  HomeBloc(this._getPhotosUseCase);

  Future<void> initialize() async {
    _controller.sink.add(_state.copyWith(loadState: LoadState.loading));

    try {
      final photos = await _getPhotosUseCase.execute();
      _state = _state.copyWith(
        loadState: LoadState.data,
        photos: photos,
      );
    } catch (error) {
      _state = _state.copyWith(
        loadState: LoadState.error,
        errorMessage: error.toString(),
      );
    }

    _controller.sink.add(_state);
  }

  void dispose() {
    _controller.close();
  }
}
