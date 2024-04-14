import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';
import 'package:lottery/src/view/widgets/lottery_random_pick.dart';

class LotteryScreen extends StatelessWidget {
  final Color? backgroundColor;
  final List<LotteryOutputs> outputs;

  const LotteryScreen({
    super.key,
    this.backgroundColor,
    required this.outputs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
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
                draw: () {},
                isWinning: (GridModel gridDrawn) {},
                numberDecoration: null,
                specialNumberDecoration: null,
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
