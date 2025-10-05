import 'package:code_test_flutter/src/features/photos/data/model/photo_api_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:code_test_flutter/build_config.g.dart';
part 'unsplash_client.g.dart';

const baseUrl = 'https://api.unsplash.com/';

@RestApi(baseUrl: baseUrl)
abstract class UnsplashClient {
  factory UnsplashClient(Dio dio) = _UnsplashClient;

  @GET("/photos")
  Future<List<PhotoApiModel>> getPhotos(
      {@Query("client_id") String apiKey = BuildConfig.apiKey});
}
