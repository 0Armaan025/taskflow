import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/common/buttons/custom_continue_button.dart';
import 'package:taskflow/common/navbar/navbar.dart';
import 'package:taskflow/common/text_fields/custom_text_field_2.dart';
import 'package:taskflow/constants/Pallete.dart';
import 'package:taskflow/constants/utils.dart';

import '../../common/drawer/drawer.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _taskTitleController = TextEditingController();

  String dropdownvalue = 'Please choose a priority level';

  // List of items in our dropdown menu
  var items = [
    'Please choose a priority level',
    'Easy',
    'Medium',
    'Hard',
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _taskTitleController.dispose();
  }

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
                "Time to add a task 🤓",
                style: GoogleFonts.pacifico(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
                hintText: "Please Enter a task title",
                isObscure: false,
                keyboardType: TextInputType.name,
                controller: _taskTitleController),
            CustomTextField2(
                hintText: "Please Enter a task description",
                isObscure: false,
                keyboardType: TextInputType.name,
                controller: _taskTitleController),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12).copyWith(
                left: 20,
              ),
              child: DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: CustomContinueButton(
                  bgColor: Pallete().buttonColor,
                  textColor: Pallete().buttonTextColor,
                  text: "Add a task!",
                  onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
