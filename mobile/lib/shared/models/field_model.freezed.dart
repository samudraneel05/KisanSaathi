// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FieldModel _$FieldModelFromJson(Map<String, dynamic> json) {
  return _FieldModel.fromJson(json);
}

/// @nodoc
mixin _$FieldModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  double get area => throw _privateConstructorUsedError;
  @HiveField(4)
  String get areaUnit => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get soilType => throw _privateConstructorUsedError;
  @HiveField(6)
  double? get latitude => throw _privateConstructorUsedError;
  @HiveField(7)
  double? get longitude => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(9)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FieldModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FieldModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldModelCopyWith<FieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldModelCopyWith<$Res> {
  factory $FieldModelCopyWith(
          FieldModel value, $Res Function(FieldModel) then) =
      _$FieldModelCopyWithImpl<$Res, FieldModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String name,
      @HiveField(3) double area,
      @HiveField(4) String areaUnit,
      @HiveField(5) String? soilType,
      @HiveField(6) double? latitude,
      @HiveField(7) double? longitude,
      @HiveField(8) DateTime? createdAt,
      @HiveField(9) DateTime? updatedAt});
}

/// @nodoc
class _$FieldModelCopyWithImpl<$Res, $Val extends FieldModel>
    implements $FieldModelCopyWith<$Res> {
  _$FieldModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FieldModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? area = null,
    Object? areaUnit = null,
    Object? soilType = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      areaUnit: null == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String,
      soilType: freezed == soilType
          ? _value.soilType
          : soilType // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldModelImplCopyWith<$Res>
    implements $FieldModelCopyWith<$Res> {
  factory _$$FieldModelImplCopyWith(
          _$FieldModelImpl value, $Res Function(_$FieldModelImpl) then) =
      __$$FieldModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String name,
      @HiveField(3) double area,
      @HiveField(4) String areaUnit,
      @HiveField(5) String? soilType,
      @HiveField(6) double? latitude,
      @HiveField(7) double? longitude,
      @HiveField(8) DateTime? createdAt,
      @HiveField(9) DateTime? updatedAt});
}

/// @nodoc
class __$$FieldModelImplCopyWithImpl<$Res>
    extends _$FieldModelCopyWithImpl<$Res, _$FieldModelImpl>
    implements _$$FieldModelImplCopyWith<$Res> {
  __$$FieldModelImplCopyWithImpl(
      _$FieldModelImpl _value, $Res Function(_$FieldModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FieldModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? area = null,
    Object? areaUnit = null,
    Object? soilType = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FieldModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      areaUnit: null == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String,
      soilType: freezed == soilType
          ? _value.soilType
          : soilType // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldModelImpl implements _FieldModel {
  const _$FieldModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.name,
      @HiveField(3) required this.area,
      @HiveField(4) this.areaUnit = 'hectare',
      @HiveField(5) this.soilType,
      @HiveField(6) this.latitude,
      @HiveField(7) this.longitude,
      @HiveField(8) this.createdAt,
      @HiveField(9) this.updatedAt});

  factory _$FieldModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  final double area;
  @override
  @JsonKey()
  @HiveField(4)
  final String areaUnit;
  @override
  @HiveField(5)
  final String? soilType;
  @override
  @HiveField(6)
  final double? latitude;
  @override
  @HiveField(7)
  final double? longitude;
  @override
  @HiveField(8)
  final DateTime? createdAt;
  @override
  @HiveField(9)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'FieldModel(id: $id, userId: $userId, name: $name, area: $area, areaUnit: $areaUnit, soilType: $soilType, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit) &&
            (identical(other.soilType, soilType) ||
                other.soilType == soilType) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, area, areaUnit,
      soilType, latitude, longitude, createdAt, updatedAt);

  /// Create a copy of FieldModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldModelImplCopyWith<_$FieldModelImpl> get copyWith =>
      __$$FieldModelImplCopyWithImpl<_$FieldModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldModelImplToJson(
      this,
    );
  }
}

abstract class _FieldModel implements FieldModel {
  const factory _FieldModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String userId,
      @HiveField(2) required final String name,
      @HiveField(3) required final double area,
      @HiveField(4) final String areaUnit,
      @HiveField(5) final String? soilType,
      @HiveField(6) final double? latitude,
      @HiveField(7) final double? longitude,
      @HiveField(8) final DateTime? createdAt,
      @HiveField(9) final DateTime? updatedAt}) = _$FieldModelImpl;

  factory _FieldModel.fromJson(Map<String, dynamic> json) =
      _$FieldModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get userId;
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  double get area;
  @override
  @HiveField(4)
  String get areaUnit;
  @override
  @HiveField(5)
  String? get soilType;
  @override
  @HiveField(6)
  double? get latitude;
  @override
  @HiveField(7)
  double? get longitude;
  @override
  @HiveField(8)
  DateTime? get createdAt;
  @override
  @HiveField(9)
  DateTime? get updatedAt;

  /// Create a copy of FieldModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldModelImplCopyWith<_$FieldModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
