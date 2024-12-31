import 'dart:typed_data';

import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/restore_old_picture_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/screen/restored_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestoreWatchAdsScreen extends StatefulWidget {
  final AssetEntity media;
  const RestoreWatchAdsScreen({super.key, required this.media});

  @override
  State<RestoreWatchAdsScreen> createState() => _RestoreWatchAdsScreenState();
}

class _RestoreWatchAdsScreenState extends State<RestoreWatchAdsScreen> {
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
        padding: const EdgeInsets.only(top: 41.0),
        child: Column(
          children: [
            Container(
              width: 375.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: Color(0xFF1A1A1A),
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      margin: EdgeInsets.only(left: 20.w),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A1A1A),
                      ),
                      child: Image.asset('assets/images/BTN.png'),
                    ),
                  ],
                )
              ),
            ),
            Container(
              width: 375.w,
              height: 589.w,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 375.w,
                  height: 400.w,
                  child: FutureBuilder<Uint8List?>(
                    future: imageData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(child: Text('Error load image: ${snapshot.error}'));
                        }
                        if (snapshot.hasData) {
                          Uint8List? imageBytes = snapshot.data;
                          if (imageBytes != null) {
                            return Image.memory(
                              imageBytes,
                              fit: BoxFit.fitHeight,
                            );
                          } else {
                            return const Center(child: Text('No image data found'));
                          }
                        }
                      }
                      return const SizedBox.shrink();
                    },
                  )

                ),
              ),
            ),
            Container(
              width: 375.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: Color(0xFF1A1A1A),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    await context.read<RestoreOldPictureCubit>().restoreImage(widget.media);

                    if (context.mounted) {
                      Navigator.pop(context);

                      context.read<RestoreOldPictureCubit>().openRestoredImageScreen(context, widget.media);
                    }
                  },
                  child: Container(
                    width: 336.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
