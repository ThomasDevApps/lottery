import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';

class GridItem extends StatelessWidget {
  final GridModel? gridModel;
  final List<int>? numbers;
  final List<int>? specialNumbers;
  final LotteryNumberItemDecoration numberDecoration;
  final LotteryNumberItemDecoration specialNumberDecoration;

  const GridItem.fromNumbers({
    super.key,
    required List<int> this.numbers,
    required List<int> this.specialNumbers,
    required this.numberDecoration,
    required this.specialNumberDecoration,
  }) : gridModel = null;

  const GridItem({
    super.key,
    required GridModel this.gridModel,
    required this.numberDecoration,
    required this.specialNumberDecoration,
  })  : numbers = null,
        specialNumbers = null;

  @override
  Widget build(BuildContext context) {
    final numbers = gridModel?.numbers ?? this.numbers!;
    final specialNumbers = gridModel?.specialNumbers ?? this.specialNumbers!;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        runSpacing: 8.0,
        direction: Axis.horizontal,
        children: [
          ...numbers.map(
            (e) => LotteryNumberItem(
              number: e,
              decoration: numberDecoration,
            ),
          ),
          ...specialNumbers.map(
            (e) => LotteryNumberItem(
              number: e,
              decoration: specialNumberDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
