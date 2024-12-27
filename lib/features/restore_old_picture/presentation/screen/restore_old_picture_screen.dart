import 'dart:typed_data';

import 'package:ai_retouch/features/restore_old_picture/presentation/widget/restore_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';

class RestoreOldPictureScreen extends StatefulWidget {
  final AssetEntity media;
  const RestoreOldPictureScreen({super.key, required this.media});

  @override
  State<RestoreOldPictureScreen> createState() => _RestoreOldPictureScreenState();
}

class _RestoreOldPictureScreenState extends State<RestoreOldPictureScreen> {
  late Future<Uint8List?> imageData;

  @override
  void initState(){
    super.initState();
    imageData = widget.media.thumbnailDataWithSize(const ThumbnailSize(400, 400));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 41.0),
        child: Column(
          children: [
            Container(
              width: 375.w,
              height: 48.w,
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nút Back
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 32.w,
                      height: 32.w,
                      margin: EdgeInsets.only(left: 20.w),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A1A),
                      ),
                      child: Image.asset('assets/images/BTN.png'),
                    ),
                  ),
                  // Menu
                  Container(
                    width: 116.w,
                    height: 32.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A1A),
                    ),
                    child: Image.asset('assets/images/menu.png'),
                  ),
                  // Save
                  Container(
                    width: 70.w,
                    height: 32.w,
                    margin: EdgeInsets.only(right: 20.w),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A1A),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 375.w,
              height: 500.w,
              child: FutureBuilder<Uint8List?>(
                  future: imageData,
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasError){
                        return const Center(child: Text('Error loading image'));
                      }
                      if(snapshot.hasData){
                        Uint8List? imageBytes = snapshot.data;
                        if(imageBytes != null){
                          return Image.memory(
                            imageBytes,
                            fit: BoxFit.contain,
                          );
                        }
                        else
                          {
                            return const Center(child: Text('No image data found'));
                          }
                      }
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
              ),
            ),
            RestoreActionWidget(media: widget.media),
          ],
        ),
      ),
    );
  }
}
