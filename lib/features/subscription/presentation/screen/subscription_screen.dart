import 'dart:async';

import 'package:ai_retouch/features/enhance_photo/presentation/screen/album_enhance_media_screen.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/screen/album_restore_media_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final ScrollController _scrollController_1 = ScrollController();
  final ScrollController _scrollController_2 = ScrollController();

  late Timer _timer;

  @override
  void initState(){
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 50), (timer){
      if(_scrollController_1.hasClients){
        double maxScroll = _scrollController_1.position.maxScrollExtent;
        double currentScroll = _scrollController_1.position.pixels;

        if(currentScroll >= maxScroll){
          _scrollController_1.jumpTo(0);
        }
        else
          {
            _scrollController_1.animateTo(
                currentScroll + 5,
                duration: const Duration(milliseconds: 100),
                curve: Curves.linear,
            );
          }
      }

      if(_scrollController_2.hasClients){
        double maxScroll = _scrollController_2.position.maxScrollExtent;
        double currentScroll = _scrollController_2.position.pixels;

        if(currentScroll >= maxScroll){
          _scrollController_2.jumpTo(0);
        }
        else
        {
          _scrollController_2.animateTo(
            currentScroll + 5,
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  void dispose(){
    _timer.cancel();
    _scrollController_1.dispose();
    _scrollController_2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SingleChildScrollView(
              controller: _scrollController_1,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(top: 44.h),
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
                      child: SizedBox(
                        width: 90.w,
                        height: 90.w,
                        child: Image.asset('assets/images/restore_old.png'),
                      ),
                    ),
                    SizedBox(
                      width: 90.w,
                      height: 90.w,
                      child: Image.asset('assets/images/remove_object.png'),
                    ),
                    SizedBox(
                      width: 90.w,
                      height: 90.w,
                      child: Image.asset('assets/images/ai_anime.png'),
                    ),
                    SizedBox(
                      width: 90.w,
                      height: 90.w,
                      child: Image.asset('assets/images/ai_filter.png'),
                    ),
                    SizedBox(
                      width: 90.w,
                      height: 90.w,
                      child: Image.asset('assets/images/remove_background.png'),
                    )
                  ],
                )
              ),
            ),
            SingleChildScrollView(
              controller: _scrollController_2,
              scrollDirection: Axis.horizontal,
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 90.w,
                        height: 90.w,
                        child: Image.asset('assets/images/edit_background.png'),
                      ),
                      SizedBox(
                        width: 90.w,
                        height: 90.w,
                        child: Image.asset('assets/images/remove_wire.png'),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AlbumEnhanceMediaScreen())
                          );
                        },
                        child: SizedBox(
                          width: 90.w,
                          height: 90.w,
                          child: Image.asset('assets/images/enhance_photo.png'),
                        ),
                      ),
                      SizedBox(
                        width: 90.w,
                        height: 90.w,
                        child: Image.asset('assets/images/remove_text.png'),
                      ),
                      SizedBox(
                        width: 90.w,
                        height: 90.w,
                        child: Image.asset('assets/images/cartoon_ai.png'),
                      )
                    ],
                  )
              ),
          ],
        ),
        Positioned(
          top: 52.w,
          left: 20.w,
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A).withOpacity(0.5),
              ),
              child: const Icon(Icons.close),
            ),
          ),
        ),
        Positioned(
          top: 256.w,
          left: 76.w,
          child: SizedBox(
            width: 222.w,
            height: 26.w,
            child: Center(
              child: Text(
                'Unlock all Features',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: 'PlusJakartaSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ),
        ),
        Positioned(
          top: 298.w,
          left: 187.w,
          child: SizedBox(
            width: 75.w,
            height: 14.w,
            child: Center(
              child: Text(
                'No subscription',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: 'PlusJakartaSans',
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 298.w,
          left: 286.w,
          child: SizedBox(
            width: 69.w,
            height: 14.w,
            child: Center(
              child: Text(
                'AI Retouch Pro',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: 'PlusJakartaSans',
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 320.w,
          child: SizedBox(
            width: 375.w,
            height: 252.w,
            child: Image.asset('assets/images/list_sub.png'),
          ),
        ),
        Positioned(
          top: 573.w,
          child: Container(
            width: 375.w,
            height: 239.w,
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
            ),
            child: Stack(
              children: [
                    Positioned(
                      top: 16.0,
                      left: 19.0,
                      child: Container(
                        width: 337.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44.0),
                          color: Colors.white.withOpacity(0.02),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 102.w,
                                height: 15.w,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    '3-Day free Trial',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'PlusJakartaSans',
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: SizedBox(
                                    width: 61.w,
                                    height: 40.w,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'only \$ 2.99',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: 'PlusJakartaSans',
                                              color: Colors.white.withOpacity(0.8),
                                            ),
                                          ),
                                          Text(
                                            'per week',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: 'PlusJakartaSans',
                                              color: Colors.white.withOpacity(0.8),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                    SizedBox(height: 5.w,),
                    Positioned(
                        top: 76.0,
                        left: 19.0,
                      child: Container(
                        width: 336.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF2F80ED),
                                Color(0xFF1B4987),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 62.w,
                            height: 15.w,
                            child: Center(
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                Positioned(
                  top: 128.w,
                  left: 128.w,
                  child: SizedBox(
                    width: 119.w,
                    height: 16.w,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.w,
                            child: Image.asset('assets/images/policy.png'),
                          ),
                          Container(
                            width: 97.w,
                            height: 15.w,
                            child: Text(
                              'No payment now',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'PlusJakartaSans',
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 158.w,
                  left: 20.w,
                  child: SizedBox(
                    width: 72.w,
                    height: 15.w,
                    child: Text(
                      'Terms of Use',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'PlusJakartaSans',
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 158.w,
                  left: 162.w,
                  child: SizedBox(
                    width: 72.w,
                    height: 15.w,
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'PlusJakartaSans',
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 158.w,
                  left: 310.w,
                  child: SizedBox(
                    width: 72.w,
                    height: 15.w,
                    child: Text(
                      'Restore',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'PlusJakartaSans',
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
