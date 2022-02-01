import 'package:flutter/material.dart';
import 'package:starting_flutter/result.dart';
import './quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final List<String> _userAnswers = [];

  //final is used if value does not change from the point in time when program runs
  //but can be initialized with a value
  //const is compile time constant
  static const _questions = [
    {
      'questionText': "What are the two types of widgets in Flutter?",
      'answers': [
        'State and No-state',
        'Stateful and Stateless',
        'Standard and Custom',
        'All above'
      ],
      'answer': 'Stateful and Stateless',
      'id': 1
    },
    {
      'questionText': "What are the different build modes in Flutter",
      'answers': [
        'Debug, Profile and Release',
        'Test, Stage and Prod',
        'there are none',
        'I don\'t know'
      ],
      'answer': 'Debug, Profile and Release',
      'id': 2
    },
    {
      'questionText':
          "True or False: A Stateless Widget state creates ONLY ONCE, then it can update values but not state explicitly",
      'answers': ['True', 'False'],
      'answer': 'True',
      'id': 3
    },
    {
      'questionText':
          "True or False: A Stateful Widget can update its STATE (locally) & values multiple times upon event triggered.",
      'answers': ['True', 'False'],
      'answer': 'True',
      'id': 4
    },
    {
      'questionText': "Which one of these is true regarding Hot Reload?",
      'answers': [
        'Hot reload feature quickly compiles the newly added code in our file and sent the code to Dart Virtual Machine. After done updating the Code Dart Virtual Machine update the app UI with widgets.',
        'Hot reload takes longer than hot restart',
        'Hot reload is the same as hot restart'
      ],
      'answer':
          'Hot reload feature quickly compiles the newly added code in our file and sent the code to Dart Virtual Machine. After done updating the Code Dart Virtual Machine update the app UI with widgets.',
      'id': 5
    },
    {
      'questionText': "Which one of these is true regarding Hot Restart?",
      'answers': [
        'The app widget tree is completely rebuilt with new typed code',
        'Hot restart is quicker than hot reload',
        'Hot restart is the same as hot reload'
      ],
      'answer': 'The app widget tree is completely rebuilt with new typed code',
      'id': 6
    },
    {
      'questionText':
          "True or False: Functions can be passed as arguments to Widgets",
      'answers': ['True', 'False'],
      'answer': 'True',
      'id': 7
    },
    {
      'questionText': "Which one of these is not a state management approach?",
      'answers': ['River Lily', 'Provider', 'BloC', 'setState'],
      'answer': 'River Lily',
      'id': 8
    },
    {
      'questionText': "What is the difference between a Stream and Future?",
      'answers': [
        'Streams is a sequence of asynchronous events and emits events continuously until it is cancelled. A Future is an asynchronous event that will return once ready',
        'There are none',
        'Streams run only twice whereas Futures run only once',
      ],
      'answer':
          'Streams is a sequence of asynchronous events and emits events continuously until it is cancelled. A Future is an asynchronous event that will return once ready',
      'id': 9
    },
    {
      'questionText': "What programming language is used in Flutter?",
      'answers': ['Java', 'C++', 'Python', 'Dart'],
      'answer': 'Dart',
      'id': 10
    }
  ];

  @override //decorator
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quizzie"),
        ),
        body: Center(
          child: _questionIndex < _questions.length
              ? Quiz(
                  helper: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex,
                )
              : Result(
                  resetHelper: _resetQuiz,
                  score: _calculateScore,
                ),
        ),
      ),
    );
  }

  void _answerQuestion(String answer) {
    setState(() {
      if (_questionIndex < _questions.length) {
        _questionIndex++;
      }
      _userAnswers.add(answer);
    });
  }

  String _calculateScore() {
    int total = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_userAnswers[i] == _questions[i]['answer']) {
        total++;
      }
    }

    return (((total / _questions.length) * 100).toStringAsFixed(2) + '%');
  }

  void _resetQuiz() {
    setState(() {
      _userAnswers.clear();
      _questionIndex = 0;
    });
  }
}
