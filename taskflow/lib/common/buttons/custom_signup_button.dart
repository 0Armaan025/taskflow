import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/constants/Pallete.dart';

class CustomSignUpButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const CustomSignUpButton(
      {super.key, required this.text, required this.onTap});

  @override
  State<CustomSignUpButton> createState() => _CustomSignUpButtonState();
}

class _CustomSignUpButtonState extends State<CustomSignUpButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: size.height * 0.06,
        decoration: BoxDecoration(
          color: Pallete().buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          "${widget.text}",
          style: GoogleFonts.montserrat(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
