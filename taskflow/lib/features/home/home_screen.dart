import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/common/buttons/custom_view_tasks_btn.dart';
import 'package:taskflow/common/drawer/drawer.dart';
import 'package:taskflow/common/lists/custom_tasks_list.dart';
import 'package:taskflow/constants/Pallete.dart';
import 'package:taskflow/constants/utils.dart';
import 'package:taskflow/features/add_task/add_task_screen.dart';
import 'package:taskflow/features/backend/quote_generation/quote_generation.dart';
import 'package:taskflow/features/view_tasks/view_tasks_screen.dart';

import '../../common/navbar/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    quote = await QuoteGenerator().getQuote();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete().buttonColor,
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            moveScreen(context, AddTaskScreen());
          },
          icon: Icon(Icons.add, color: Colors.black),
        ),
      ),
      drawer: makeDrawer(context),
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

            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomViewTasksButton(
                onTap: () {
                  moveScreen(context, ViewTasksScreen());
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(10).copyWith(
                left: 30,
                right: 30,
              ),
              child: Card(
                elevation: 2.0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      '$quote Ji',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            //now, we also wanna display the lists of the previous tasks done
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Your recent completed tasks:",
                  style: GoogleFonts.balooChettan2(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTasksList(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
