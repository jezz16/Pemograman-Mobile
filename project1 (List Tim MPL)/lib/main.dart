import 'package:flutter/material.dart';
import 'package:project1_arfan/team_list.dart';
import 'home_screen.dart';

void main() {
  runApp(const MPLApp());
}

class MPLApp extends StatelessWidget {
  const MPLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MPL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/team_list': (context) => const TeamListScreen(),
      },
    );
  }
}
