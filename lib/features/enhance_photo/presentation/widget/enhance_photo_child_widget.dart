import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';

import '../screen/enhance_photo_screen.dart';

class EnhancePhotoChildWidget extends StatefulWidget {
  final AssetEntity media;
  const EnhancePhotoChildWidget({super.key, required this.media});

  @override
  State<EnhancePhotoChildWidget> createState() => _EnhancePhotoChildWidgetState();
}

class _EnhancePhotoChildWidgetState extends State<EnhancePhotoChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: Color(0xFF1A1A1A).withOpacity(0.8),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 1.w,
                          bottom: 1.w,
                        ),
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.w),
                          color: Color(0xFF1A1A1A).withOpacity(0.4),
                        ),
                        child: Image.asset(
                          'assets/images/icon_enhance_photo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        padding: EdgeInsets.only(
                          left: 1.w,
                          top: 1.w,
                          bottom: 1.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HD quality No Ads',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 2.w,),
                            Text(
                              'Pro Only',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.w,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EnhancePhotoScreen(media: widget.media)),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 1.w,
                          bottom: 1.w,
                        ),
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.w),
                          color: Color(0xFF1A1A1A).withOpacity(0.4),
                        ),
                        child: Image.asset(
                          'assets/images/icon_enhance_photo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        padding: EdgeInsets.only(
                          left: 1.w,
                          top: 1.w,
                          bottom: 1.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enhance Photo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 2.w,),
                            Text(
                              'Watch Ads',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
  }
}
