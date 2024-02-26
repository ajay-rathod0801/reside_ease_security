import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  void _updateTextField(String text) {
    if (_textController.text.length < 6) {
      _textController.text += text;
    }
  }

  void _removeLastCharacter() {
    String currentText = _textController.text;
    if (currentText.isNotEmpty) {
      _textController.text = currentText.substring(0, currentText.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFF9F9FF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
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
                  child: _buildTitle('Enter 6 digit code in QR', 22),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: _buildInputSection(),
                  ),
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
                  padding: EdgeInsets.only(top: 30),
                  child: _buildQRButton(),
                ),
              ),
            ],
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
        fontWeight: FontWeight.w400,
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
            primary: Color(0xFF000000),
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

  Widget _buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          maxLength: 6,
          controller: _textController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xFFFFEDAD),
          ),
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 22,
            letterSpacing: 30.0,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildContinueButton() {
    return Container(
      width: 118,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          'Continue',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget _buildQRButton() {
    return Container(
      width: 326,
      height: 132,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        color: Colors.black,
      ),
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
    );
  }
}
