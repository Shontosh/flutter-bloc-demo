import 'package:bloc_task/models/task.dart';
import 'package:bloc_task/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

import 'blocs/bloc_exports.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
  );
  //BlocOverrides.runZoned(() => runApp(const BlocTask()));
//final storage =await HydratedStorage.build(storageDirectory:await getApplicationDocumentsDirectory());
  runApp(const BlocTask());

}

class BlocTask extends StatelessWidget {
  const BlocTask({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Bloc Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}

