import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_model.freezed.dart';
part 'grid_model.g.dart';

@freezed
class GridModel with _$GridModel {
  const GridModel._();

  const factory GridModel({
    required Set<int> numbers,
    required Set<int> specialNumbers,
    String? drawnAt,
  }) = _GridModel;

  factory GridModel.fromJson(Map<String, dynamic> json) =>
      _$GridModelFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is GridModel &&
        const SetEquality().equals(numbers, other.numbers) &&
        const SetEquality().equals(specialNumbers, other.specialNumbers);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, numbers, specialNumbers);
  }
}
