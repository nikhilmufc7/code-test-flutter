import 'package:code_test_flutter/src/features/photos/data/model/photo_urls_api_model.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part './photo_api_model.g.dart';

@JsonSerializable()
class PhotoApiModel {
  final String id;
  final String? description;
  final PhotoUrlsApiModel urls;

  factory PhotoApiModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoApiModelFromJson(json);

  PhotoApiModel(
    this.id,
    this.description,
    this.urls,
  );

  Photo toEntity() {
    return Photo(
      id: id,
      url: urls.full,
      title: description ?? '',
    );
  }
}
