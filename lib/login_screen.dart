import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

// create a login screen state
class LoginScreenState extends State<LoginScreen> {
  // create a form key
  final _formKey = GlobalKey<FormState>();

  // create a text editing controller
  final _usernameController = TextEditingController();

  // create a focus node
  final _usernameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _usernameFocusNode.addListener(() {
      if (_usernameFocusNode.hasFocus) {
        _usernameController.clear();
      }
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();

    // dispose the focus nodes
    _usernameFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // create
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 400,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    focusNode: _usernameFocusNode,
                    decoration: const InputDecoration(
                      labelText: 'Enter Phone Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number or email ID';
                      }
                      // regex pattern for email
                      String emailPattern =
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                      RegExp emailRegex = RegExp(emailPattern);

                      // regex pattern for phone number (Indian format)
                      String phonePattern = r'^[6-9]\d{9}$';
                      RegExp phoneRegex = RegExp(phonePattern);

                      if (!emailRegex.hasMatch(value) &&
                          !phoneRegex.hasMatch(value)) {
                        return 'Please enter a valid phone number or email ID';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() {}
}

class OtpScreen {
  const OtpScreen();
}
