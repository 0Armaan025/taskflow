import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isObscure;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.isObscure,
    required this.keyboardType,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 191, 158, 158),
            fontSize: 16,
            // fontWeight: FontWeight.bold,
          ),
          fillColor: Color.fromARGB(255, 255, 253, 253),
          filled: true,
        ),
      ),
    );
  }
}
