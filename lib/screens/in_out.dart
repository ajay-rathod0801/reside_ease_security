import 'package:flutter/material.dart';

class InOutPage extends StatelessWidget {
  const InOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Uh oh! No visitors yet!',
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
