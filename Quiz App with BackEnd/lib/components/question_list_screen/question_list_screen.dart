import 'package:flutter/material.dart';
import 'package:project2_arfan/components/question_list_screen/new_question.dart';
import 'package:project2_arfan/models/question.dart';
import 'package:project2_arfan/models/category.dart';
import 'package:project2_arfan/data/categories.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionListScreen extends StatefulWidget {
  const QuestionListScreen({super.key, required this.onReturn});

  final VoidCallback onReturn;

  @override
  State<QuestionListScreen> createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  late Future<List<Question>> _loadedQuestions;

  @override
  void initState() {
    super.initState();
    _loadedQuestions = _loadQuestions();
  }

  Future<List<Question>> _loadQuestions() async {
    var url = Uri.https(
        'flutter-quiz-71e24-default-rtdb.firebaseio.com', 'question-list.json');
    try {
      var response = await http.get(url);

      if (response.statusCode >= 400) {
        throw Exception('Failed to fetch data.');
      }

      if (response.body == 'null') {
        return [];
      }

      final Map<String, dynamic> listQuestion = json.decode(response.body);
      final List<Question> loadedQuestions = [];

      for (final question in listQuestion.entries) {
        final category = categories.entries
            .firstWhere(
                (catItem) => catItem.value.title == question.value['category'])
            .value;
        final List<String> answers = question.value['answers'].cast<String>();

        loadedQuestions.add(Question(
          id: question.key,
          text: question.value['text'],
          answers: answers,
          category: category,
        ));
      }

      return loadedQuestions;
    } catch (error) {
      throw Exception('Something went wrong! Please try again later.');
    }
  }

  Future<void> _addQuestion() async {
    final newQuestion = await Navigator.of(context).push<Question>(
      MaterialPageRoute(
        builder: (ctx) => const NewQuestion(),
      ),
    );

    if (newQuestion == null) {
      return;
    }

    setState(() {
      _loadedQuestions = _loadQuestions();
    });
  }

  Future<void> _editQuestion(Question question) async {
    final editedQuestion = await Navigator.of(context).push<Question>(
      MaterialPageRoute(
        builder: (ctx) => NewQuestion(
          question: question,
        ),
      ),
    );

    if (editedQuestion == null) {
      return;
    }

    setState(() {
      _loadedQuestions = _loadQuestions();
    });
  }

  Future<void> _removeQuestion(Question question) async {
    final url = Uri.https('flutter-quiz-71e24-default-rtdb.firebaseio.com',
        'question-list/${question.id}.json');
    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      throw Exception('Failed to delete data.');
    }

    setState(() {
      _loadedQuestions = _loadQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onReturn,
        ),
        actions: [
          IconButton(
            onPressed: _addQuestion,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder<List<Question>>(
          future: _loadedQuestions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(snapshot.error.toString(),
                      style: const TextStyle(color: Colors.white)));
            } else if (snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('No questions added yet!',
                      style: TextStyle(color: Colors.white)));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Dismissible(
                  onDismissed: (direction) {
                    _removeQuestion(snapshot.data![index]);
                  },
                  key: ValueKey(snapshot.data![index].id),
                  child: ListTile(
                    title: Text(snapshot.data![index].text,
                        style: const TextStyle(color: Colors.white)),
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: snapshot.data![index].category.color,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            _editQuestion(snapshot.data![index]);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            _removeQuestion(snapshot.data![index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
