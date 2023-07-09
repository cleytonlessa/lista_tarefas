import 'package:flutter/material.dart';
import 'package:mobile/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> tasklist = [
    Task(
        'Aprender Flutter',
        'assets/images/flutter.png',
        3),
    Task(
        'Andar de bike',
        'assets/images/bike.jpg',
        2),
    Task(
        'Meditar',
        'assets/images/meditar.jpeg',
        5),
    Task(
        'Ler',
        'assets/images/ler.jpg',
        4),
  ];

  void newTask(String name, String photo, int difficulty){
    tasklist.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.tasklist.length != tasklist.length;
  }
}
