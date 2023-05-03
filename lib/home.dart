import 'package:flutter/material.dart';
import 'calendar_screen.dart';
import 'reminders_screen.dart';
import 'profile_screen.dart';

/*
App Drawer Link: https://docs.flutter.dev/cookbook/design/drawer
*/

/*
  void main() is the funciton that runs the application
  MaterialApp provides HomePage functionality
*/

/*
  HomePage extends to a statefulwidget which means that
  the homepage is a screen that reloads with data
  there is a menu drawer include in this page
*/
class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  //States
  final screens = [
    const Calendar(),
    const Reminders(),
    const Profile(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Niche"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: screens[currentIndex],
      //BOTTOM NAV BAR:
      //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        //currentIndex: currentIndex,
        //onTap: (index) => setState(() => index),
        onTap: onTap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Reminders',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
