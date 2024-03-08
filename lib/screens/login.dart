import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:reside_ease_security/screens/otp.dart';

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
  final _phonenoController = TextEditingController();

  // create a focus node
  final _phonenoFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _phonenoFocusNode.addListener(() {
      if (_phonenoFocusNode.hasFocus) {
        _phonenoController.clear();
      }
    });
  }

  @override
  void dispose() {
    _phonenoController.dispose();

    // dispose the focus nodes
    _phonenoFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/logo.png'),
              ),
              Card(
                margin: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IntlPhoneField(
                            controller: _phonenoController,
                            focusNode: _phonenoFocusNode,
                            initialCountryCode: 'IN',
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            // validator: (value) {
                            //   if (value == null ||
                            //       value.number.isEmpty ||
                            //       value.number.length < 10) {
                            //     return 'Please enter a valid phone number!';
                            //   }
                            //   return null;
                            // },
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpScreen(
                                    phoneNumber: _phonenoController.text,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Text('Signup'),
                          ),
                        ],
                      ),
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
