import 'package:flutter/material.dart';

class EnhancePhotoScreen extends StatelessWidget {
  const EnhancePhotoScreen({super.key});

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