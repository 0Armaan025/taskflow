import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/common/drawer/drawer.dart';
import 'package:taskflow/constants/utils.dart';

import '../../common/navbar/navbar.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: makeDrawer(context),
      appBar: makeAppBar(context),
      bottomNavigationBar: makeNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Your Teams!",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                children: List.generate(
                  6,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
