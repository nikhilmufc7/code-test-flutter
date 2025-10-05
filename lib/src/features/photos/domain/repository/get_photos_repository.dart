import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';

abstract class PhotosRepository {
  Future<List<Photo>> getPhotos();
}
