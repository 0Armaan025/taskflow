import 'package:flutter/material.dart';
import 'package:taskflow/common/tiles/custom_task_tile.dart';

class CustomTasksList extends StatefulWidget {
  const CustomTasksList({super.key});

  @override
  State<CustomTasksList> createState() => _CustomTasksListState();
}

class _CustomTasksListState extends State<CustomTasksList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView(
        children: [
          CustomTaskTile(
            taskTime: "12:32 AM,\n12th November, 2023",
            taskName: "Made eggs.",
          ),
          CustomTaskTile(
            taskTime: "12:32 AM,\n12th November, 2023",
            taskName: "Made burger.",
          ),
          CustomTaskTile(
            taskTime: "12:32 AM,\n12th November, 2023",
            taskName: "Made eggs.",
          ),
          CustomTaskTile(
            taskTime: "12:32 AM,\n12th November, 2023",
            taskName: "Made burger.",
          ),
          CustomTaskTile(
            taskTime: "12:32 AM,\n12th November, 2023",
            taskName: "Made eggs.",
          ),
          CustomTaskTile(
            taskTime: "12:32 AM,\n12th November, 2023",
            taskName: "Made burger.",
          ),
        ],
      ),
    );
  }
}
