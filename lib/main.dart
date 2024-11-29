import 'package:flutter/material.dart';

import 'features/home/presentation/screen/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Retouch',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
