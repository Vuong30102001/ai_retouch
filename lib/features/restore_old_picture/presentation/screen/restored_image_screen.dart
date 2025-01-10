import 'dart:io';
import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/done_popup_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/restore_old_picture_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/screen/restored_image_export_screen.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/widget/done_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/save_popup_widget.dart';

class RestoredImageScreen extends StatefulWidget {
  final String base64Image;
  final File originalImage;

  const RestoredImageScreen({super.key, required this.base64Image, required this.originalImage});

  @override
  State<RestoredImageScreen> createState() => _RestoredImageScreenState();
}

class _RestoredImageScreenState extends State<RestoredImageScreen> {
  late Future<File> _imageFileFuture;
  double _dividerPosition = 0.5;

  @override
  void initState() {
    super.initState();
    _imageFileFuture = context.read<RestoreOldPictureCubit>().convertBase64StrToFile(widget.base64Image);
  }

  @override
  Widget build(BuildContext context) {
    context.read<DonePopupCubit>().showLoading();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 41.w),
            child: Container(
              width: 375.w,
              height: 48.w,
              color: const Color(0xFF1A1A1A),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        color: const Color(0xFF1A1A1A),
                        child: Image.asset('assets/images/BTN.png'),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RestoredImageExportScreen(
                                  base64Image: widget.base64Image,
                                  originalImage: widget.originalImage,
                              ))
                          );
                        },
                        child: Container(
                            width: 70.w,
                            height: 32.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.0),
                              color: Colors.blue,
                            ),
                            child: Center(
                                child: Text(
                                  'Save',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'PlusJakartaSans',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: FutureBuilder<File>(
              future: _imageFileFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Stack(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      Positioned(
                        top: 680.w,
                        child: const DonePopupWidget(),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  context.read<DonePopupCubit>().showError('Failed to restore image');
                  return Stack(
                    children: [
                      Center(child: Text('Error: ${snapshot.error}')),
                      Positioned(
                        top: 680.w,
                        child: const DonePopupWidget(),
                      ),
                    ],
                  );
                } else if (snapshot.hasData) {
                  context.read<DonePopupCubit>().showSuccess('Restore Old Pic done! Hope you enjoy it');
                  return Stack(
                    children: [
                      GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          setState(() {
                            _dividerPosition = (_dividerPosition + details.primaryDelta! / MediaQuery.of(context).size.width)
                                .clamp(0.0, 1.0);
                          });
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              top: 89.w,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 591.w,
                                child: Image.file(
                                  snapshot.data!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 89.w,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 591.w,
                                child: ClipRect(
                                  clipper: HorizontalClipper(_dividerPosition),
                                  child: Image.file(
                                    widget.originalImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width * _dividerPosition - 2,
                              top: 89.w,
                              child: Container(
                                width: 4.w,
                                height: 591.w,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width * _dividerPosition - 12, // Điều chỉnh vị trí của icon
                              top: 89.w + (591.w / 2) - 12, // Căn giữa theo chiều dọc
                              child: SizedBox(
                                width: 21.w,
                                height: 21.w,
                                child: Image.asset('assets/images/clipper.png')
                              ),
                            ),
                            Positioned(
                              top: 109.w,
                              left: 20.w,
                              child: _buildLabel('Before'),
                            ),
                            Positioned(
                              top: 109.w,
                              left: 297.w,
                              child: _buildLabel('After'),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 680.w,
                        child: const DonePopupWidget(),
                      ),
                    ],
                  );
                }
                return Container(); // Fallback nếu không có dữ liệu.
              },
            ),
          ),
          const Expanded(
            flex: 1,
            child: DonePopupWidget()
          )
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Container(
      width: 58.w,
      height: 24.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 12.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HorizontalClipper extends CustomClipper<Rect> {
  final double dividerPosition;

  HorizontalClipper(this.dividerPosition);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * dividerPosition, size.height);
  }

  @override
  bool shouldReclip(covariant HorizontalClipper oldClipper) {
    return dividerPosition != oldClipper.dividerPosition;
  }
}
