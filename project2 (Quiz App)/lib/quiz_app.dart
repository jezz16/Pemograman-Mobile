import 'package:flutter/material.dart';
import 'package:project2_arfan/data/questions.dart';
import 'package:project2_arfan/start_screen.dart';
import 'package:project2_arfan/question_screen.dart';
import 'package:project2_arfan/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  //method
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget =
          ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        // title: Text(namaAplikasi),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 131, 121, 245),
            Color.fromARGB(255, 22, 154, 255),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: screenWidget,
        ),
      ),
    );
  }
}

// Remove the closing curly brace
// }
