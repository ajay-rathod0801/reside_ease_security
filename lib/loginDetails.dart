import 'package:flutter/material.dart';
import 'package:reside_ease_security/bottom_navigation.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({super.key});

  @override
  LoginDetailsState createState() => LoginDetailsState();
}

class LoginDetailsState extends State<LoginDetails> {
  bool isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Enter Your Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name',
                filled: true,
                fillColor: Colors.yellow.shade200,
              ),
              cursorColor: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                filled: true,
                fillColor: Colors.yellow.shade200,
              ),
              cursorColor: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_forward,
                size: 20,
                color: Colors.amberAccent,
              ),
              label: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ParentWidget(),
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
                elevation: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFEDAD),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xB21E1E1E),
              ),
            ),
          ),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
          controller: TextEditingController(text: initialValue),
        ),
      ],
    );
  }
}
