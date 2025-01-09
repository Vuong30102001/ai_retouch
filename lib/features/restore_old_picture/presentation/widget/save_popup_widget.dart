import 'dart:typed_data';

import 'package:ai_retouch/features/restore_old_picture/presentation/screen/saved_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ads/reward_ads/reward_ad_widget.dart';
import '../../../../core/utils/photo_saver/photo_saver_helper.dart';
import '../../../pro_button/presentation/widget/pro_button_widget.dart';

class SavePopupWidget extends StatelessWidget {
  final Uint8List adjustImage;
  const SavePopupWidget({super.key, required this.adjustImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
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
              Card(
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
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            color: Color(0xFF1A1A1A).withOpacity(0.1),
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              child: Padding(
                                padding: EdgeInsets.all(1.w),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    try{
                                      bool rewardShowed = await RewardAdWidget.showRewardAd();
                                      if(rewardShowed){
                                        await PhotoSaverHelper.saveImageBytesToGallery(
                                          context,
                                          adjustImage,
                                          'Enhance_Image ${DateTime.now()}',
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Hình ảnh đã được tải về thành công!')),
                                        );
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => SavedImageScreen(adjustImage: adjustImage,))
                                        );
                                      }
                                      else
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Bạn cần xem quảng cáo để tải hình ảnh.')),
                                        );
                                      }
                                    }
                                    catch (e){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Quảng cáo chưa sẵn sàng. Vui lòng thử lại sau.')),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  child: Icon(
                                    Icons.download_sharp,
                                    size: 20.w,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
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
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}
