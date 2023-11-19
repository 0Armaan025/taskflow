import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTaskTile extends StatefulWidget {
  final String taskName;
  final String taskTime;
  const CustomTaskTile(
      {super.key, required this.taskName, required this.taskTime});

  @override
  State<CustomTaskTile> createState() => _CustomTaskTileState();
}

class _CustomTaskTileState extends State<CustomTaskTile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: Container(
        height: size.height * 0.05,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(7),
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.taskName,
              style: GoogleFonts.zillaSlab(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.taskTime,
              style: GoogleFonts.jost(
                color: Colors.grey[700],
                fontSize: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
