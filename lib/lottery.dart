library lottery;

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:lottery/src/models/grid_model/grid_model.dart';

export 'src/models/grid_model/grid_model.dart';

part 'src/core/utils/csv_utils.dart';

abstract class Lottery {
  final Map<int, int> numbers = {};
  final Map<int, int> specialNumbers = {};
  final List<GridModel> gridsFromCsv = [];

  bool _isInitialized = false;

  Future<void> initialize({
    required String pathCsv,
    required List<int> numbersColumn,
    required List<int> specialNumbersColumn,
    Pattern pattern = ';',
  }) async {
    if (!_isInitialized) {
      final resultCsv = await _CsvUtils.readNumbersCsv(pathCsv);
      // For each line from the csv
      for (var line in resultCsv) {
        // Split field
        List<dynamic> fields = (line.first as String).split(pattern);
        final grid = GridModel(
          numbers: numbersColumn.map((e) => int.parse(fields[e])).toSet(),
          specialNumbers:
              specialNumbersColumn.map((e) => int.parse(fields[e])).toSet(),
        );
        gridsFromCsv.add(grid);
      }
      initializeStatistics();
      // Set isInitialized to true
      _isInitialized = true;
    }
  }

  /// Function to initialize [numbers] and [specialNumbers]
  /// according with [gridsFromCsv].
  @visibleForTesting
  void initializeStatistics() {
    for (var grid in gridsFromCsv) {
      // Put each number in the numbers map
      for (var number in grid.numbers) {
        final value = numbers[number] ?? 0;
        numbers[number] = value + 1;
      }
      // Put each special number in the special numbers map
      for (var specialNumber in grid.specialNumbers) {
        final value = specialNumbers[specialNumber] ?? 0;
        specialNumbers[specialNumber] = value + 1;
      }
    }
  }

  bool wasWinningGrid(GridModel gridModel) {
    return gridsFromCsv.contains(gridModel);
  }

  GridModel draw({required int length, required int specialLength}) {
    return GridModel(
      numbers: drawRandomNumbers(numbers, length: length),
      specialNumbers: drawRandomNumbers(specialNumbers, length: specialLength),
    );
  }

  @visibleForTesting
  Set<int> drawRandomNumbers(Map<int, int> data, {required int length}) {
    final list = createListProbabilities(data);
    final numbers = <int>{};
    while (numbers.length < length) {
      int randomIndex = Random().nextInt(list.length - 1);
      int elementToAdd = list.elementAt(randomIndex);
      numbers.add(elementToAdd);
      list.removeWhere((element) => element == elementToAdd);
    }
    return numbers;
  }

  @visibleForTesting
  List<int> createListProbabilities(Map<int, int> inputs) {
    final List<int> list = [];
    inputs.forEach((key, value) {
      for (var i = 0; i < value; i++) {
        list.add(key);
      }
    });
    return list;
  }
}
