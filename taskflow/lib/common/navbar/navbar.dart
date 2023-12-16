import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:taskflow/constants/constants.dart';
import 'package:taskflow/constants/utils.dart';
import 'package:taskflow/features/home/home_screen.dart';
import 'package:taskflow/features/teams/teams_screen.dart';

class makeNavBar extends StatefulWidget {
  const makeNavBar({super.key});

  @override
  State<makeNavBar> createState() => _makeNavBarState();
}

class _makeNavBarState extends State<makeNavBar> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
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

  @override
  Widget build(BuildContext context) {
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
                  icon: Icons.group,
                  text: 'Teams',
                ),
                GButton(
                  icon: Icons.bookmark,
                  text: 'Marks',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                if (index == 0) {
                  selectedIndex = index;
                  setState(() {
                    moveScreen(context, HomeScreen(), isPushReplacement: true);
                  });
                } else if (index == 1) {
                  selectedIndex = index;
                  moveScreen(context, TeamsScreen(), isPushReplacement: true);
                }
              },
            ),
          ),
        ));
  }
}
