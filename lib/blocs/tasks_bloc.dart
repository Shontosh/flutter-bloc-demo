import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_task/blocs/bloc_exports.dart';
import 'package:bloc_task/models/task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit){
    final state =this.state;
    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }
  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit){
    final state=this.state;
    final task=event.task;
    final int index=state.allTasks.indexOf(task);
    List<Task> allTasks=List.from(state.allTasks)..remove(task);
    task.isDone==false?
        allTasks.insert(index,task.copyWith(isDone: true))
        :allTasks.insert(index,task.copyWith(isDone:false));

    emit(TasksState(allTasks: allTasks));
  }
  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit){
    final state=this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
     return state.toMap();
  }
}
