import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'introScreen.dart'; // Import your IntroductoryScreen file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.yellow,
      ),
      home: IntroductoryScreen(),
    );
  }
}
