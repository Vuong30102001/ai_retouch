import 'dart:typed_data';
import 'package:ai_retouch/features/enhance_photo/presentation/widget/enhance_photo_child_widget.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    padding: EdgeInsets.only(right: 25.w, bottom: 10.w),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.1),
                        fontSize: 15.sp,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(1.w),
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
        ),

        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(1.w),
            child: EnhancePhotoChildWidget(media: widget.media),
          ),
        ),
      ],
    );
  }
}
