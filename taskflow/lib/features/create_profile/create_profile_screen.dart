import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskflow/common/buttons/custom_continue_button.dart';
import 'package:taskflow/common/text_fields/custom_text_field_2.dart';
import 'package:taskflow/constants/Pallete.dart';
import 'package:taskflow/constants/constants.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    if (stepIndex == 2) {
      percentage = "66.6%";
      percent = 0.6;
    } else if (stepIndex == 3) {
      percentage = "99.99%";
      percent = 1;
    } else {
      percent = 0.2;
      percentage = "33.3%";
    }
    setState(() {});
  }

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
                    "STEP $stepIndex/3",
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
                  percent: percent,
                  center: Text(percentage),
                  progressColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            stepIndex == 1 ? makeStepOne(context) : makeStepTwo(context),
          ],
        ),
      ),
    );
  }
}

Widget makeStepOne(BuildContext context) {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/128/4333/4333609.png'),
                  ),
                  Positioned(
                    left: 60,
                    top: 60,
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.green,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
                hintText: "Please Enter your full name",
                isObscure: false,
                keyboardType: TextInputType.name,
                controller: _fullNameController),
            CustomTextField2(
                hintText: "Please Enter your username",
                isObscure: false,
                keyboardType: TextInputType.name,
                controller: _usernameController),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 30,
                right: 30,
              ),
              child: CustomContinueButton(
                  bgColor: Pallete().buttonColor,
                  textColor: Pallete().buttonTextColor,
                  text: "Continue ->",
                  onTap: () {
                    if (stepIndex < 3) {
                      stepIndex++;
                    }

                    moveScreen(context, CreateProfileScreen(),
                        isPushReplacement: true);
                  }),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget makeStepTwo(BuildContext context) {
  final TextEditingController _countryNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
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
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
                hintText: "Please enter your country",
                isObscure: false,
                keyboardType: TextInputType.name,
                controller: _countryNameController),
            CustomTextField2(
                hintText: "Please enter your age",
                isObscure: false,
                keyboardType: TextInputType.number,
                controller: _ageController),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 30,
                right: 30,
              ),
              child: CustomContinueButton(
                  bgColor: Pallete().buttonColor,
                  textColor: Pallete().buttonTextColor,
                  text: "Continue ->",
                  onTap: () {
                    if (stepIndex < 3) {
                      stepIndex++;
                    }

                    moveScreen(context, CreateProfileScreen(),
                        isPushReplacement: true);
                  }),
            ),
          ],
        ),
      ),
    ),
  );
}
