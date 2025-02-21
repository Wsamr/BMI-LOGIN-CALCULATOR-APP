import 'package:flutter/material.dart';
import 'package:login_task/screens/Bmi.dart';
import 'package:login_task/screens/cal.dart';
import 'package:login_task/screens/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Color?> color = [
    Color(0xff0A0E21),
    Colors.red[200],
    Colors.white,
  ];
  List<Widget> screens = [
    Homepage(),
    Cal(),
    Login(),
  ];
  int y = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[y],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: color[y],
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: y,
          onTap: (int index) {
            y = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.face,
              ),
              label: "Bmi",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              label: "Calculate",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.login_rounded,
              ),
              label: "Login",
            ),
          ]),
    );
  }
}
