import 'package:flutter/material.dart';

class EnhancePhotoWidget extends StatelessWidget {
  const EnhancePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enahnce Page")),
      body: const Center(
        child: Text(
          "Welcome to Enhance!",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}