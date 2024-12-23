// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enhance_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnhancePhotoModel _$EnhancePhotoModelFromJson(Map<String, dynamic> json) =>
    EnhancePhotoModel(
      id: json['id'] as String,
      thumbnail:
          const Uint8ListConverter().fromJson(json['thumbnail'] as String),
      media: EnhancePhotoModel._mapStringToMediaType(json['media']),
    );

Map<String, dynamic> _$EnhancePhotoModelToJson(EnhancePhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnail': const Uint8ListConverter().toJson(instance.thumbnail),
      'media': _$MediaTypeEnumMap[instance.media]!,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
  MediaType.unknown: 'unknown',
};
