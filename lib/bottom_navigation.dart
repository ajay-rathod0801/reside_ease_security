import 'package:flutter/material.dart';
import 'package:reside_ease_security/homeScreen.dart';
import 'package:reside_ease_security/inout_page.dart';
import 'package:reside_ease_security/profile_page.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  ParentWidgetState createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  int currentPageIndex = 0;
  final List<Widget> pages = [
    HomePage(),
    InOutPage(),
    ProfilePage(),
  ];

  void changePage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: pages.map((page) {
          int index = pages.indexOf(page);
          return IgnorePointer(
            ignoring: index != currentPageIndex,
            child: AnimatedOpacity(
              opacity: currentPageIndex == index ? 1.0 : 0.0,
              duration: Duration(milliseconds: 250),
              child: page,
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: currentPageIndex,
        onIndexSelected: changePage,
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexSelected;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onIndexSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home, color: Colors.white),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.flaky, color: Colors.white),
          icon: Badge(
            child: Icon(Icons.flaky),
          ),
          label: 'In-Out',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.account_circle_rounded, color: Colors.white),
          icon: Icon(Icons.account_circle_rounded),
          label: 'Profile',
        ),
      ],
      backgroundColor: Color.fromRGBO(255, 237, 173, 1),
      onDestinationSelected: onIndexSelected,
      indicatorColor: Colors.black,
      selectedIndex: selectedIndex,
    );
  }
}
