import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:taskflow/constants/constants.dart';

void moveScreen(BuildContext context, Widget screen,
    {bool isPushReplacement = false}) {
  if (isPushReplacement) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

PreferredSize makeAppBar(BuildContext context, {String title = "$appName"}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, kToolbarHeight),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("$title"),
      centerTitle: true,
    ),
  );
}

int _selectedIndex = 0;
const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Home',
    style: optionStyle,
  ),
  Text(
    'Likes',
    style: optionStyle,
  ),
  Text(
    'Search',
    style: optionStyle,
  ),
  Text(
    'Profile',
    style: optionStyle,
  ),
];

Widget makeNavBar(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.person,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {},
          ),
        ),
      ));
}
