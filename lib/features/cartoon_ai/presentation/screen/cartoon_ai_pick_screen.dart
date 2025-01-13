import 'dart:io';

import 'package:ai_retouch/features/cartoon_ai/presentation/cubit/cubit/cartoon_ai_cubit.dart';
import 'package:ai_retouch/features/cartoon_ai/presentation/cubit/state/cartoon_ai_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartoonAiPickScreen extends StatefulWidget {
  final File imagePicked;
  const CartoonAiPickScreen({super.key, required this.imagePicked});

  @override
  State<CartoonAiPickScreen> createState() => _CartoonAiPickScreenState();
}

class _CartoonAiPickScreenState extends State<CartoonAiPickScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartoonAiCubit>().fetchStyles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 41.0),
        child: Column(
          children: [
            _buildAppBar(),
            _buildImagePreview(),
            _buildControlPanel(),
            _buildStylesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      width: double.infinity,
      height: 48.w,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 32.w,
              height: 32.w,
              margin: EdgeInsets.only(left: 20.w),
              child: Image.asset('assets/images/BTN.png'),
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/images/menu.png',
            width: 116.w,
            height: 32.w,
          ),
          Spacer(),
          Container(
            width: 70.w,
            height: 32.w,
            margin: EdgeInsets.only(right: 20.w),
            alignment: Alignment.center,
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      width: double.infinity,
      height: 505.w,
      color: Colors.black,
      child: Image.file(
        widget.imagePicked,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildControlPanel() {
    return Container(
      width: double.infinity,
      height: 60.w,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/icon_zoom_out.png',
            width: 32.w,
            height: 32.w,
          ),
          Image.asset(
            'assets/images/BF.png',
            width: 32.w,
            height: 32.w,
          ),
        ],
      ),
    );
  }

  Widget _buildStylesList() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0XFF1A1A1A),
        ),
        child: BlocBuilder<CartoonAiCubit, CartoonAiState>(
          builder: (context, state) {
            if (state.isLoadingStyles) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMessage != null) {
              return Center(
                child: Text(
                  'Error: ${state.errorMessage}',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.sp,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.styles.length,
                itemBuilder: (context, index) {
                  final style = state.styles[index];
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: GestureDetector(
                        onTap: () {
                          // Hành động khi nhấn vào style
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              style.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );

                },
              );
            }
          },
        ),
      ),
    );
  }
}
