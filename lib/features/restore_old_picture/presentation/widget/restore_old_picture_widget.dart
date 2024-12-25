import 'package:ai_retouch/features/restore_old_picture/presentation/screen/album_media_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestoreOldPictureWidget extends StatelessWidget {
  const RestoreOldPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 602.w,
        left: 20.w,
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AlbumMediaScreen()),
          );
        },
        child: Container(
            width: 101.w,
            height: 64.w,
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
            ),
            child: Stack(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      top: 8.w,
                      left: 38.w,
                    ),
                    child: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        'assets/images/icon_restore_old_pic.png',
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 44.w,
                    left: 14.w,
                  ),
                  child: SizedBox(
                    width: 73.w,
                    height: 12.w,
                    child: Text(
                      'Restore Old Pic',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
        ),
      )
    );
  }
}
