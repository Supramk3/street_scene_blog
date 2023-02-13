import 'package:bloc_test/models/task.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({super.key});
  static const id = 'tasks_screen';
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.pendingTasks.length} Tasks'),
                ),
              ),
              TasksList(tasksList: tasksList),
            ],
          ),
        );
      },
    );
  }
}
