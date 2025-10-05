import 'package:code_test_flutter/src/features/photos/domain/repository/get_photos_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';

@injectable
class GetPhotosUseCase {
  final PhotosRepository _repository;

  GetPhotosUseCase(this._repository);

  Future<List<Photo>> execute() async {
    return await _repository.getPhotos();
  }
}
