// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JournalEntryModel _$JournalEntryModelFromJson(Map<String, dynamic> json) {
  return _JournalEntryModel.fromJson(json);
}

/// @nodoc
mixin _$JournalEntryModel {
  String get id => throw _privateConstructorUsedError;
  String get cropId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<String>? get photoUrls => throw _privateConstructorUsedError;
  double? get yieldAmount => throw _privateConstructorUsedError;
  String? get yieldUnit => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this JournalEntryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalEntryModelCopyWith<JournalEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryModelCopyWith<$Res> {
  factory $JournalEntryModelCopyWith(
          JournalEntryModel value, $Res Function(JournalEntryModel) then) =
      _$JournalEntryModelCopyWithImpl<$Res, JournalEntryModel>;
  @useResult
  $Res call(
      {String id,
      String cropId,
      String userId,
      DateTime date,
      String? notes,
      List<String>? photoUrls,
      double? yieldAmount,
      String? yieldUnit,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$JournalEntryModelCopyWithImpl<$Res, $Val extends JournalEntryModel>
    implements $JournalEntryModelCopyWith<$Res> {
  _$JournalEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cropId = null,
    Object? userId = null,
    Object? date = null,
    Object? notes = freezed,
    Object? photoUrls = freezed,
    Object? yieldAmount = freezed,
    Object? yieldUnit = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cropId: null == cropId
          ? _value.cropId
          : cropId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: freezed == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      yieldAmount: freezed == yieldAmount
          ? _value.yieldAmount
          : yieldAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      yieldUnit: freezed == yieldUnit
          ? _value.yieldUnit
          : yieldUnit // ignore: cast_nullable_to_non_nullable
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
abstract class _$$JournalEntryModelImplCopyWith<$Res>
    implements $JournalEntryModelCopyWith<$Res> {
  factory _$$JournalEntryModelImplCopyWith(_$JournalEntryModelImpl value,
          $Res Function(_$JournalEntryModelImpl) then) =
      __$$JournalEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String cropId,
      String userId,
      DateTime date,
      String? notes,
      List<String>? photoUrls,
      double? yieldAmount,
      String? yieldUnit,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$JournalEntryModelImplCopyWithImpl<$Res>
    extends _$JournalEntryModelCopyWithImpl<$Res, _$JournalEntryModelImpl>
    implements _$$JournalEntryModelImplCopyWith<$Res> {
  __$$JournalEntryModelImplCopyWithImpl(_$JournalEntryModelImpl _value,
      $Res Function(_$JournalEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cropId = null,
    Object? userId = null,
    Object? date = null,
    Object? notes = freezed,
    Object? photoUrls = freezed,
    Object? yieldAmount = freezed,
    Object? yieldUnit = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$JournalEntryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cropId: null == cropId
          ? _value.cropId
          : cropId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: freezed == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      yieldAmount: freezed == yieldAmount
          ? _value.yieldAmount
          : yieldAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      yieldUnit: freezed == yieldUnit
          ? _value.yieldUnit
          : yieldUnit // ignore: cast_nullable_to_non_nullable
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
class _$JournalEntryModelImpl implements _JournalEntryModel {
  const _$JournalEntryModelImpl(
      {required this.id,
      required this.cropId,
      required this.userId,
      required this.date,
      this.notes,
      final List<String>? photoUrls,
      this.yieldAmount,
      this.yieldUnit,
      this.createdAt,
      this.updatedAt})
      : _photoUrls = photoUrls;

  factory _$JournalEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalEntryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String cropId;
  @override
  final String userId;
  @override
  final DateTime date;
  @override
  final String? notes;
  final List<String>? _photoUrls;
  @override
  List<String>? get photoUrls {
    final value = _photoUrls;
    if (value == null) return null;
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? yieldAmount;
  @override
  final String? yieldUnit;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'JournalEntryModel(id: $id, cropId: $cropId, userId: $userId, date: $date, notes: $notes, photoUrls: $photoUrls, yieldAmount: $yieldAmount, yieldUnit: $yieldUnit, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cropId, cropId) || other.cropId == cropId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._photoUrls, _photoUrls) &&
            (identical(other.yieldAmount, yieldAmount) ||
                other.yieldAmount == yieldAmount) &&
            (identical(other.yieldUnit, yieldUnit) ||
                other.yieldUnit == yieldUnit) &&
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
      cropId,
      userId,
      date,
      notes,
      const DeepCollectionEquality().hash(_photoUrls),
      yieldAmount,
      yieldUnit,
      createdAt,
      updatedAt);

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEntryModelImplCopyWith<_$JournalEntryModelImpl> get copyWith =>
      __$$JournalEntryModelImplCopyWithImpl<_$JournalEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalEntryModelImplToJson(
      this,
    );
  }
}

abstract class _JournalEntryModel implements JournalEntryModel {
  const factory _JournalEntryModel(
      {required final String id,
      required final String cropId,
      required final String userId,
      required final DateTime date,
      final String? notes,
      final List<String>? photoUrls,
      final double? yieldAmount,
      final String? yieldUnit,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$JournalEntryModelImpl;

  factory _JournalEntryModel.fromJson(Map<String, dynamic> json) =
      _$JournalEntryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get cropId;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  String? get notes;
  @override
  List<String>? get photoUrls;
  @override
  double? get yieldAmount;
  @override
  String? get yieldUnit;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalEntryModelImplCopyWith<_$JournalEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
