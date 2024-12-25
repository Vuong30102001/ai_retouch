import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/converters/uint8list_converter.dart';
import '../../domain/entities/enhance_photo_entity.dart';

part 'enhance_photo_model.g.dart';

@JsonSerializable()
class EnhancePhotoModel {
  final String id;

  @Uint8ListConverter()
  final Uint8List thumbnail;

  @JsonKey(name: 'media', fromJson: _mapStringToMediaType)
  final MediaType media;

  EnhancePhotoModel({
    required this.id,
    required this.thumbnail,
    required this.media,
  });

  factory EnhancePhotoModel.fromJson(Map<String, dynamic> json) =>
      _$EnhancePhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EnhancePhotoModelToJson(this);

  EnhancePhotoEntity toEntity() {
    return EnhancePhotoEntity(
      id: id,
      thumbnail: thumbnail,
      mediaType: media,
    );
  }

  static MediaType _mapStringToMediaType(dynamic type) {
    if (type is int) {
      switch (type) {
        case 0:
          return MediaType.image;
        case 1:
          return MediaType.video;
        default:
          return MediaType.unknown;
      }
    } else if (type is String) {
      switch (type.toLowerCase()) {
        case 'image':
          return MediaType.image;
        case 'video':
          return MediaType.video;
        default:
          return MediaType.unknown;
      }
    }
    return MediaType.unknown;
  }
}
