import 'package:flutter/material.dart';
import 'package:mobile/data/task_inherited.dart';
import 'package:mobile/screens/form_screen.dart';
import 'package:mobile/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: false,
        ),
        home: TaskInherited(child: const InitialScreen()),
    );
  }
}





