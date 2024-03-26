import 'package:first_app/styled_font.dart';
import 'package:flutter/material.dart';
import 'rolldice.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
      child: const Column(
        // Atau gunakan Stack sesuai kebutuhan Anda
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StyledFont("Roll Dice Game"),
          SizedBox(height: 20), // Spasi antara judul dan RollDice widget
          Center(child: RollDice()),
        ],
      ),
    );
  }
}
