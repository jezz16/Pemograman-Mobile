import 'package:flutter/material.dart';
import 'package:project2_arfan/data/questions.dart';
import 'package:project2_arfan/components/start_screen/start_screen.dart';
import 'package:project2_arfan/components/quiz_screen/question_screen.dart';
import 'package:project2_arfan/components/results_screen/result_screen.dart';
import 'package:project2_arfan/components/question_list_screen/question_list_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
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
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  void createQuiz() {
    setState(() {
      activeScreen = 'question-list-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen, createQuiz);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget =
          ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    if (activeScreen == 'question-list-screen') {
      screenWidget = QuestionListScreen(
        onReturn: () {
          setState(() {
            activeScreen = 'start-screen';
          });
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
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
