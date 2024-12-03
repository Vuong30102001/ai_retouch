import 'package:flutter/material.dart';

class AppRouter {
  static void navigatorToProPage (BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProPage(),
        )
    );
  }
}

class ProPage extends StatelessWidget {
  const ProPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pro Page")),
      body: const Center(
        child: Text(
          "Welcome to Pro!",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

