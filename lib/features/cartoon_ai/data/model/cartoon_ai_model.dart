import 'dart:typed_data';

import 'package:ai_retouch/core/converters/uint8list_converter.dart';
import 'package:ai_retouch/features/cartoon_ai/domain/entity/cartoon_ai_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cartoon_ai_model.g.dart';

@JsonSerializable()
class CartoonAiModel{
  final String id;

  @Uint8ListConverter()
  final Uint8List thumbnail;

  @JsonKey(name: 'media', fromJson: _mapStringToMediaType)
  final MediaType mediaType;

  CartoonAiModel({required this.id, required this.thumbnail, required this.mediaType});

  factory CartoonAiModel.fromJson(Map<String, dynamic> json) => _$CartoonAiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartoonAiModelToJson(this);

  static MediaType _mapStringToMediaType(dynamic type){
    if(type is int){
      switch(type){
        case 0:
          return MediaType.image;
        case 1:
          return MediaType.video;
        default:
          return MediaType.unknown;
      }
    }
    else if(type is String){
      switch(type){
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
