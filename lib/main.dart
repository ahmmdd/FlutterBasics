import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(TimerApp());

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  final interval = 1;
  static const period = const Duration(minutes: 1);

  int duration = 600;
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
        ));
  }
}
