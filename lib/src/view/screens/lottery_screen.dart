import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';

class LotteryScreen extends StatelessWidget {
  /// Background color of the screen.
  final Color? backgroundColor;

  /// Color of the card.
  final Color? cardColor;

  /// Number outputs.
  final LotteryOutputs numberOutputs;

  /// Special number outputs.
  final LotteryOutputs specialNumberOutputs;

  /// Length of numbers to be drawn.
  final int numbersLength;

  /// Length of special numbers to be drawn.
  final int specialNumbersLength;

  /// Decoration of numbers.
  final LotteryNumberItemDecoration numberDecoration;

  /// Decoration of special numbers.
  final LotteryNumberItemDecoration specialNumberDecoration;

  const LotteryScreen({
    super.key,
    this.backgroundColor,
    this.cardColor,
    required this.numberOutputs,
    required this.specialNumberOutputs,
    required this.numbersLength,
    required this.specialNumbersLength,
    required this.numberDecoration,
    required this.specialNumberDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8.0),
            Expanded(child: numberOutputs),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      LotteryLastGridDrawn(
                        numberDecoration: numberDecoration,
                        specialNumberDecoration: specialNumberDecoration,
                        cardColor: cardColor,
                      ),
                      const SizedBox(height: 8),
                      LotteryRandomPick(
                        numbersLength: numbersLength,
                        specialNumbersLength: specialNumbersLength,
                        numberDecoration: numberDecoration,
                        specialNumberDecoration: specialNumberDecoration,
                        cardColor: cardColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: specialNumberOutputs),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}
