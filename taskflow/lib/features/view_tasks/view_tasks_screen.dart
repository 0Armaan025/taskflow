import 'package:flutter/material.dart';
import 'package:taskflow/common/widgets/task_widget.dart';

import '../../common/drawer/drawer.dart';
import '../../common/navbar/navbar.dart';
import '../../constants/utils.dart';

class ViewTasksScreen extends StatefulWidget {
  const ViewTasksScreen({super.key});

  @override
  State<ViewTasksScreen> createState() => _ViewTasksScreenState();
}

class _ViewTasksScreenState extends State<ViewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: makeDrawer(context),
      appBar: makeAppBar(context),
      bottomNavigationBar: makeNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TaskWidget(),
          ],
        ),
      ),
    );
  }
}
