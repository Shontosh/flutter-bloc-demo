import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController();
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Add Task",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: controller,
            decoration: const InputDecoration(
                label: Text("Title"),
                border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {}, child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(title: controller.text);
                    context
                        .read<TasksBloc>()
                        .add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: Text('Add')),
            ],
          ),
        ],
      ),
    );
  }
}