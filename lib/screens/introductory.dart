import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:reside_ease_security/screens/login.dart';

class IntroductoryScreen extends StatefulWidget {
  const IntroductoryScreen({super.key});

  @override
  IntroductoryScreenState createState() => IntroductoryScreenState();
}

class IntroductoryScreenState extends State<IntroductoryScreen> {
  bool isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 350,
              width: double.infinity,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_forward,
                size: 20,
                color: Colors.amberAccent,
              ),
              label: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                setState(() {
                  isButtonClicked = true;
                });
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoginScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
