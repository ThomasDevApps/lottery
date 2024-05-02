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
        clipBehavior: Clip.hardEdge,
        color: cardColor,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Center(
              child: Text(
                'Statistics',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 24),
            _StatisticItem(
              title: 'Grids from data',
              cardColor: cardColor,
              content: Lottery().getNumberOfGrids().toString(),
            ),
            const SizedBox(height: 16),
            _StatisticItem(
              title: 'Last grid drawn',
              cardColor: cardColor,
              content: Lottery().lastGridDrawnAt() ?? '?',
            ),
            const SizedBox(height: 16),
            _StatisticItem(
              title: 'First grid drawn',
              cardColor: cardColor,
              content: Lottery().firstGridDrawnAt() ?? '?',
            ),
          ],
        ),
      ),
    );
  }
}

class _StatisticItem extends StatelessWidget {
  final String title;
  final String content;
  final Color? cardColor;
  const _StatisticItem({
    required this.title,
    required this.content,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            const SizedBox(height: 8),
            Text(content, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
