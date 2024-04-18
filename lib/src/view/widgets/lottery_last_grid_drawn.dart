import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';
import 'package:lottery/src/view/widgets/grid_item.dart';

class LotteryLastGridDrawn extends StatelessWidget {
  final Color? cardColor;

  /// Decoration for numbers.
  final LotteryNumberItemDecoration numberDecoration;

  /// Decoration for special numbers.
  final LotteryNumberItemDecoration specialNumberDecoration;

  const LotteryLastGridDrawn({
    super.key,
    required this.numberDecoration,
    required this.specialNumberDecoration,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    final gridModel = Lottery().gridsFromCsv.first;
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Last grid drawn (${gridModel.drawnAt})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            GridItem(
              gridModel: gridModel,
              numberDecoration: numberDecoration,
              specialNumberDecoration: specialNumberDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
