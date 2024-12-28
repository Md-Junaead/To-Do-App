import 'package:flutter/material.dart';
import 'package:to_do/screens/add_task_screen.dart';
import 'package:to_do/screens/home_screen.dart';
import 'package:to_do/screens/settings_screen.dart';
import 'package:to_do/screens/splash_screen.dart';
import 'package:to_do/screens/task_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/addTask': (context) => AddTaskScreen(),
        '/taskDetails': (context) =>
            TaskDetailsScreen(task: {}, onEdit: (title, description) {}),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
