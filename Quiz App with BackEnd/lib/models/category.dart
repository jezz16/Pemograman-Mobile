import 'package:flutter/material.dart';

enum Categories { mobileProgramming, computerNetwork }

class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;
}

// final Category category1 = Category('Mobile Programming', Colors.blue);
// final Category category2 = Category('Computer Network', Colors.red);
