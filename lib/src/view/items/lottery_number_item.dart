import 'package:flutter/material.dart';

/// Decoration for each [LotteryNumberItem].
class LotteryNumberItemDecoration {
  final Color backgroundColor;
  final Color? foregroundColor;

  LotteryNumberItemDecoration({
    required this.backgroundColor,
    this.foregroundColor,
  });
}

class LotteryNumberItem extends StatelessWidget {
  final int number;
  final LotteryNumberItemDecoration decoration;

  const LotteryNumberItem({
    super.key,
    required this.number,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: decoration.backgroundColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 80,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                fontSize: 18,
                color: decoration.foregroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
