import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';

class LotteryStatistics extends StatelessWidget {
  final Color? cardColor;
  const LotteryStatistics({super.key, this.cardColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            direction: Axis.vertical,
            spacing: 16.0,
            children: [
              Text(
                'Statistics',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                '• ${Lottery().gridsFromCsv.length} grids from data',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '• First grid drawn at ${Lottery().gridsFromCsv.lastOrNull?.drawnAt}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '• Last grid drawn at ${Lottery().gridsFromCsv.firstOrNull?.drawnAt}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
