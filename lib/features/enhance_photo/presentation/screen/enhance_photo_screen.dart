import 'dart:typed_data';
import 'package:ai_retouch/features/enhance_photo/presentation/widget/enhance_photo_save_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:image/image.dart' as img;

import '../widget/enhance_photo_child_widget.dart';

class EnhancePhotoScreen extends StatefulWidget {
  final AssetEntity media;
  const EnhancePhotoScreen({super.key, required this.media});

  @override
  State<EnhancePhotoScreen> createState() => _EnhancePhotoScreenState();
}

class _EnhancePhotoScreenState extends State<EnhancePhotoScreen> {
  late Future<Uint8List?> originalImage = Future.value(null);
  late Uint8List adjustedImage;
  double _dividerPosition = 0.5;
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final imageData = await widget.media.thumbnailDataWithSize(const ThumbnailSize(400, 400));
      setState(() {
        originalImage = Future.value(imageData);
        adjustedImage = _adjustBrightness(imageData!, 1.2);
      });
  }

  Uint8List _adjustBrightness(Uint8List originalImage, double brightnessFactor) {
    // Giải mã ảnh từ Uint8List
    final decodedImage = img.decodeImage(originalImage);
    if (decodedImage == null) return originalImage;

    // Duyệt qua từng pixel để điều chỉnh độ sáng
    final width = decodedImage.width;
    final height = decodedImage.height;

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final pixel = decodedImage.getPixel(x, y);

        // Lấy giá trị R, G, B từ pixel
        int r = img.getRed(pixel);
        int g = img.getGreen(pixel);
        int b = img.getBlue(pixel);

        // Điều chỉnh độ sáng
        r = (r * brightnessFactor).clamp(0, 255).toInt();
        g = (g * brightnessFactor).clamp(0, 255).toInt();
        b = (b * brightnessFactor).clamp(0, 255).toInt();

        // Cập nhật pixel bằng cách sử dụng getColor để tạo màu mới
        decodedImage.setPixel(x, y, img.getColor(r, g, b)); // getColor tạo đối tượng màu mới
      }
    }

    // Mã hóa lại ảnh thành Uint8List
    return Uint8List.fromList(img.encodePng(decodedImage));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(1.w),
            child: Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, bottom: 10.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.dangerous_outlined,
                        size: 20.w,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w, bottom: 8.w),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _isSaved = true;
                        });
                      },
                      child: Container(
                          width: 40.w,
                          height: 15.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blue.withOpacity(0.8),
                          ),
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          )
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: FutureBuilder<Uint8List?>(
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
                        child: Container(
                          width: 4.w,
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
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(1.w),
            child: Container(
              alignment: Alignment.center,
              child: _isSaved
              ? Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(1.w),
                        child: EnhancePhotoSaveWidget(media: widget.media, adjustImage: adjustedImage,),
                        )
                      ),
                  ],
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 12.w,
                    color: Colors.green,
                  ),
                  SizedBox(width: 4.w,),
                  Text(
                    'Enhance photo done! Hope you like it',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        decoration: TextDecoration.none
                    ),
                  ),
                ],
              )
            ),
          ),
        )
      ],
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
