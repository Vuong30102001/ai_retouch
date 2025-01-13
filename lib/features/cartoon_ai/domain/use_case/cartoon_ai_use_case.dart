import 'package:ai_retouch/features/cartoon_ai/domain/entity/cartoon_style.dart';
import 'package:ai_retouch/features/cartoon_ai/domain/repository/cartoon_ai_repository.dart';
import 'package:photo_manager/photo_manager.dart';

class CartoonAiUseCase{
  final CartoonAiRepository cartoonAiRepository;
  CartoonAiUseCase(this.cartoonAiRepository);

  Future<List<AssetPathEntity>> getAlbums() async {
    return cartoonAiRepository.fetchAlbums();
  }

  Future<List<CartoonStyle>> getStyles() async {
    return cartoonAiRepository.fetchStyles();
  }

  Future<String> getPathStyle(String imagePath, String styleId) async {
    return cartoonAiRepository.uploadImage(imagePath, styleId);
  }
}