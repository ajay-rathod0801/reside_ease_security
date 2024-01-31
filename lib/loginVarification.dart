import 'package:flutter/material.dart';
import 'package:reside_ease_security/loginDetails.dart';
class LoginVarification extends StatelessWidget {
  const LoginVarification({super.key});

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
                          text: '+91 75132 00000',
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
                children: [
                  for (var digit in ['6', '0', '9', '1', '4', '4'])
                    Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Text(
                        digit,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginDetails()),
                    );
                    // Submit action
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
