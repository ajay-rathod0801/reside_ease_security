import 'package:flutter/material.dart';
import 'package:reside_ease_security/loginVerification.dart';

class Login extends StatefulWidget {

  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _phoneNumberErrorText = '';

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _validatePhoneNumber(String value) {
    setState(() {
      if (value.isEmpty) {
        _phoneNumberErrorText = 'Please enter your phone number';
      } else if (value.length != 10) {
        _phoneNumberErrorText = 'Phone number must be exactly 10 digits';
      } else {
        _phoneNumberErrorText = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      body: SingleChildScrollView(
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
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Enter Phone Number',
                  errorText: _phoneNumberErrorText.isNotEmpty
                      ? _phoneNumberErrorText
                      : null,
                  filled: true,
                  fillColor: const Color(0xFFFFEDAD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                keyboardType: TextInputType.phone,
                onChanged: _validatePhoneNumber,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _phoneNumberErrorText.isEmpty
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LoginVerification(
                        phoneNumber: _phoneNumberController.toString(),
                      ),
                    ),
                  );
                }
                    : null,
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
