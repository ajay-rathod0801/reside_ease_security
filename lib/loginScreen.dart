import 'package:flutter/material.dart';
import 'package:reside_ease_security/loginVarification.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/introPageLogo.jpg',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'Sign In',
                style: kSignInTextStyle,
              ),
              const SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Phone Number',
                  filled: true,
                  fillColor: const Color(0xFFFFEDAD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginVarification()),
                  );

                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: const BorderSide(width: 1, color: Color(0xFF1E1E1E)),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

const TextStyle kSignInTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 32,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);
