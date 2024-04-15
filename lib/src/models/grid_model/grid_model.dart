import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_model.freezed.dart';
part 'grid_model.g.dart';

@freezed
class GridModel with _$GridModel {
  const factory GridModel({
    required Set<int> numbers,
    required Set<int> specialNumbers,
    String? drawnAt,
  }) = _GridModel;

  factory GridModel.fromJson(Map<String, dynamic> json) =>
      _$GridModelFromJson(json);
}
