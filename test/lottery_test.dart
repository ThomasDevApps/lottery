import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottery/lottery.dart';

Future<void> _initializeLottery() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Lottery.initialize(
    pathCsv: 'assets/data_test.csv',
    numberIndexes: [0, 1, 2, 3],
    specialNumberIndexes: [4, 5, 6],
    dateTimeColumnIndex: 7,
  );
  addTearDown(Lottery().dispose);
}

void main() {
  group('Test initialize', () {
    test('Test initialize number outputs', () async {
      final outputsExpected = {};
      outputsExpected[10] = 3;
      outputsExpected[13] = 1;
      outputsExpected[14] = 1;
      outputsExpected[25] = 2;
      outputsExpected[1] = 2;
      outputsExpected[16] = 1;
      outputsExpected[6] = 2;

      await _initializeLottery();
      expect(Lottery().numbers, outputsExpected);
    });

    test('Test initialize special number outputs', () async {
      final outputsExpected = {};
      outputsExpected[1] = 1;
      outputsExpected[35] = 1;
      outputsExpected[5] = 1;
      outputsExpected[39] = 2;
      outputsExpected[37] = 1;
      outputsExpected[2] = 2;
      outputsExpected[33] = 1;

      await _initializeLottery();
      expect(Lottery().specialNumbers, outputsExpected);
    });

    test('Test initialize drawnAt for each grid', () async {
      await _initializeLottery();
      expect(Lottery().gridsFromCsv[0].drawnAt, '22/04/2024');
      expect(Lottery().gridsFromCsv[1].drawnAt, '18/04/2024');
      expect(Lottery().gridsFromCsv[2].drawnAt, '15/04/2024');
    });
  });

  test('Test createListProbabilities', () async {
    await _initializeLottery();

    final inputs = {1: 1, 2: 5, 3: 1, 4: 2};
    final list = Lottery().createListProbabilities(inputs);
    final listExpected = [1, 2, 2, 2, 2, 2, 3, 4, 4];
    expect(list, listExpected);
  });

  group('Test that a grid was a winning grid', () {
    test("Test that it's was a winning grid", () async {
      await _initializeLottery();
      const gridModel = GridModel(
        numbers: {10, 13, 14, 25},
        specialNumbers: {1, 35, 5},
      );
      expect(
        Lottery().wasWinningGrid(gridModel) == Lottery().gridsFromCsv.last,
        true,
      );
    });

    test("Test that it's was NOT a winning grid", () async {
      await _initializeLottery();
      const gridModel = GridModel(
        numbers: {36, 12, 41, 25},
        specialNumbers: {1, 35, 5},
      );
      expect(Lottery().wasWinningGrid(gridModel), null);
    });
  });

  test('Test getNumberOfGrids', () async {
    await _initializeLottery();
    expect(Lottery().numberOfGrids, 3);
  });

  test('Test lastGridDrawnAt', () async {
    await _initializeLottery();
    expect(Lottery().lastGridDrawnAt, '22/04/2024');
  });

  test('Test firstGridDrawnAt', () async {
    await _initializeLottery();
    expect(Lottery().firstGridDrawnAt, '15/04/2024');
  });
}
