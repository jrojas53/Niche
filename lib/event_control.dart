import 'package:flutter/foundation.dart';
//https://api.flutter.dev/flutter/foundation/foundation-library.html

class Event {
  final String title;
  Event({required this.title});

  @override
  String toString() => this.title;
}