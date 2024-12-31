import 'package:flutter/material.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subscription Page")),
      body: const Center(
        child: Text(
          "Welcome to Subscription!",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}