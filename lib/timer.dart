import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  static const duration = Duration(seconds: 20);
  bool countDown = true;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
