import 'package:flutter/material.dart';
import 'home.dart';

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
    return MaterialApp(
      title: "Niche",
      debugShowCheckedModeBanner: false,
      /*  Dark Mode Option Implementation: 
      https://api.flutter.dev/flutter/material/MaterialApp/themeMode.html
  
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme, */
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: '',)
    );
  }
}