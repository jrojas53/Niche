import 'package:flutter/material.dart';

/*
App Drawer Link: https://docs.flutter.dev/cookbook/design/drawer
*/

/*
  void main() is the funciton that runs the application
  MaterialApp provides HomePage functionality
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = 'Nav Drawer';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Niche",
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'HomePage'),
    );
  }
}

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: const Center(
          child: Text('Calendar Coming Soon...'),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            const SizedBox(
              height: 84.0,
              child: DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 164, 120, 48)),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: Text('Views',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center),
              ),
            ),
            ListTile(
              title: const Text('Week'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Day'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ]),
        ));
  }
}