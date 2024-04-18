import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';
import 'package:lottery/src/view/items/grid_item.dart';

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: widget.cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                      GridItem.fromNumbers(
                        numbers: numbersDrawn!,
                        specialNumbers: specialNumbersDrawn!,
                        numberDecoration: widget.numberDecoration,
                        specialNumberDecoration: widget.specialNumberDecoration,
                      ),
                      if (winningGrid != null) ...[
                        const SizedBox(height: 32),
                        Text(
                          'Grille gagnante ! (TAS le ${winningGrid?.drawnAt ?? '??'})',
                          style: const TextStyle(color: Colors.amber),
                        ),
                      ],
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
