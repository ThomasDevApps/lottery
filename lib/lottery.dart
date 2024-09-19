library lottery;

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:lottery/src/models/grid_model/grid_model.dart';

export 'src/models/grid_model/grid_model.dart';
export 'src/view/items/grid_item.dart';
export 'src/view/items/lottery_number_item.dart';
export 'src/view/screens/lottery_screen.dart';
export 'src/view/widgets/lottery_last_grid_drawn.dart';
export 'src/view/widgets/lottery_output.dart';
export 'src/view/widgets/lottery_random_pick.dart';

part 'src/core/utils/csv_utils.dart';

class Lottery {
  /// Current instance of [Lottery].
  static Lottery? _instance;

  final Map<int, int> numbers = {};
  final Map<int, int> specialNumbers = {};
  final List<GridModel> gridsFromCsv = [];

  bool _isInitialized = false;

  /// Private constructor of [Lottery].
  Lottery._();

  /// Factory constructor of [Lottery], returns [_instance].
  factory Lottery() {
    if (_instance == null) {
      throw Exception('You must call Lottery.initialize() first');
    }
    return _instance!;
  }

  /// Function to initialize [_instance].
  ///
  /// - [numberIndexes] is a list containing all the indexes
  /// of the columns containing the numbers.
  ///
  /// - [specialNumberIndexes] is a list containing all the indexes
  /// of the columns containing the special numbers.
  ///
  /// - [dateTimeColumnIndex] is the index of the column containing
  /// the date of the draw for the grid (example : 15/04/2024)
  static Future<void> initialize({
    required String pathCsv,
    required List<int> numberIndexes,
    required List<int> specialNumberIndexes,
    int? dateTimeColumnIndex,
    Pattern pattern = ';',
  }) async {
    _instance ??= Lottery._();
    if (!_instance!._isInitialized) {
      final resultCsv = await _CsvUtils.readNumbersCsv(pathCsv);
      // For each line from the csv
      for (var line in resultCsv) {
        // Split field
        List<dynamic> fields = (line.first as String).split(pattern);
        final grid = GridModel(
          numbers: numberIndexes.map((e) => int.parse(fields[e])).toSet(),
          specialNumbers:
              specialNumberIndexes.map((e) => int.parse(fields[e])).toSet(),
          drawnAt: dateTimeColumnIndex != null
              ? (fields.elementAt(dateTimeColumnIndex) as String)
                  .split('\r')
                  .first
              : null,
        );
        _instance!.gridsFromCsv.add(grid);
      }
      _instance!.initializeStatistics();
      // Set isInitialized to true
      _instance!._isInitialized = true;
    }
  }

  /// Function to initialize [numbers] and [specialNumbers]
  /// according with [gridsFromCsv].
  @visibleForTesting
  @protected
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

  /// Function to know if [gridModel] is a winning grid.
  ///
  /// If it's the case it will return the grid winner from [gridsFromCsv],
  /// otherwise it will return null.
  GridModel? wasWinningGrid(GridModel gridModel) {
    return gridsFromCsv.firstWhereOrNull((element) => element == gridModel);
  }

  /// Function to drawn a random [GridModel] while taking into account
  /// the probability of each number being drawn.
  GridModel draw({required int length, required int specialLength}) {
    return GridModel(
      numbers: drawRandomNumbers(numbers, length: length),
      specialNumbers: drawRandomNumbers(specialNumbers, length: specialLength),
    );
  }

  @protected
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

  /// Function to create the list of probabilities.
  ///
  /// ```dart
  /// final inputs = {
  ///   4: 2,
  ///   8: 4,
  ///   12: 3,
  /// };
  ///
  /// print(createListProbabilities(inputs)); // [4, 4, 8, 8, 8, 8, 12, 12, 12]
  /// ```
  @visibleForTesting
  @protected
  List<int> createListProbabilities(Map<int, int> inputs) {
    final List<int> list = [];
    inputs.forEach((key, value) {
      for (var i = 0; i < value; i++) {
        list.add(key);
      }
    });
    return list;
  }

  void dispose() {
    _instance = null;
  }

  /// Function to get the length of [gridsFromCsv].
  int get numberOfGrids => gridsFromCsv.length;

  /// Function to get when the more recent grid has been drawn.
  String? get lastGridDrawnAt => gridsFromCsv.firstOrNull?.drawnAt;

  /// Function to get when the first grid (chronologically) has been drawn
  String? get firstGridDrawnAt => gridsFromCsv.lastOrNull?.drawnAt;
}
