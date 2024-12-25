import 'dart:typed_data';

import 'package:ai_retouch/features/restore_old_picture/domain/entities/restore_old_picture_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/converters/uint8list_converter.dart';

part 'restore_old_picture_model.g.dart';

@JsonSerializable()
class RestoreOldPictureModel{

  final String id;

  @Uint8ListConverter()
  final Uint8List thumbnail;

  @JsonKey(name: 'media', fromJson: _mapStringToMediaType)
  final MediaType mediaType;

  RestoreOldPictureModel({required this.id, required this.thumbnail, required this.mediaType});

  factory RestoreOldPictureModel.fromJson(Map<String, dynamic> json) => _$RestoreOldPictureModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestoreOldPictureModelToJson(this);

  RestoreOldPictureEntity toEntity(){
    return RestoreOldPictureEntity(id: id, thumbnail: thumbnail, mediaType: mediaType);
  }

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
      switch(type.toLowerCase()){
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