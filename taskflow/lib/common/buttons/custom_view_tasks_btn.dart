import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/constants/Pallete.dart';

class CustomViewTasksButton extends StatefulWidget {
  final VoidCallback onTap;
  const CustomViewTasksButton({super.key, required this.onTap});

  @override
  State<CustomViewTasksButton> createState() => _CustomViewTasksButtonState();
}

class _CustomViewTasksButtonState extends State<CustomViewTasksButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: size.height * 0.08,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Pallete().buttonColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 8),
              blurRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          "View your tasks!",
          style: GoogleFonts.montserratAlternates(
            color: Pallete().buttonTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
