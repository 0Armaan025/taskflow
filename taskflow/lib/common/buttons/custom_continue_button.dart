// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taskflow/constants/Pallete.dart';

class CustomContinueButton extends StatefulWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final VoidCallback onTap;
  const CustomContinueButton({
    Key? key,
    required this.bgColor,
    required this.textColor,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomContinueButton> createState() => _CustomContinueButtonState();
}

class _CustomContinueButtonState extends State<CustomContinueButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.078,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
