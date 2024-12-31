import 'dart:io';

import 'package:flutter/material.dart';

class RestoredImageScreen extends StatelessWidget {
  final String imagePath;
  const RestoredImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Display')),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
