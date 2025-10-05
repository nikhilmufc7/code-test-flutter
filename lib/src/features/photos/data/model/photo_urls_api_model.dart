import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part './photo_urls_api_model.g.dart';

@JsonSerializable()
class PhotoUrlsApiModel {
  final String full;
  final String thumb;

  factory PhotoUrlsApiModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlsApiModelFromJson(json);

  PhotoUrlsApiModel(
    this.full,
    this.thumb,
  );

  PhotoUrls toEntity() {
    return PhotoUrls(
      full: full,
      thumb: thumb,
    );
  }
}
