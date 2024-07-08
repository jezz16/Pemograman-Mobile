import 'package:project2_arfan/models/category.dart';
import 'package:flutter/material.dart';

class Question {
  Question(
      {required this.id,
      required this.text,
      required this.answers,
      required this.category});

  final String id;
  final String text;
  final List<String> answers;
  final Category category;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

// Contoh penggunaan
final Category someCategoryInstance = Category('Mobile Programming', Colors.blue);

final question = Question(
    id: 'q1',
    text: 'What is the capital of France?',
    answers: ['Paris', 'London', 'Berlin', 'Rome'],
    category: someCategoryInstance);

final shuffledAnswers = question.getShuffledAnswers();
