import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
      /*  Dark Mode Option Implementation: 
      https://api.flutter.dev/flutter/material/MaterialApp/themeMode.html
  
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme, */
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
  CalendarFormat format = CalendarFormat.month; //Month State
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Niche"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: TableCalendar(
          firstDay: DateTime.utc(2015),
          lastDay: DateTime.utc(2035),
          focusedDay: DateTime.now(),
          calendarFormat: format,
          /*Create the option to change format
            onFormatChanged: (CalendarFormat format) {
              setState(() {
                format: format;
              });
            },*/
          //Option to select day with taps and color customization
          selectedDayPredicate: (day) {
            return isSameDay(selectedDay, day);
          },
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            setState(() {
              selectedDay = selectDay;
              focusedDay = focusDay;
            });
          },
          //Calendar Style:
          calendarStyle: const CalendarStyle(
            isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.rectangle,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.rectangle,
            ),
            todayTextStyle: TextStyle(color: Colors.white),
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            formatButtonShowsNext: false,
          ),
          /*
          const Center(
          child: Text('Calendar Coming Soon...'),
          */
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
                //CalendarFormat: format;
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
