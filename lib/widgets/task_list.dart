import 'package:bloc_task/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';


class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                onChanged: (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                },
                value: task.isDone,
              ),
              onLongPress: ()=>
              context.read()<TasksBloc>().add(DeleteTask(task: task)),
            );
          }),
    );
  }
}