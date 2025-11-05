// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_stage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CropStageModel _$CropStageModelFromJson(Map<String, dynamic> json) {
  return _CropStageModel.fromJson(json);
}

/// @nodoc
mixin _$CropStageModel {
  String get id => throw _privateConstructorUsedError;
  String get cropType => throw _privateConstructorUsedError;
  String get stageName => throw _privateConstructorUsedError;
  int get minDays => throw _privateConstructorUsedError;
  int get maxDays => throw _privateConstructorUsedError;
  int get stageOrder => throw _privateConstructorUsedError;
  String? get stageNotes => throw _privateConstructorUsedError;
  List<String>? get recommendedActions => throw _privateConstructorUsedError;
  String? get stageColor => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CropStageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CropStageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CropStageModelCopyWith<CropStageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropStageModelCopyWith<$Res> {
  factory $CropStageModelCopyWith(
          CropStageModel value, $Res Function(CropStageModel) then) =
      _$CropStageModelCopyWithImpl<$Res, CropStageModel>;
  @useResult
  $Res call(
      {String id,
      String cropType,
      String stageName,
      int minDays,
      int maxDays,
      int stageOrder,
      String? stageNotes,
      List<String>? recommendedActions,
      String? stageColor,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CropStageModelCopyWithImpl<$Res, $Val extends CropStageModel>
    implements $CropStageModelCopyWith<$Res> {
  _$CropStageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CropStageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cropType = null,
    Object? stageName = null,
    Object? minDays = null,
    Object? maxDays = null,
    Object? stageOrder = null,
    Object? stageNotes = freezed,
    Object? recommendedActions = freezed,
    Object? stageColor = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      stageName: null == stageName
          ? _value.stageName
          : stageName // ignore: cast_nullable_to_non_nullable
              as String,
      minDays: null == minDays
          ? _value.minDays
          : minDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxDays: null == maxDays
          ? _value.maxDays
          : maxDays // ignore: cast_nullable_to_non_nullable
              as int,
      stageOrder: null == stageOrder
          ? _value.stageOrder
          : stageOrder // ignore: cast_nullable_to_non_nullable
              as int,
      stageNotes: freezed == stageNotes
          ? _value.stageNotes
          : stageNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendedActions: freezed == recommendedActions
          ? _value.recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stageColor: freezed == stageColor
          ? _value.stageColor
          : stageColor // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$CropStageModelImplCopyWith<$Res>
    implements $CropStageModelCopyWith<$Res> {
  factory _$$CropStageModelImplCopyWith(_$CropStageModelImpl value,
          $Res Function(_$CropStageModelImpl) then) =
      __$$CropStageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String cropType,
      String stageName,
      int minDays,
      int maxDays,
      int stageOrder,
      String? stageNotes,
      List<String>? recommendedActions,
      String? stageColor,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CropStageModelImplCopyWithImpl<$Res>
    extends _$CropStageModelCopyWithImpl<$Res, _$CropStageModelImpl>
    implements _$$CropStageModelImplCopyWith<$Res> {
  __$$CropStageModelImplCopyWithImpl(
      _$CropStageModelImpl _value, $Res Function(_$CropStageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CropStageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cropType = null,
    Object? stageName = null,
    Object? minDays = null,
    Object? maxDays = null,
    Object? stageOrder = null,
    Object? stageNotes = freezed,
    Object? recommendedActions = freezed,
    Object? stageColor = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CropStageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      stageName: null == stageName
          ? _value.stageName
          : stageName // ignore: cast_nullable_to_non_nullable
              as String,
      minDays: null == minDays
          ? _value.minDays
          : minDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxDays: null == maxDays
          ? _value.maxDays
          : maxDays // ignore: cast_nullable_to_non_nullable
              as int,
      stageOrder: null == stageOrder
          ? _value.stageOrder
          : stageOrder // ignore: cast_nullable_to_non_nullable
              as int,
      stageNotes: freezed == stageNotes
          ? _value.stageNotes
          : stageNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendedActions: freezed == recommendedActions
          ? _value._recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stageColor: freezed == stageColor
          ? _value.stageColor
          : stageColor // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$CropStageModelImpl implements _CropStageModel {
  const _$CropStageModelImpl(
      {required this.id,
      required this.cropType,
      required this.stageName,
      required this.minDays,
      required this.maxDays,
      required this.stageOrder,
      this.stageNotes,
      final List<String>? recommendedActions,
      this.stageColor,
      this.createdAt,
      this.updatedAt})
      : _recommendedActions = recommendedActions;

  factory _$CropStageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropStageModelImplFromJson(json);

  @override
  final String id;
  @override
  final String cropType;
  @override
  final String stageName;
  @override
  final int minDays;
  @override
  final int maxDays;
  @override
  final int stageOrder;
  @override
  final String? stageNotes;
  final List<String>? _recommendedActions;
  @override
  List<String>? get recommendedActions {
    final value = _recommendedActions;
    if (value == null) return null;
    if (_recommendedActions is EqualUnmodifiableListView)
      return _recommendedActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? stageColor;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CropStageModel(id: $id, cropType: $cropType, stageName: $stageName, minDays: $minDays, maxDays: $maxDays, stageOrder: $stageOrder, stageNotes: $stageNotes, recommendedActions: $recommendedActions, stageColor: $stageColor, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropStageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cropType, cropType) ||
                other.cropType == cropType) &&
            (identical(other.stageName, stageName) ||
                other.stageName == stageName) &&
            (identical(other.minDays, minDays) || other.minDays == minDays) &&
            (identical(other.maxDays, maxDays) || other.maxDays == maxDays) &&
            (identical(other.stageOrder, stageOrder) ||
                other.stageOrder == stageOrder) &&
            (identical(other.stageNotes, stageNotes) ||
                other.stageNotes == stageNotes) &&
            const DeepCollectionEquality()
                .equals(other._recommendedActions, _recommendedActions) &&
            (identical(other.stageColor, stageColor) ||
                other.stageColor == stageColor) &&
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
      cropType,
      stageName,
      minDays,
      maxDays,
      stageOrder,
      stageNotes,
      const DeepCollectionEquality().hash(_recommendedActions),
      stageColor,
      createdAt,
      updatedAt);

  /// Create a copy of CropStageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CropStageModelImplCopyWith<_$CropStageModelImpl> get copyWith =>
      __$$CropStageModelImplCopyWithImpl<_$CropStageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropStageModelImplToJson(
      this,
    );
  }
}

abstract class _CropStageModel implements CropStageModel {
  const factory _CropStageModel(
      {required final String id,
      required final String cropType,
      required final String stageName,
      required final int minDays,
      required final int maxDays,
      required final int stageOrder,
      final String? stageNotes,
      final List<String>? recommendedActions,
      final String? stageColor,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CropStageModelImpl;

  factory _CropStageModel.fromJson(Map<String, dynamic> json) =
      _$CropStageModelImpl.fromJson;

  @override
  String get id;
  @override
  String get cropType;
  @override
  String get stageName;
  @override
  int get minDays;
  @override
  int get maxDays;
  @override
  int get stageOrder;
  @override
  String? get stageNotes;
  @override
  List<String>? get recommendedActions;
  @override
  String? get stageColor;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CropStageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CropStageModelImplCopyWith<_$CropStageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
