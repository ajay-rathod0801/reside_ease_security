import 'package:flutter/material.dart';
import 'introScreen.dart'; // Import your IntroductoryScreen file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Fix the constructor

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IntroductoryScreen(), // Set IntroductoryScreen as the home screen
    );
  }
}
