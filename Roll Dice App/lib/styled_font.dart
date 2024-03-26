import 'package:flutter/material.dart';

class StyledFont extends StatelessWidget {
  final String text;

  const StyledFont(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 36, // Sesuaikan dengan kebutuhan Anda
          fontWeight: FontWeight.bold, // Sesuaikan dengan kebutuhan Anda
          color: Colors.white, // Sesuaikan dengan kebutuhan Anda
        ),
      ),
    );
  }
}
