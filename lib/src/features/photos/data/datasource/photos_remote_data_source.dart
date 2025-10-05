import 'package:code_test_flutter/src/app/core/network/client/unsplash_client.dart';
import 'package:injectable/injectable.dart';
import 'package:code_test_flutter/src/features/photos/data/model/photo_api_model.dart';
import 'package:dio/dio.dart';

abstract class PhotosRemoteDataSource {
  Future<List<PhotoApiModel>> getPhotos();
}

@Injectable(as: PhotosRemoteDataSource)
class PhotosRemoteDataSourceImpl implements PhotosRemoteDataSource {
  final UnsplashClient _client;

  PhotosRemoteDataSourceImpl(this._client);

  @override
  Future<List<PhotoApiModel>> getPhotos() async {
    final cancelToken = CancelToken();
    try {
      return await _client.getPhotos();
    } catch (e) {
      cancelToken.cancel();
      rethrow;
    }
  }
}
