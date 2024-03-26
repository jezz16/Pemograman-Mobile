import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const ButtonContainer({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Sesuaikan dengan kebutuhan Anda
      margin: const EdgeInsets.all(10), // Sesuaikan dengan kebutuhan Anda
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          foregroundColor: const Color.fromARGB(255, 247, 218, 218),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: child,
      ),
    );
  }
}
