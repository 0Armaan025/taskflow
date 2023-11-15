import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/common/widgets/task_widget.dart';
import 'package:taskflow/constants/Pallete.dart';
import 'package:taskflow/constants/utils.dart';

import '../../common/navbar/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context),
      bottomNavigationBar: makeNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Good morning, Armaan 👋🏻",
                      style: GoogleFonts.poppins(
                        color: Pallete().headingTextColor,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "15th November, 2023",
                      style: GoogleFonts.roboto(color: Colors.grey[800]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Image(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/68/89/0a/68890a002716ec49c934abd0bc84e48d.gif'),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                left: 12,
                top: 3,
              ),
              child: Text(
                "Your Tasks:",
                style: GoogleFonts.dmSans(
                  fontSize: 25,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TaskWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
