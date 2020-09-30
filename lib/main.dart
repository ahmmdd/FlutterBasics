import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(TimerApp());

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  final startTime = DateTime(2020, 9, 30, 1, 30);
  final endTime = DateTime(2020, 9, 30, 4, 00);
  final currentTime = DateTime.now();

  int duration;

  void calculateDuration(DateTime _startTime, DateTime _endTime) {
    if (DateTime.now().isAfter(_startTime) &&
        DateTime.now().isBefore(_endTime)) {
      // do something
      duration = _endTime.difference(DateTime.now()).inMinutes;
    }
  }

  final interval = 1;
  static const period = const Duration(minutes: 1);

  // int duration = 600;
  bool isActive = true;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        duration -= interval;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    calculateDuration(startTime, endTime);

    if (timer == null) {
      timer = Timer.periodic(period, (Timer t) {
        handleTick();
      });
      if (duration <= 0) {
        timer.cancel();
      }
    }
    /*
    // If calculation done in minutes
    int seconds = duration % 60;
    int minutes = duration ~/ 60;
    int hours = duration ~/ (60 * 60);
    */
    int minutes = duration % 60;
    int hours = duration ~/ 60;

    // Widget of countdown timer
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${hours.toString()}h ${minutes.toString()}m',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
