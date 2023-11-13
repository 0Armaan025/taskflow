import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskflow/constants/utils.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  double percent = 0.2;
  String percentage = "33.3%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, title: "Create your profile!"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "It's time to make your profile!",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "STEP 1/3",
                    style: GoogleFonts.antic(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 5.0,
                  percent: 0.2,
                  center: Text("33.3%"),
                  progressColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            makeStepOne(context),
          ],
        ),
      ),
    );
  }
}

Widget makeStepOne(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Container(
    height: size.height * 0.6,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Card(
      elevation: 9.0,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 247, 255),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Center(
              child: CircleAvatar(
                
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
