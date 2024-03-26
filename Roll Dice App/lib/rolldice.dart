import 'dart:math';
import 'package:first_app/buttonstyle.dart';
import 'package:flutter/material.dart';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  var activeDice = "assets/images/dice1.png";

  void rollDice() {
    var randomNumber = 1 + Random().nextInt(6);
    setState(() {
      activeDice = "assets/images/dice$randomNumber.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Image.asset(activeDice, width: 200, height: 200),
          const SizedBox(height: 20),
          ButtonContainer(
            onPressed: () {
              rollDice();
            },
            child: const Text('Roll the Dice'),
          )
        ],
      ),
    );
  }
}
