// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CropModel _$CropModelFromJson(Map<String, dynamic> json) {
  return _CropModel.fromJson(json);
}

/// @nodoc
mixin _$CropModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get fieldId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get cropType => throw _privateConstructorUsedError;
  @HiveField(3)
  String get seedVariety => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get sowingDate => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get irrigationType => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get currentStage => throw _privateConstructorUsedError;
  @HiveField(7)
  int? get currentStageDays => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime? get expectedHarvestDate => throw _privateConstructorUsedError;
  @HiveField(9)
  String get status => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CropModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CropModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CropModelCopyWith<CropModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropModelCopyWith<$Res> {
  factory $CropModelCopyWith(CropModel value, $Res Function(CropModel) then) =
      _$CropModelCopyWithImpl<$Res, CropModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String fieldId,
      @HiveField(2) String cropType,
      @HiveField(3) String seedVariety,
      @HiveField(4) DateTime sowingDate,
      @HiveField(5) String? irrigationType,
      @HiveField(6) String? currentStage,
      @HiveField(7) int? currentStageDays,
      @HiveField(8) DateTime? expectedHarvestDate,
      @HiveField(9) String status,
      @HiveField(10) DateTime? createdAt,
      @HiveField(11) DateTime? updatedAt});
}

/// @nodoc
class _$CropModelCopyWithImpl<$Res, $Val extends CropModel>
    implements $CropModelCopyWith<$Res> {
  _$CropModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CropModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fieldId = null,
    Object? cropType = null,
    Object? seedVariety = null,
    Object? sowingDate = null,
    Object? irrigationType = freezed,
    Object? currentStage = freezed,
    Object? currentStageDays = freezed,
    Object? expectedHarvestDate = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as String,
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      seedVariety: null == seedVariety
          ? _value.seedVariety
          : seedVariety // ignore: cast_nullable_to_non_nullable
              as String,
      sowingDate: null == sowingDate
          ? _value.sowingDate
          : sowingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      irrigationType: freezed == irrigationType
          ? _value.irrigationType
          : irrigationType // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStage: freezed == currentStage
          ? _value.currentStage
          : currentStage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStageDays: freezed == currentStageDays
          ? _value.currentStageDays
          : currentStageDays // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedHarvestDate: freezed == expectedHarvestDate
          ? _value.expectedHarvestDate
          : expectedHarvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$CropModelImplCopyWith<$Res>
    implements $CropModelCopyWith<$Res> {
  factory _$$CropModelImplCopyWith(
          _$CropModelImpl value, $Res Function(_$CropModelImpl) then) =
      __$$CropModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String fieldId,
      @HiveField(2) String cropType,
      @HiveField(3) String seedVariety,
      @HiveField(4) DateTime sowingDate,
      @HiveField(5) String? irrigationType,
      @HiveField(6) String? currentStage,
      @HiveField(7) int? currentStageDays,
      @HiveField(8) DateTime? expectedHarvestDate,
      @HiveField(9) String status,
      @HiveField(10) DateTime? createdAt,
      @HiveField(11) DateTime? updatedAt});
}

/// @nodoc
class __$$CropModelImplCopyWithImpl<$Res>
    extends _$CropModelCopyWithImpl<$Res, _$CropModelImpl>
    implements _$$CropModelImplCopyWith<$Res> {
  __$$CropModelImplCopyWithImpl(
      _$CropModelImpl _value, $Res Function(_$CropModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CropModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fieldId = null,
    Object? cropType = null,
    Object? seedVariety = null,
    Object? sowingDate = null,
    Object? irrigationType = freezed,
    Object? currentStage = freezed,
    Object? currentStageDays = freezed,
    Object? expectedHarvestDate = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CropModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as String,
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      seedVariety: null == seedVariety
          ? _value.seedVariety
          : seedVariety // ignore: cast_nullable_to_non_nullable
              as String,
      sowingDate: null == sowingDate
          ? _value.sowingDate
          : sowingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      irrigationType: freezed == irrigationType
          ? _value.irrigationType
          : irrigationType // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStage: freezed == currentStage
          ? _value.currentStage
          : currentStage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStageDays: freezed == currentStageDays
          ? _value.currentStageDays
          : currentStageDays // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedHarvestDate: freezed == expectedHarvestDate
          ? _value.expectedHarvestDate
          : expectedHarvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$CropModelImpl implements _CropModel {
  const _$CropModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.fieldId,
      @HiveField(2) required this.cropType,
      @HiveField(3) required this.seedVariety,
      @HiveField(4) required this.sowingDate,
      @HiveField(5) this.irrigationType,
      @HiveField(6) this.currentStage,
      @HiveField(7) this.currentStageDays,
      @HiveField(8) this.expectedHarvestDate,
      @HiveField(9) this.status = 'active',
      @HiveField(10) this.createdAt,
      @HiveField(11) this.updatedAt});

  factory _$CropModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String fieldId;
  @override
  @HiveField(2)
  final String cropType;
  @override
  @HiveField(3)
  final String seedVariety;
  @override
  @HiveField(4)
  final DateTime sowingDate;
  @override
  @HiveField(5)
  final String? irrigationType;
  @override
  @HiveField(6)
  final String? currentStage;
  @override
  @HiveField(7)
  final int? currentStageDays;
  @override
  @HiveField(8)
  final DateTime? expectedHarvestDate;
  @override
  @JsonKey()
  @HiveField(9)
  final String status;
  @override
  @HiveField(10)
  final DateTime? createdAt;
  @override
  @HiveField(11)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CropModel(id: $id, fieldId: $fieldId, cropType: $cropType, seedVariety: $seedVariety, sowingDate: $sowingDate, irrigationType: $irrigationType, currentStage: $currentStage, currentStageDays: $currentStageDays, expectedHarvestDate: $expectedHarvestDate, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fieldId, fieldId) || other.fieldId == fieldId) &&
            (identical(other.cropType, cropType) ||
                other.cropType == cropType) &&
            (identical(other.seedVariety, seedVariety) ||
                other.seedVariety == seedVariety) &&
            (identical(other.sowingDate, sowingDate) ||
                other.sowingDate == sowingDate) &&
            (identical(other.irrigationType, irrigationType) ||
                other.irrigationType == irrigationType) &&
            (identical(other.currentStage, currentStage) ||
                other.currentStage == currentStage) &&
            (identical(other.currentStageDays, currentStageDays) ||
                other.currentStageDays == currentStageDays) &&
            (identical(other.expectedHarvestDate, expectedHarvestDate) ||
                other.expectedHarvestDate == expectedHarvestDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fieldId,
      cropType,
      seedVariety,
      sowingDate,
      irrigationType,
      currentStage,
      currentStageDays,
      expectedHarvestDate,
      status,
      createdAt,
      updatedAt);

  /// Create a copy of CropModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CropModelImplCopyWith<_$CropModelImpl> get copyWith =>
      __$$CropModelImplCopyWithImpl<_$CropModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropModelImplToJson(
      this,
    );
  }
}

abstract class _CropModel implements CropModel {
  const factory _CropModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String fieldId,
      @HiveField(2) required final String cropType,
      @HiveField(3) required final String seedVariety,
      @HiveField(4) required final DateTime sowingDate,
      @HiveField(5) final String? irrigationType,
      @HiveField(6) final String? currentStage,
      @HiveField(7) final int? currentStageDays,
      @HiveField(8) final DateTime? expectedHarvestDate,
      @HiveField(9) final String status,
      @HiveField(10) final DateTime? createdAt,
      @HiveField(11) final DateTime? updatedAt}) = _$CropModelImpl;

  factory _CropModel.fromJson(Map<String, dynamic> json) =
      _$CropModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get fieldId;
  @override
  @HiveField(2)
  String get cropType;
  @override
  @HiveField(3)
  String get seedVariety;
  @override
  @HiveField(4)
  DateTime get sowingDate;
  @override
  @HiveField(5)
  String? get irrigationType;
  @override
  @HiveField(6)
  String? get currentStage;
  @override
  @HiveField(7)
  int? get currentStageDays;
  @override
  @HiveField(8)
  DateTime? get expectedHarvestDate;
  @override
  @HiveField(9)
  String get status;
  @override
  @HiveField(10)
  DateTime? get createdAt;
  @override
  @HiveField(11)
  DateTime? get updatedAt;

  /// Create a copy of CropModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CropModelImplCopyWith<_$CropModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
