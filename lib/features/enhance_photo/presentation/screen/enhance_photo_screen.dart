import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class EnhancePhotoScreen extends StatefulWidget {
  final AssetEntity media;
  const EnhancePhotoScreen({super.key, required this.media});

  @override
  State<EnhancePhotoScreen> createState() => _EnhancePhotoScreenState();
}

class _EnhancePhotoScreenState extends State<EnhancePhotoScreen> {
  late Future<Uint8List?> originalImage;
  late Uint8List adjustedImage;
  double _dividerPosition = 0.5;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final imageData =
    await widget.media.thumbnailDataWithSize(const ThumbnailSize(400, 400));
    if (imageData != null) {
      setState(() {
        originalImage = Future.value(imageData);
        adjustedImage = _adjustBrightness(imageData, 1.5);
      });
    }
  }

  Uint8List _adjustBrightness(Uint8List originalImage, double brightnessFactor) {
    return originalImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enhance Photo')),
      body: FutureBuilder<Uint8List?>(
        future: originalImage,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final original = snapshot.data!;
            return GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dividerPosition += details.primaryDelta! / context.size!.width;
                  _dividerPosition = _dividerPosition.clamp(0.0, 1.0);
                });
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.memory(
                      adjustedImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRect(
                      clipper: HorizontalClipper(_dividerPosition),
                      child: Image.memory(
                        original,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * _dividerPosition - 2,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: 4,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class HorizontalClipper extends CustomClipper<Rect> {
  final double dividerPosition;

  HorizontalClipper(this.dividerPosition);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * dividerPosition, size.height);
  }

  @override
  bool shouldReclip(covariant HorizontalClipper oldClipper) {
    return dividerPosition != oldClipper.dividerPosition;
  }
}
