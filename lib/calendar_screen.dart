import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month; //Month State
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      //BOTTOM NAV BAR:
      //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
    );
  }
}
