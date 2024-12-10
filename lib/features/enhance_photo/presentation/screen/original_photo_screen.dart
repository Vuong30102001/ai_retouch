import 'dart:typed_data';
import 'package:ai_retouch/features/enhance_photo/presentation/widget/enhance_photo_child_widget.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class OriginalPhotoScreen extends StatefulWidget {
  final AssetEntity media;
  const OriginalPhotoScreen({super.key, required this.media});

  @override
  State<OriginalPhotoScreen> createState() => _OriginalPhotoScreenState();
}

class _OriginalPhotoScreenState extends State<OriginalPhotoScreen> {
  late Future<Uint8List?> imageData;

  @override
  void initState() {
    super.initState();
    imageData =
        widget.media.thumbnailDataWithSize(const ThumbnailSize(400, 400));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhance photo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Uint8List?>(
              future: imageData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error loading image'));
                  }
                  if (snapshot.hasData) {
                    Uint8List? imageBytes = snapshot.data;
                    if (imageBytes != null) {
                      return Image.memory(
                        imageBytes,
                        fit: BoxFit.contain,
                        width: screenWidth,
                        height: screenHeight,
                      );
                    } else {
                      return const Center(child: Text('No image data found'));
                    }
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          EnhancePhotoChildWidget(media: widget.media),
        ],
      )
    );
  }
}
