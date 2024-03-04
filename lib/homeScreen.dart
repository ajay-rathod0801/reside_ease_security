import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class HomePage extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: _buildAddressContainer(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: _buildTitle('ADD NEW VISITOR', 22),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: _buildGuestList(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: _buildTitle('Enter 6 digit code in QR', 20),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: _buildInputSection(context),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: _buildContinueButton(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 50),
                    child: _buildQRButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFFFFE178),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Gate A, Eclipse Heights',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 22,
          letterSpacing: 0.15,
          color: Color(0xFF000000),
        ),
      ),
    );
  }

  Widget _buildTitle(String title, double fontSize) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: Color(0xFF000000),
      ),
    );
  }

  Widget _buildGuestList() {
    return Container(
      height: 136,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildGuestItem('assets/guest.png', 'Guest', () {
              // Add your logic here for when the button is pressed
            }),
            _buildGuestItem('assets/delivery_boy.png', 'Delivery', () {
              // Add your logic here for when the button is pressed
            }),
            _buildGuestItem('assets/service.png', 'Service', () {
              // Add your logic here for when the button is pressed
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestItem(
      String imagePath, String label, VoidCallback onPressed) {
    return SizedBox(
      width: 137,
      height: 156,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF000000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 95,
                height: 90,
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  letterSpacing: 0.1,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection(BuildContext context) {
    return Container(
          child: Column(
            children: [
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  borderWidth: 1,
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.blue.shade200,
                  activeColor: Colors.black, // color when the field is active
                  // selectedColor:
                  //     Colors.black, // color when the field is selected
                  inactiveColor: Colors.black,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                },
              ),
              const SizedBox(
                height: 32.0,
              ),
              const SizedBox(),
            ],
          ),
    );
  }
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      onPressed: () {
        // Add your onPressed logic here
      },
      child: Container(
        width: 118,
        height: 40,
        child: Center(
          child: Text(
            'Continue',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQRButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      onPressed: () {
        // Add your onPressed logic here
      },
      child: Container(
        width: double.infinity,
        height: 132,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.qr_code,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(width: 26), // Adjust the spacing between icon and text
              Text(
                'Scan QR instead?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }