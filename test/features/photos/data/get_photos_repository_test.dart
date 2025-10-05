import 'package:code_test_flutter/src/features/photos/data/model/photo_urls_api_model.dart';
import 'package:code_test_flutter/src/features/photos/data/repository/get_photos_repository_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:code_test_flutter/src/features/photos/data/model/photo_api_model.dart';
import 'package:test/test.dart';
import '../../../mocks/get_photos_use_case_test.mocks.dart';

void main() {
  late PhotosRepositoryImpl repository;
  late MockPhotosRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockPhotosRemoteDataSource();
    repository = PhotosRepositoryImpl(mockRemoteDataSource);
  });

  final photoApiModel = PhotoApiModel(
      '1', 'Test description', PhotoUrlsApiModel("full", "thumb"));

  final photoDomainEntity = Photo(
    id: '1',
    title: 'Test description',
    url: 'full',
  );

  test('should return list of photos when remote data source succeeds',
      () async {
    when(mockRemoteDataSource.getPhotos())
        .thenAnswer((_) async => [photoApiModel]);

    final result = await repository.getPhotos();

    expect(result.length, 1);
    expect(result[0].id, photoDomainEntity.id);
    expect(result[0].title, photoDomainEntity.title);
    verify(mockRemoteDataSource.getPhotos()).called(1);
  });

  test('should throw exception with proper message when remote fails',
      () async {
    when(mockRemoteDataSource.getPhotos()).thenThrow(Exception('Remote error'));

    Future<List<Photo>> call() => repository.getPhotos();

    expect(
      call(),
      throwsA(predicate((e) =>
          e is Exception && e.toString().contains('Failed to fetch photos:'))),
    );
    verify(mockRemoteDataSource.getPhotos()).called(1);
  });
}
