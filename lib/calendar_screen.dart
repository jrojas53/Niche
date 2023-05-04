import 'package:flutter/material.dart';
import 'package:niche_app/event_control.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event_control.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;

  CalendarFormat format = CalendarFormat.month; //Month State
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  //Holds the states
  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  //Text Controller
  TextEditingController eventController = TextEditingController();

  //Events
  List<Event> getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  //Garbage collector
  @override
  void dispose() {
    eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
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

            eventLoader: getEventsfromDay,

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
                defaultDecoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  shape: BoxShape.circle,
                ),
                weekendDecoration: BoxDecoration(
                    color: Colors.lightGreenAccent, shape: BoxShape.circle)),
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
          ...getEventsfromDay(selectedDay).map((Event event) => ListTile(title: Text(event.title),),),
        ],
      ),
      //BOTTOM NAV BAR:
      //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Add Event"),
                  content: TextFormField(
                    controller: eventController,
                  ),
                  actions: [
                    TextButton(
                      child: const Text("Nope"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text("Add"),
                      onPressed: () => {
                        if(eventController.text.isEmpty) {
                          //Navigator.pop(context)
                        } else {
                          if(selectedEvents[selectedDay] != null) {
                            selectedEvents[selectedDay]?.add(
                              Event(title: eventController.text),
                            )
                          } else {
                            selectedEvents[selectedDay] = [
                              Event(title: eventController.text)
                            ]
                          },
                        },
                        Navigator.pop(context),
                        eventController.clear(),
                        setState((){})
                      },
                    ),
                  ],
                ),
              ),
        label: const Text("Add Event"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}