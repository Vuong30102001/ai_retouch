// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restore_old_picture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestoreOldPictureModel _$RestoreOldPictureModelFromJson(
        Map<String, dynamic> json) =>
    RestoreOldPictureModel(
      id: json['id'] as String,
      thumbnail:
          const Uint8ListConverter().fromJson(json['thumbnail'] as String),
      mediaType: RestoreOldPictureModel._mapStringToMediaType(json['media']),
    );

Map<String, dynamic> _$RestoreOldPictureModelToJson(
        RestoreOldPictureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnail': const Uint8ListConverter().toJson(instance.thumbnail),
      'media': _$MediaTypeEnumMap[instance.mediaType]!,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
  MediaType.unknown: 'unknown',
};
