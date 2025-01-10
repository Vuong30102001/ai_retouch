// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartoon_ai_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartoonAiModel _$CartoonAiModelFromJson(Map<String, dynamic> json) =>
    CartoonAiModel(
      id: json['id'] as String,
      thumbnail:
          const Uint8ListConverter().fromJson(json['thumbnail'] as String),
      mediaType: CartoonAiModel._mapStringToMediaType(json['media']),
    );

Map<String, dynamic> _$CartoonAiModelToJson(CartoonAiModel instance) =>
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
