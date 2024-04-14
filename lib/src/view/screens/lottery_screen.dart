import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';
import 'package:lottery/src/view/widgets/lottery_random_pick.dart';

class LotteryScreen extends StatelessWidget {
  /// Background color of the screen.
  final Color? backgroundColor;

  /// List of [LotteryOutputs] to be showed.
  final List<LotteryOutputs> outputs;

  /// Length of numbers to be drawn.
  final int length;

  /// Length of special numbers to be drawn.
  final int specialLength;

  /// Decoration of numbers.
  final LotteryNumberItemDecoration numberDecoration;

  /// Decoration of special numbers.
  final LotteryNumberItemDecoration specialNumberDecoration;

  const LotteryScreen({
    super.key,
    this.backgroundColor,
    required this.outputs,
    required this.length,
    required this.specialLength,
    required this.numberDecoration,
    required this.specialNumberDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: outputs
                    .map((e) => Expanded(child: e))
                    .cast<Widget>()
                    .toList()
                    ._addSeparator(const SizedBox(height: 16)),
              ),
            ),
            Expanded(
              child: LotteryRandomPick(
                length: length,
                specialLength: specialLength,
                numberDecoration: numberDecoration,
                specialNumberDecoration: specialNumberDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension _ListExtension<E> on List<E> {
  /// Function to add [separator] between each item of the list.
  List<E> _addSeparator(E separator) {
    final copy = List<E>.from(this);
    if (copy.length > 1) {
      for (var item in this) {
        if (item != last) {
          copy.insert(copy.indexOf(item) + 1, separator);
        }
      }
    }
    return copy;
  }
}
