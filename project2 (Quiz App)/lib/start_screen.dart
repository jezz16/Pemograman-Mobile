import 'package:flutter/material.dart';
// import 'package:project2_arfan/quiz_app.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset("assets/image/quizlogo.png",
          width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
      const SizedBox(
        height: 40,
      ),
      const Text(
        "Learn Flutter",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz!")),
    ] // OutlinedButton.icon
            ));
  }
}
