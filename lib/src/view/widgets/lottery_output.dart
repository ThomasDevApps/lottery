import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lottery/lottery.dart';
import 'package:lottery/src/core/constants/constants.dart';

/// Decoration for [LotteryOutputs].
class LotteryOutputsDecoration {
  /// Width of the container.
  final double? width;

  /// Constraints of the container.
  final BoxConstraints constraints;

  /// BorderRadius of the container.
  final BorderRadius? borderRadius;

  const LotteryOutputsDecoration({
    this.width,
    this.constraints = const BoxConstraints(minWidth: 250),
    this.borderRadius,
  });
}

class LotteryOutputs extends StatelessWidget {
  /// Outputs by the Lottery.
  ///
  /// - key is the number
  /// - value is the number of times the key has been drawn.
  final Map<int, int> outputs;

  /// Title of the container.
  final String title;

  /// Decoration of the container.
  final LotteryOutputsDecoration decoration;

  final LotteryNumberItemDecoration numberDecoration;

  const LotteryOutputs({
    super.key,
    required this.outputs,
    required this.title,
    this.decoration = const LotteryOutputsDecoration(),
    this.numberDecoration = kDefaultLotteryItemDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final outputSorted = outputs._sort();

    return Container(
      constraints: decoration.constraints,
      width: decoration.width ?? double.infinity,
      child: Card(
        color: Theme.of(context).cardTheme.color,
        shape: Theme.of(context).cardTheme.shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: RawScrollbar(
                    controller: scrollController,
                    thumbColor: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                    radius: const Radius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          scrollbars: false,
                        ),
                        child: _OutputsWrap(
                          scrollController: scrollController,
                          outputsSorted: outputSorted,
                          numberDecoration: numberDecoration,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget to display [outputsSorted] in [Wrap].
class _OutputsWrap extends StatelessWidget {
  final ScrollController scrollController;
  final Map<int, int> outputsSorted;
  final LotteryNumberItemDecoration numberDecoration;

  const _OutputsWrap({
    required this.scrollController,
    required this.outputsSorted,
    required this.numberDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Wrap(
        spacing: 4.0,
        runSpacing: 12.0,
        children: [
          ...outputsSorted.keys.map((key) {
            final value = outputsSorted[key]!;
            return LayoutBuilder(
              builder: (context, constraint) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 80,
                    maxWidth: (constraint.maxWidth / 4) - 4,
                  ).normalize(),
                  child: AspectRatio(
                    aspectRatio: 1 / 1.15,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: numberDecoration.backgroundColor,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              key.toString(),
                              style: TextStyle(
                                color: numberDecoration.foregroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '(${value}x)',
                              style: TextStyle(
                                color: (numberDecoration.foregroundColor ??
                                    Theme.of(context).colorScheme.onSurface),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

extension _MapExtensionProbability on Map<int, int> {
  /// Function to sort the map according with the value (not ascending).
  LinkedHashMap<int, int> _sort() {
    var sortedKeys = keys.toList(growable: false)
      ..sort((k1, k2) => this[k2]!.compareTo(this[k1]!));
    final sortedMap = LinkedHashMap<int, int>.fromIterable(
      sortedKeys,
      key: (k) => k,
      value: (k) => this[k]!,
    );
    return sortedMap;
  }
}
