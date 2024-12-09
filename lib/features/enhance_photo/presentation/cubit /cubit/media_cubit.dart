import 'package:ai_retouch/features/enhance_photo/domain/repositories/media_repository.dart';
import 'package:ai_retouch/features/enhance_photo/presentation/cubit%20/state/media_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaCubit extends Cubit<MediaState>{
  final MediaRepository mediaRepository;
  int currentPage = 0;
  final int sizePage = 60;

  MediaCubit(this.mediaRepository): super(MediaInitial());

  Future<void> loadMedia({bool isLoadMore = false}) async {
    if(state is MediaLoading) return;

    try {
      if (isLoadMore && state is MediaLoaded) {
        emit(MediaLoading());
      }
      else if (!isLoadMore) {
        emit(MediaInitial());
      }

      final newMedia = await mediaRepository.fetchMedia(currentPage, sizePage);
      final hasMore = newMedia.isNotEmpty;

      if (state is MediaLoaded && isLoadMore) {
        final previousMedia = (state as MediaLoaded).mediaList;
        emit(MediaLoaded(
            mediaList: [...previousMedia, ...newMedia],
            hasMore: hasMore
        ));
      }
      else {
        emit(MediaLoaded(
            mediaList: newMedia,
            hasMore: hasMore
        ));
      }
      currentPage ++;
    }
    catch(e){
      emit(MediaError(errorMessage: e.toString()));
    }
  }
}