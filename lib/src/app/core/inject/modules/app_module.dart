import 'package:code_test_flutter/src/features/photos/data/datasource/photos_remote_data_source.dart';
import 'package:code_test_flutter/src/features/photos/data/repository/get_photos_repository_impl.dart';
import 'package:code_test_flutter/src/features/photos/domain/repository/get_photos_repository.dart';
import 'package:code_test_flutter/src/features/photos/domain/usecase/get_photos_use_case.dart';
import 'package:dio/dio.dart';
import 'package:code_test_flutter/src/app/core/network/client/unsplash_client.dart';
import 'package:code_test_flutter/src/features/photos/presentation/bloc/blocs/home_bloc.dart';

class AppModule {
  static const baseUrl = 'https://api.unsplash.com/';

  static final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));
// AI Code this has been generated with help of AI to speed up dev time
  static final UnsplashClient client = UnsplashClient(dio);

  static final PhotosRemoteDataSource remoteDataSource =
      PhotosRemoteDataSourceImpl(client);

  static final PhotosRepository photosRepository =
      PhotosRepositoryImpl(remoteDataSource);

  static final GetPhotosUseCase getPhotosUseCase =
      GetPhotosUseCase(photosRepository);

  static final HomeBloc bloc = HomeBloc(getPhotosUseCase);
}
