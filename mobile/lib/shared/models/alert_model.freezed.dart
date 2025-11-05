// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlertModel _$AlertModelFromJson(Map<String, dynamic> json) {
  return _AlertModel.fromJson(json);
}

/// @nodoc
mixin _$AlertModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get cropId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(3)
  String get title => throw _privateConstructorUsedError;
  @HiveField(4)
  String get message => throw _privateConstructorUsedError;
  @HiveField(5)
  AlertType get type => throw _privateConstructorUsedError;
  @HiveField(6)
  AlertPriority get priority => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get isRead => throw _privateConstructorUsedError;
  @HiveField(9)
  bool get isDone => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get notes => throw _privateConstructorUsedError;
  @HiveField(12)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AlertModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlertModelCopyWith<AlertModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertModelCopyWith<$Res> {
  factory $AlertModelCopyWith(
          AlertModel value, $Res Function(AlertModel) then) =
      _$AlertModelCopyWithImpl<$Res, AlertModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String cropId,
      @HiveField(2) String userId,
      @HiveField(3) String title,
      @HiveField(4) String message,
      @HiveField(5) AlertType type,
      @HiveField(6) AlertPriority priority,
      @HiveField(7) DateTime scheduledTime,
      @HiveField(8) bool isRead,
      @HiveField(9) bool isDone,
      @HiveField(10) DateTime? completedAt,
      @HiveField(11) String? notes,
      @HiveField(12) DateTime? createdAt});
}

/// @nodoc
class _$AlertModelCopyWithImpl<$Res, $Val extends AlertModel>
    implements $AlertModelCopyWith<$Res> {
  _$AlertModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cropId = null,
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? priority = null,
    Object? scheduledTime = null,
    Object? isRead = null,
    Object? isDone = null,
    Object? completedAt = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AlertPriority,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertModelImplCopyWith<$Res>
    implements $AlertModelCopyWith<$Res> {
  factory _$$AlertModelImplCopyWith(
          _$AlertModelImpl value, $Res Function(_$AlertModelImpl) then) =
      __$$AlertModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String cropId,
      @HiveField(2) String userId,
      @HiveField(3) String title,
      @HiveField(4) String message,
      @HiveField(5) AlertType type,
      @HiveField(6) AlertPriority priority,
      @HiveField(7) DateTime scheduledTime,
      @HiveField(8) bool isRead,
      @HiveField(9) bool isDone,
      @HiveField(10) DateTime? completedAt,
      @HiveField(11) String? notes,
      @HiveField(12) DateTime? createdAt});
}

/// @nodoc
class __$$AlertModelImplCopyWithImpl<$Res>
    extends _$AlertModelCopyWithImpl<$Res, _$AlertModelImpl>
    implements _$$AlertModelImplCopyWith<$Res> {
  __$$AlertModelImplCopyWithImpl(
      _$AlertModelImpl _value, $Res Function(_$AlertModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cropId = null,
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? priority = null,
    Object? scheduledTime = null,
    Object? isRead = null,
    Object? isDone = null,
    Object? completedAt = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AlertModelImpl(
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AlertPriority,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlertModelImpl implements _AlertModel {
  const _$AlertModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.cropId,
      @HiveField(2) required this.userId,
      @HiveField(3) required this.title,
      @HiveField(4) required this.message,
      @HiveField(5) required this.type,
      @HiveField(6) required this.priority,
      @HiveField(7) required this.scheduledTime,
      @HiveField(8) this.isRead = false,
      @HiveField(9) this.isDone = false,
      @HiveField(10) this.completedAt,
      @HiveField(11) this.notes,
      @HiveField(12) this.createdAt});

  factory _$AlertModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String cropId;
  @override
  @HiveField(2)
  final String userId;
  @override
  @HiveField(3)
  final String title;
  @override
  @HiveField(4)
  final String message;
  @override
  @HiveField(5)
  final AlertType type;
  @override
  @HiveField(6)
  final AlertPriority priority;
  @override
  @HiveField(7)
  final DateTime scheduledTime;
  @override
  @JsonKey()
  @HiveField(8)
  final bool isRead;
  @override
  @JsonKey()
  @HiveField(9)
  final bool isDone;
  @override
  @HiveField(10)
  final DateTime? completedAt;
  @override
  @HiveField(11)
  final String? notes;
  @override
  @HiveField(12)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AlertModel(id: $id, cropId: $cropId, userId: $userId, title: $title, message: $message, type: $type, priority: $priority, scheduledTime: $scheduledTime, isRead: $isRead, isDone: $isDone, completedAt: $completedAt, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cropId, cropId) || other.cropId == cropId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      cropId,
      userId,
      title,
      message,
      type,
      priority,
      scheduledTime,
      isRead,
      isDone,
      completedAt,
      notes,
      createdAt);

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertModelImplCopyWith<_$AlertModelImpl> get copyWith =>
      __$$AlertModelImplCopyWithImpl<_$AlertModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertModelImplToJson(
      this,
    );
  }
}

abstract class _AlertModel implements AlertModel {
  const factory _AlertModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String cropId,
      @HiveField(2) required final String userId,
      @HiveField(3) required final String title,
      @HiveField(4) required final String message,
      @HiveField(5) required final AlertType type,
      @HiveField(6) required final AlertPriority priority,
      @HiveField(7) required final DateTime scheduledTime,
      @HiveField(8) final bool isRead,
      @HiveField(9) final bool isDone,
      @HiveField(10) final DateTime? completedAt,
      @HiveField(11) final String? notes,
      @HiveField(12) final DateTime? createdAt}) = _$AlertModelImpl;

  factory _AlertModel.fromJson(Map<String, dynamic> json) =
      _$AlertModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get cropId;
  @override
  @HiveField(2)
  String get userId;
  @override
  @HiveField(3)
  String get title;
  @override
  @HiveField(4)
  String get message;
  @override
  @HiveField(5)
  AlertType get type;
  @override
  @HiveField(6)
  AlertPriority get priority;
  @override
  @HiveField(7)
  DateTime get scheduledTime;
  @override
  @HiveField(8)
  bool get isRead;
  @override
  @HiveField(9)
  bool get isDone;
  @override
  @HiveField(10)
  DateTime? get completedAt;
  @override
  @HiveField(11)
  String? get notes;
  @override
  @HiveField(12)
  DateTime? get createdAt;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlertModelImplCopyWith<_$AlertModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
