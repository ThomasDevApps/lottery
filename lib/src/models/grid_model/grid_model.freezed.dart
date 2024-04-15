// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GridModel _$GridModelFromJson(Map<String, dynamic> json) {
  return _GridModel.fromJson(json);
}

/// @nodoc
mixin _$GridModel {
  Set<int> get numbers => throw _privateConstructorUsedError;
  Set<int> get specialNumbers => throw _privateConstructorUsedError;
  String? get drawnAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GridModelCopyWith<GridModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridModelCopyWith<$Res> {
  factory $GridModelCopyWith(GridModel value, $Res Function(GridModel) then) =
      _$GridModelCopyWithImpl<$Res, GridModel>;
  @useResult
  $Res call({Set<int> numbers, Set<int> specialNumbers, String? drawnAt});
}

/// @nodoc
class _$GridModelCopyWithImpl<$Res, $Val extends GridModel>
    implements $GridModelCopyWith<$Res> {
  _$GridModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? specialNumbers = null,
    Object? drawnAt = freezed,
  }) {
    return _then(_value.copyWith(
      numbers: null == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      specialNumbers: null == specialNumbers
          ? _value.specialNumbers
          : specialNumbers // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      drawnAt: freezed == drawnAt
          ? _value.drawnAt
          : drawnAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GridModelImplCopyWith<$Res>
    implements $GridModelCopyWith<$Res> {
  factory _$$GridModelImplCopyWith(
          _$GridModelImpl value, $Res Function(_$GridModelImpl) then) =
      __$$GridModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<int> numbers, Set<int> specialNumbers, String? drawnAt});
}

/// @nodoc
class __$$GridModelImplCopyWithImpl<$Res>
    extends _$GridModelCopyWithImpl<$Res, _$GridModelImpl>
    implements _$$GridModelImplCopyWith<$Res> {
  __$$GridModelImplCopyWithImpl(
      _$GridModelImpl _value, $Res Function(_$GridModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? specialNumbers = null,
    Object? drawnAt = freezed,
  }) {
    return _then(_$GridModelImpl(
      numbers: null == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      specialNumbers: null == specialNumbers
          ? _value._specialNumbers
          : specialNumbers // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      drawnAt: freezed == drawnAt
          ? _value.drawnAt
          : drawnAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GridModelImpl implements _GridModel {
  const _$GridModelImpl(
      {required final Set<int> numbers,
      required final Set<int> specialNumbers,
      this.drawnAt})
      : _numbers = numbers,
        _specialNumbers = specialNumbers;

  factory _$GridModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GridModelImplFromJson(json);

  final Set<int> _numbers;
  @override
  Set<int> get numbers {
    if (_numbers is EqualUnmodifiableSetView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_numbers);
  }

  final Set<int> _specialNumbers;
  @override
  Set<int> get specialNumbers {
    if (_specialNumbers is EqualUnmodifiableSetView) return _specialNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_specialNumbers);
  }

  @override
  final String? drawnAt;

  @override
  String toString() {
    return 'GridModel(numbers: $numbers, specialNumbers: $specialNumbers, drawnAt: $drawnAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GridModelImpl &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality()
                .equals(other._specialNumbers, _specialNumbers) &&
            (identical(other.drawnAt, drawnAt) || other.drawnAt == drawnAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_specialNumbers),
      drawnAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GridModelImplCopyWith<_$GridModelImpl> get copyWith =>
      __$$GridModelImplCopyWithImpl<_$GridModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GridModelImplToJson(
      this,
    );
  }
}

abstract class _GridModel implements GridModel {
  const factory _GridModel(
      {required final Set<int> numbers,
      required final Set<int> specialNumbers,
      final String? drawnAt}) = _$GridModelImpl;

  factory _GridModel.fromJson(Map<String, dynamic> json) =
      _$GridModelImpl.fromJson;

  @override
  Set<int> get numbers;
  @override
  Set<int> get specialNumbers;
  @override
  String? get drawnAt;
  @override
  @JsonKey(ignore: true)
  _$$GridModelImplCopyWith<_$GridModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
