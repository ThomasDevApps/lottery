import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';

class LotteryRandomPick extends StatefulWidget {
  /// Length of numbers to be drawn.
  final int numbersLength;

  /// Length of special numbers to be drawn.
  final int specialNumbersLength;

  /// Decoration for numbers.
  final LotteryNumberItemDecoration numberDecoration;

  /// Decoration for special numbers.
  final LotteryNumberItemDecoration specialNumberDecoration;

  /// Color of the card.
  final Color? cardColor;

  const LotteryRandomPick({
    super.key,
    required this.numbersLength,
    required this.specialNumbersLength,
    required this.numberDecoration,
    required this.specialNumberDecoration,
    this.cardColor,
  });

  @override
  State<LotteryRandomPick> createState() => _LotteryRandomPickState();
}

class _LotteryRandomPickState extends State<LotteryRandomPick> {
  List<int>? numbersDrawn;
  List<int>? specialNumbersDrawn;
  GridModel? winningGrid;

  Widget displayGridModel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...numbersDrawn!.map(
          (e) => LotteryNumberItem(
            number: e,
            decoration: widget.numberDecoration,
          ),
        ),
        ...specialNumbersDrawn!.map(
          (e) => LotteryNumberItem(
            number: e,
            decoration: widget.specialNumberDecoration,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                final grid = Lottery().draw(
                  length: widget.numbersLength,
                  specialLength: widget.specialNumbersLength,
                );
                setState(() {
                  numbersDrawn = grid.numbers.toList();
                  specialNumbersDrawn = grid.specialNumbers.toList();
                  winningGrid = Lottery().wasWinningGrid(grid);
                });
              },
              child: const Text('Drawn'),
            ),
            if (numbersDrawn != null && specialNumbersDrawn != null)
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Column(
                  children: [
                    displayGridModel(),
                    if (winningGrid != null) ...[
                      const SizedBox(height: 32),
                      Text(
                        'Grille gagnante ! (TAS le ${winningGrid?.drawnAt.toString() ?? '??'}',
                        style: const TextStyle(color: Colors.amber),
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
