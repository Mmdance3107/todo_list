import 'package:flutter/material.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task =
                taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              longPressCallback: () {
                taskData.deleteTask(task);
              },
              checkboxCallback: (bool? checkboxState) {
                taskData.updateTask(task);
              },
            );
          },
          itemCount: taskData.taskCount, //count,
        );
      },
    );
  }
}
