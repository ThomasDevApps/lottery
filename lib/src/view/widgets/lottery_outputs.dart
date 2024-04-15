import 'dart:collection';

import 'package:flutter/material.dart';

/// Decoration for [LotteryOutputs].
class LotteryOutputsDecoration {
  /// Primary color of the container.
  final MaterialColor primary;

  /// Color of each number foreground.
  final Color? foregroundColor;

  /// Width of the container.
  final double? width;

  /// Constraints of the container.
  final BoxConstraints constraints;

  /// BorderRadius of the container.
  final BorderRadius? borderRadius;

  /// The number of children in the cross axis.
  final int crossAxisCount;

  /// The ratio of the cross-axis to the main-axis extent of each child.
  final double childAspectRatio;

  const LotteryOutputsDecoration({
    required this.primary,
    this.foregroundColor,
    this.width,
    this.constraints = const BoxConstraints(minWidth: 250),
    this.borderRadius,
    this.crossAxisCount = 5,
    this.childAspectRatio = 1 / 1.4,
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

  const LotteryOutputs({
    super.key,
    required this.outputs,
    required this.title,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final outputSorted = outputs._sort();

    return Container(
      constraints: decoration.constraints,
      width: decoration.width ?? MediaQuery.of(context).size.width / 5.5,
      child: Card(
        color: decoration.primary.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: decoration.borderRadius ?? BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Text(
                '$title :',
                style: TextStyle(
                  color: decoration.foregroundColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: RawScrollbar(
                    controller: scrollController,
                    thumbVisibility: true,
                    thumbColor: decoration.foregroundColor ?? Colors.white,
                    radius: const Radius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          scrollbars: false,
                        ),
                        child: _OutputsGridView(
                          scrollController: scrollController,
                          outputsSorted: outputSorted,
                          decoration: decoration,
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

/// Widget to display [outputsSorted] in the [GridView].
class _OutputsGridView extends StatelessWidget {
  final ScrollController scrollController;
  final Map<int, int> outputsSorted;
  final LotteryOutputsDecoration decoration;

  const _OutputsGridView({
    required this.scrollController,
    required this.outputsSorted,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      itemCount: outputsSorted.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: decoration.crossAxisCount,
        childAspectRatio: decoration.childAspectRatio,
      ),
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: decoration.primary.shade600,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  outputsSorted.keys.elementAt(index).toString(),
                  style: TextStyle(
                    color: decoration.foregroundColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '(${outputsSorted.values.elementAt(index).toString()}x)',
                  style: TextStyle(
                    color: (decoration.foregroundColor ??
                            Theme.of(context).colorScheme.onBackground)
                        .withOpacity(0.75),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
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
