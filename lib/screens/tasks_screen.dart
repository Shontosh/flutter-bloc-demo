import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Bloc Task"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                    label: Text(
                  "Tasks:",
                )),
              ),
              TasksList(tasksList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

