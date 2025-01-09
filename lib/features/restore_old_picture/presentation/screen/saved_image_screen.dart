import 'dart:typed_data';

import 'package:ai_retouch/features/home/presentation/screen/home_screen.dart';
import 'package:ai_retouch/features/pro_button/presentation/widget/pro_button_widget.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/screen/album_restore_media_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../subscription/presentation/screen/subscription_screen.dart';

class SavedImageScreen extends StatelessWidget {
  final Uint8List adjustImage;
  const SavedImageScreen({super.key, required this.adjustImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(41.0),
        child: Column(
          children: [
            Container(
              width: 375.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: Color(0xFF1A1A1A),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        child: Image.asset('assets/images/Icon.png'),
                      ),
                    ),
                    SizedBox(
                      width: 130.5.w,
                      height: 17.w,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 17.w,
                              height: 17.w,
                              child: Image.asset('assets/images/Done.png'),
                            ),
                            SizedBox(
                              width: 92.w,
                              height: 15.w,
                              child: Text(
                                'Image Saved!',
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen())
                        );
                      },
                      child: SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child: Image.asset('assets/images/home.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 375.w,
              height: 540.w,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.memory(
                      adjustImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 65.w,
                    left: 205.w,
                    child: Image.asset('assets/images/share.png'),
                  )
                ],
              )
            ),
            Container(
              width: 375.w,
              height: 92.w,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AlbumRestoreMediaScreen())
                        );
                      },
                      child: Container(
                        width: 140.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: SizedBox(
                          width: 111.w,
                          height: 16.w,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 16.w,
                                  height: 16.w,
                                  child: const Icon(Icons.add, color: Colors.white,),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                SizedBox(
                                    width: 87.w,
                                    height: 18.w,
                                    child: Center(
                                      child: Text(
                                        'New Image',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'PlusJakartaSans',
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const SubscriptionScreen())
                        );
                      },
                      child: Container(
                        width: 140.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: Colors.limeAccent,
                        ),
                        child: Center(
                            child: Container(
                              width: 107.w,
                              height: 16.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 16.w,
                                    height: 16.w,
                                    child: Image.asset('assets/images/crown.png'),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const ProButtonWidget())
                                      );
                                    },
                                    child: SizedBox(
                                      width: 83.w,
                                      height: 18.w,
                                      child: Center(
                                        child: Text(
                                          'Unlock Pro',
                                          style: TextStyle(
                                            fontFamily: 'PlusJakartaSans',
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
