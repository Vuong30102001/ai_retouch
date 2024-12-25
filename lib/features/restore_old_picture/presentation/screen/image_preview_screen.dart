import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePreviewScreen extends StatelessWidget {
  final File image;

  ImagePreviewScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview Image")),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 89.0),
            child: Container(
              width: 375.w,
              height: 521.w,
              child: Center(
                child: Image.file(image),
              ),
            ),
          ),
        ],
      )
    );
  }
}
