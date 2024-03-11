import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:reside_ease_security/screens/delivery_form.dart';
import 'package:reside_ease_security/screens/guest_form.dart';
import 'package:reside_ease_security/screens/service_form.dart';
import 'package:reside_ease_security/widgets/card_entry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Gate A, Eclipse Heights',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      GuestForm(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SharedAxisTransition(
                                  child: child,
                                  animation: animation,
                                  secondaryAnimation: secondaryAnimation,
                                  transitionType:
                                      SharedAxisTransitionType.horizontal,
                                );
                              },
                            ),
                          );
                        },
                        child: EntryCard(
                            title: 'Guest', image: 'assets/guest.png'),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      DeliveryForm(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SharedAxisTransition(
                                  child: child,
                                  animation: animation,
                                  secondaryAnimation: secondaryAnimation,
                                  transitionType:
                                      SharedAxisTransitionType.horizontal,
                                );
                              },
                            ),
                          );
                        },
                        child: EntryCard(
                            title: 'Delivery', image: 'assets/delivery.png'),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      ServiceForm(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SharedAxisTransition(
                                  child: child,
                                  animation: animation,
                                  secondaryAnimation: secondaryAnimation,
                                  transitionType:
                                      SharedAxisTransitionType.horizontal,
                                );
                              },
                            ),
                          );
                        },
                        child: EntryCard(
                            title: 'Service', image: 'assets/service.png'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Enter 6 digit code in QR',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
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
                    selectedFillColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    selectedColor: Theme.of(context).colorScheme.secondary,
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
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Text('Continue'),
                ),
                const SizedBox(height: 30),
                Card(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.qr_code,
                          color: Colors.white,
                          size: 80,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Scan QR',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//   Widget _buildTitle(String title, double fontSize) {
//     return Text(
//       title,
//       style: TextStyle(
//         // fontFamily: 'Roboto',
//         // fontStyle: FontStyle.normal,
//         fontWeight: FontWeight.w600,
//         fontSize: fontSize,
//         color: Color(0xFF000000),
//       ),
//     );
//   }

//   Widget _buildGuestList() {
//     return Container(
//       height: 136,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             _buildGuestItem('assets/guest.png', 'Guest', () {
//               // Add your logic here for when the button is pressed
//             }),
//             _buildGuestItem('assets/delivery_boy.png', 'Delivery', () {
//               // Add your logic here for when the button is pressed
//             }),
//             _buildGuestItem('assets/service.png', 'Service', () {
//               // Add your logic here for when the button is pressed
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGuestItem(
//       String imagePath, String label, VoidCallback onPressed) {
//     return SizedBox(
//       width: 137,
//       height: 156,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 8, right: 8),
//         child: ElevatedButton(
//           onPressed: onPressed,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Color(0xFF000000),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 imagePath,
//                 width: 95,
//                 height: 90,
//               ),
//               SizedBox(height: 8),
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 14,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputSection(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           PinCodeTextField(
//             appContext: context,
//             length: 6,
//             obscureText: false,
//             keyboardType: TextInputType.number,
//             pinTheme: PinTheme(
//               shape: PinCodeFieldShape.box,
//               borderRadius: BorderRadius.circular(5),
//               borderWidth: 1,
//               fieldHeight: 50,
//               fieldWidth: 50,
//               activeFillColor: Colors.white,
//               inactiveFillColor: Colors.white,
//               selectedFillColor: Theme.of(context).colorScheme.primaryContainer,
//               selectedColor: Theme.of(context).colorScheme.secondary,
//               activeColor: Colors.black, // color when the field is active
//               // selectedColor:
//               //     Colors.black, // color when the field is selected
//               inactiveColor: Colors.black,
//             ),
//             animationDuration: Duration(milliseconds: 300),
//             enableActiveFill: true,
//             onCompleted: (v) {
//               print("Completed");
//             },
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _buildContinueButton(BuildContext context) {
//   return ElevatedButton(
//     onPressed: () {},
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//     ),
//     child: Text('Continue'),
//   );
// }

// Widget _buildQRButton() {
//   return Card(
//     color: Colors.black,
//     child: Padding(
//       padding: const EdgeInsets.all(30.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.qr_code,
//             color: Colors.white,
//             size: 80,
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Text(
//             'Scan QR',
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 24,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
