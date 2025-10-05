import 'package:code_test_flutter/src/features/photos/data/datasource/photos_remote_data_source.dart';
import 'package:code_test_flutter/src/features/photos/domain/repository/get_photos_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:code_test_flutter/src/features/photos/domain/usecase/get_photos_use_case.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:test/test.dart';
import '../../../../mocks/get_photos_use_case_test.mocks.dart';

@GenerateMocks([PhotosRepository, GetPhotosUseCase, PhotosRemoteDataSource])
void main() {
  late GetPhotosUseCase useCase;
  late MockPhotosRepository mockRepository;

  setUp(() {
    mockRepository = MockPhotosRepository();
    useCase = GetPhotosUseCase(mockRepository);
  });

  final tPhoto =
      Photo(id: '1', title: 'Photo title', url: 'https://fueled-image.png');
  final tPhotoList = [tPhoto];

  test('should get list of photos from repository', () async {
    when(mockRepository.getPhotos()).thenAnswer((_) async => tPhotoList);

    final result = await useCase.execute();

    expect(result, tPhotoList);
    verify(mockRepository.getPhotos());
    verifyNoMoreInteractions(mockRepository);
  });
}
