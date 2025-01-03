import 'dart:typed_data';

import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/restore_old_picture_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../pro_button/presentation/widget/pro_button_widget.dart';

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(width: 80.w,),
                  // Menu
                  Container(
                    width: 116.w,
                    height: 32.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A1A),
                    ),
                    child: Image.asset('assets/images/menu.png'),
                  ),
                  SizedBox(width: 30.w,),
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
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: ClipRect(
                child: Container(
                  width: 375.w,
                  height: 379.w,
                  child: FutureBuilder<Uint8List?>(
                      future: imageData,
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          if(snapshot.hasError){
                            return const Center(child: Text('Error loading image'));
                          }
                          if(snapshot.hasData){
                            Uint8List? mediaImage = snapshot.data;

                            if(mediaImage != null){
                              return Image.memory(
                                mediaImage,
                                fit: BoxFit.fitWidth,
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
              ),
            ),
            Container(
              width: 375.w,
              height: 168.w,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
              ),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
                color: const Color(0xFF1A1A1A).withOpacity(0.8),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Hành động khi nhấn vào
                          },
                          child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.w),
                            ),
                            color: Colors.grey.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.w),
                                    ),
                                    color: const Color(0xFF1A1A1A).withOpacity(0.4),
                                    child: Padding(
                                      padding: EdgeInsets.all(1.w),
                                      child: Image.asset(
                                        'assets/images/diamond.png',
                                        fit: BoxFit.contain,
                                        width: 40.w,
                                        height: 40.w,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'HD quality, No Ads',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(height: 2.w),
                                      Text(
                                        'Pro Only',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20.w),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: 80.w,
                                      height: 35.w,
                                      child: const ProButtonWidget(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.w),
                        GestureDetector(
                          onTap: () {
                            context.read<RestoreOldPictureCubit>().openRestoreCheckScreen(context, widget.media);
                          },
                          child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.w),
                            ),
                            color: Colors.grey.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.w),
                                    ),
                                    color: const Color(0xFF1A1A1A).withOpacity(0.4),
                                    child: Padding(
                                      padding: EdgeInsets.all(1.w),
                                      child: Image.asset(
                                        'assets/images/icon_enhance_photo.png',
                                        fit: BoxFit.contain,
                                        width: 40.w,
                                        height: 40.w,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Restore Photo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(height: 2.w),
                                      Text(
                                        'Watch Ads',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
