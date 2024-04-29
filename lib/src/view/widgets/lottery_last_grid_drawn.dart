import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';

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
    const padding = EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: cardColor,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline_rounded),
                const SizedBox(width: 8),
                Text(
                  'Last grid drawn (${gridModel.drawnAt})',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          color: cardColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: padding,
            child: GridItem(
              gridModel: gridModel,
              numberDecoration: numberDecoration,
              specialNumberDecoration: specialNumberDecoration,
            ),
          ),
        ),
      ],
    );
  }
}
