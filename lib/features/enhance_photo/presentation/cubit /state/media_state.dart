import 'package:ai_retouch/features/enhance_photo/domain/entities/media_entity.dart';

abstract class MediaState{}

class MediaInitial extends MediaState{}

class MediaLoading extends MediaState{}

class MediaLoaded extends MediaState{
  final List<MediaEntity> mediaList;
  final bool hasMore;
  MediaLoaded({required this.mediaList, required this.hasMore});
}

class MediaError extends MediaState{
  final String errorMessage;
  MediaError({required this.errorMessage});
}