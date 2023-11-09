import 'package:flutter/material.dart';
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
