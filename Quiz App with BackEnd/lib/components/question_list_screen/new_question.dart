import 'package:flutter/material.dart';
import 'package:project2_arfan/data/categories.dart';
import 'package:project2_arfan/models/question.dart';
import 'package:project2_arfan/models/category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewQuestion extends StatefulWidget {
  final Question? question;

  const NewQuestion({super.key, this.question});

  @override
  State<NewQuestion> createState() {
    return _NewQuestionState();
  }
}

class _NewQuestionState extends State<NewQuestion> {
  final _formKey = GlobalKey<FormState>();
  var _enteredQuestion = '';
  var _enteredAnswers = '';
  Category? _selectedCategory;
  var _isSending = false;

  @override
  void initState() {
    super.initState();
    if (widget.question != null) {
      _enteredQuestion = widget.question!.text;
      _enteredAnswers = widget.question!.answers.join(',');
      _selectedCategory = widget.question!.category;
    }
  }

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      _formKey.currentState!.save();

      final List<String> answers = _enteredAnswers.split(',');

      if (widget.question == null) {
        // Add new question
        final url = Uri.https('flutter-quiz-71e24-default-rtdb.firebaseio.com',
            'question-list.json');
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'text': _enteredQuestion,
            'answers': answers,
            'category': _selectedCategory!.title,
          }),
        );

        final Map<String, dynamic> resData = json.decode(response.body);
        if (!context.mounted) {
          return;
        }
        Navigator.of(context).pop(Question(
          id: resData['name'],
          text: _enteredQuestion,
          answers: answers,
          category: _selectedCategory!,
        ));
      } else {
        // Edit existing question
        final url = Uri.https('flutter-quiz-71e24-default-rtdb.firebaseio.com',
            'question-list/${widget.question!.id}.json');
        await http.patch(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'text': _enteredQuestion,
            'answers': answers,
            'category': _selectedCategory!.title,
          }),
        );

        if (!context.mounted) {
          return;
        }
        Navigator.of(context).pop(Question(
          id: widget.question!.id,
          text: _enteredQuestion,
          answers: answers,
          category: _selectedCategory!,
        ));
      }

      setState(() {
        _isSending = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.question == null ? 'Add a New Question' : 'Edit Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _enteredQuestion,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Question'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredQuestion = value!;
                },
              ),
              TextFormField(
                initialValue: _enteredAnswers,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Answers (comma separated)'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredAnswers = value!;
                },
              ),
              DropdownButton<Category>(
                hint: const Text('Select Category'),
                value: _selectedCategory,
                items: categories.entries
                    .map((entry) => DropdownMenuItem<Category>(
                          value: entry.value,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: entry.value.color,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(entry.value.title),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSending
                        ? null
                        : () {
                            _formKey.currentState!.reset();
                          },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _isSending ? null : _saveItem,
                    child: _isSending
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(),
                          )
                        : Text(widget.question == null
                            ? 'Add Item'
                            : 'Save Changes'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
