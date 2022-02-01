import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback resetHelper;
  final Function score;
  const Result({Key? key, required this.resetHelper, required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: Text(
            score.call(),
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text("You reached the end. Click button to start again"),
        ),
        ElevatedButton(
          onPressed: resetHelper,
          child: const Text("Reset"),
        )
      ]),
    );
  }
}
