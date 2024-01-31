import 'package:flutter/material.dart';
import 'package:reside_ease_security/loginScreen.dart';

class IntroductoryScreen extends StatelessWidget {
  const IntroductoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 232, bottom: 250),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 360,
            height: 336,
            child: Image.asset(
              "assets/introPageLogo.jpg",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: const Color(0xFF1E1E1E)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/arrow_forward.jpg',
                    // width: 24,
                    // height: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
