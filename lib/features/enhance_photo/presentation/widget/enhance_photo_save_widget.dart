import 'package:ai_retouch/features/pro_button/presentation/widget/pro_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';

import '../screen/enhance_photo_screen.dart';

class EnhancePhotoSaveWidget extends StatefulWidget {
  final AssetEntity media;
  const EnhancePhotoSaveWidget({super.key, required this.media});

  @override
  State<EnhancePhotoSaveWidget> createState() => _EnhancePhotoSaveWidgetState();
}

class _EnhancePhotoSaveWidgetState extends State<EnhancePhotoSaveWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      color: Color(0xFF1A1A1A).withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.all(16.w),
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
                        color: Color(0xFF1A1A1A).withOpacity(0.4),
                        child: Padding(
                          padding: EdgeInsets.all(1.w),
                          child: Image.asset(
                            'assets/images/icon_diamond_pro.png',
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
                      SizedBox(width: 20.w,),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              width: 80.w,
                              height: 35.w,
                              child: const ProButtonWidget()
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.w),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnhancePhotoScreen(media: widget.media),
                  ),
                );
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
                        color: Color(0xFF1A1A1A).withOpacity(0.4),
                        child: Padding(
                          padding: EdgeInsets.all(1.w),
                          child: Container(
                            width: 40.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: const Icon(
                              Icons.download_sharp,
                              size: 20,
                              color: Colors.white,
                            ),
                          )
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Watch Ads',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 2.w),
                          Text(
                            'Free',
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
    );
  }
}
