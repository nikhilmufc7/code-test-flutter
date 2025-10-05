import 'dart:async';
import 'package:mockito/mockito.dart';
import 'package:code_test_flutter/src/features/photos/presentation/bloc/blocs/home_bloc.dart';
import 'package:code_test_flutter/src/features/photos/presentation/bloc/blocs/home_contract.dart';
import 'package:code_test_flutter/src/app/core/utils/load_state.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:test/test.dart';
import '../../../../mocks/get_photos_use_case_test.mocks.dart';

void main() {
  late MockGetPhotosUseCase mockUseCase;
  late HomeBloc bloc;

  setUp(() {
    mockUseCase = MockGetPhotosUseCase();
    bloc = HomeBloc(mockUseCase);
  });

  tearDown(() {
    bloc.dispose();
  });

  final mockPhoto =
      Photo(id: '1', title: 'Test', url: 'https://fueled-image.png');
  final tPhotos = [mockPhoto];

  test('emits [loading, data] when usecase succeeds', () async {
    when(mockUseCase.execute()).thenAnswer((_) async => tPhotos);

    final states = <HomeData>[];
    final sub = bloc.stream.listen(states.add);

    await bloc.initialize();
    //AI was used to fix warning for this code
    await Future<void>.delayed(const Duration(milliseconds: 10));
    // AI Fix end
    expect(states[0].loadState, LoadState.loading);
    expect(states[1].loadState, LoadState.data);
    expect(states[1].photos, tPhotos);

    await sub.cancel();
  });

  test('emits [loading, error] when usecase throws', () async {
    when(mockUseCase.execute()).thenThrow(Exception('error'));

    final states = <HomeData>[];
    final sub = bloc.stream.listen(states.add);

    await bloc.initialize();
    //AI was used to fix warning for this code
    await Future<void>.delayed(const Duration(milliseconds: 10));
    // -- AI fix end
    expect(states[0].loadState, LoadState.loading);
    expect(states[1].loadState, LoadState.error);
    expect(states[1].errorMessage, contains('Exception'));

    await sub.cancel();
  });
}
