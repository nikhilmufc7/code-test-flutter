import 'package:code_test_flutter/src/features/photos/data/datasource/photos_remote_data_source.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:code_test_flutter/src/features/photos/domain/repository/get_photos_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PhotosRepository)
class PhotosRepositoryImpl implements PhotosRepository {
  final PhotosRemoteDataSource _remoteDataSource;

  PhotosRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Photo>> getPhotos() async {
    try {
      final photoModels = await _remoteDataSource.getPhotos();
      return photoModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to fetch photos: $e');
    }
  }
}
