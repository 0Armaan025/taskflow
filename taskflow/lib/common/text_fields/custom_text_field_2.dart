import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField2 extends StatefulWidget {
  final String hintText;
  final bool isObscure;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const CustomTextField2({
    super.key,
    required this.hintText,
    required this.isObscure,
    required this.keyboardType,
    required this.controller,
  });

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      child: TextFormField(
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
        ),
        controller: widget.controller,
        obscureText: widget.isObscure,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 191, 158, 158),
            fontSize: 16,
            // fontWeight: FontWeight.bold,
          ),
          fillColor: Color.fromARGB(255, 244, 244, 244),
          filled: true,
        ),
      ),
    );
  }
}
