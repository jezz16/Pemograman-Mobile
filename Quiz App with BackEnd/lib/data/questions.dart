import 'package:project2_arfan/data/categories.dart';
import 'package:project2_arfan/models/category.dart';
import 'package:project2_arfan/models/question.dart';

final questions = [
  Question(
    id: '1',
    text: 'Berikut ini yang bukan merupakan fungsi Layer Transport adalah...',
    answers: ['Routing', 'Segmentasi', 'Flow control', 'Error control'],
    category: categories[Categories.computerNetwork]!,
  ),
  Question(
    id: '2',
    text: 'Protokol yang bekerja pada lapisan Application adalah...',
    answers: ['HTTP', 'TCP', 'IP', 'Ethernet'],
    category: categories[Categories.computerNetwork]!,
  ),
  Question(
    id: '3',
    text:
        'Dalam topologi jaringan, perangkat yang berfungsi menghubungkan beberapa jaringan berbeda adalah...',
    answers: ['Router', 'Switch', 'Hub', 'Repeater'],
    category: categories[Categories.computerNetwork]!,
  ),
  Question(
    id: '4',
    text:
        'Jenis kabel yang digunakan untuk menghubungkan dua perangkat jaringan secara langsung adalah...',
    answers: ['Crossover', 'Straight-through', 'Fiber optic', 'Coaxial'],
    category: categories[Categories.computerNetwork]!,
  ),
  Question(
    id: '5',
    text: 'Standar yang digunakan untuk jaringan nirkabel adalah...',
    answers: ['IEEE 802.11', 'IEEE 802.3', 'IEEE 802.5', 'IEEE 802.15'],
    category: categories[Categories.computerNetwork]!,
  ),
];
