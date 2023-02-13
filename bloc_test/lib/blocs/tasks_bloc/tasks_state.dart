part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> removedTasks;
  final List<Task> favoriteTasks;
  final List<Task> completedTasks;
  const TasksState({
    this.pendingTasks = const <Task>[],
    this.removedTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        pendingTasks,
        removedTasks,
        completedTasks,
        favoriteTasks,
      ];

  Map<String, dynamic> toMap() {
    return {
      'pendingTasks': pendingTasks.map((e) => e.toMap()).toList(),
      'removedTasks': removedTasks.map((e) => e.toMap()).toList(),
      'completedTasks': completedTasks.map((e) => e.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((e) => e.toMap()).toList()
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
        pendingTasks: List<Task>.from(
          map['pendingTasks']?.map((e) => Task.fromMap(e)),
        ),
        removedTasks: List<Task>.from(
          map['removedTasks']?.map((e) => Task.fromMap(e)),
        ),
        completedTasks: List<Task>.from(
          map['completedTasks']?.map((e) => Task.fromMap(e)),
        ),
        favoriteTasks: List<Task>.from(
          map['favoriteTasks']?.map((e) => Task.fromMap(e)),
        ));
  }
}
