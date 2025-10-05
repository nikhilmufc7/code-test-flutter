import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:code_test_flutter/src/app/core/utils/load_state.dart';

part 'home_contract.freezed.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.init() = Init;
}

@freezed
abstract class HomeData with _$HomeData {
  factory HomeData({
    @Default(LoadState.empty) LoadState loadState,
    String? errorMessage,
    @Default(<Photo>[]) List<Photo> photos,
  }) = _HomeData;
}
