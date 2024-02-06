import 'package:flutter/material.dart';
import 'package:reside_ease_security/loginDetails.dart';

class LoginVerification extends StatefulWidget {
  final String phoneNumber;

  const LoginVerification({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _LoginVerificationState createState() => _LoginVerificationState();
}

class _LoginVerificationState extends State<LoginVerification> {
  late List<String> _otpDigits;
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize _otpDigits with empty strings
    _otpDigits = List.filled(6, '');
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 165, horizontal: 17),
          decoration: const BoxDecoration(color: Color(0xFFF9F9FF)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text(
                    'Enter Verification Code',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Enter the code sent to ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '+91 9428281947', // Use the passed phone number
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    height: 44,
                    width: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: TextEditingController(text: _otpDigits[index]),
                      onChanged: (value) {
                        setState(() {
                          _otpDigits[index] = value;
                        });
                        if (index < 5 && value.isNotEmpty) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                    ),
                  );
                }),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(1),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF1E1E1E)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    // Validate OTP
                    String otp = _otpDigits.join();
                    if (otp == "609144") { // Assuming OTP is "609144"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginDetails(),
                        ),
                      );
                    } else {
                      // Show error, clear OTP input
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid OTP')),
                      );
                      setState(() {
                        _otpDigits = List.filled(6, '');
                      });
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
