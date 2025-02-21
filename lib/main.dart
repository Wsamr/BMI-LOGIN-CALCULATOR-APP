import 'package:flutter/material.dart';
import 'package:login_task/screens/Home.dart';
import 'package:login_task/screens/cal.dart';
import 'package:login_task/screens/login.dart';

void main() {
  runApp(const Task());
}

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}