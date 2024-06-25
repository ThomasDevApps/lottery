// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GridModelImpl _$$GridModelImplFromJson(Map<String, dynamic> json) =>
    _$GridModelImpl(
      numbers: (json['numbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toSet(),
      specialNumbers: (json['specialNumbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toSet(),
      drawnAt: json['drawnAt'] as String?,
    );

Map<String, dynamic> _$$GridModelImplToJson(_$GridModelImpl instance) =>
    <String, dynamic>{
      'numbers': instance.numbers.toList(),
      'specialNumbers': instance.specialNumbers.toList(),
      'drawnAt': instance.drawnAt,
    };
