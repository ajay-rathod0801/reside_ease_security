import 'package:flutter/material.dart';
import 'package:reside_ease_security/loginScreen.dart';

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
              'assets/introPageLogo.jpg',
              height: 600,
              width: double.infinity,
            ),
            const SizedBox(
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
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: const BorderSide(
                  color: Colors.amberAccent,
                  width: 1,
                ),
                shadowColor: isButtonClicked ? Colors.blue.shade900 : null,
                elevation: isButtonClicked ? 10 : 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
