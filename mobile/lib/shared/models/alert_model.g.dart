// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlertModelAdapter extends TypeAdapter<AlertModel> {
  @override
  final int typeId = 3;

  @override
  AlertModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlertModel(
      id: fields[0] as String,
      cropId: fields[1] as String,
      userId: fields[2] as String,
      title: fields[3] as String,
      message: fields[4] as String,
      type: fields[5] as AlertType,
      priority: fields[6] as AlertPriority,
      scheduledTime: fields[7] as DateTime,
      isRead: fields[8] as bool,
      isDone: fields[9] as bool,
      completedAt: fields[10] as DateTime?,
      notes: fields[11] as String?,
      createdAt: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AlertModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cropId)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.message)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.priority)
      ..writeByte(7)
      ..write(obj.scheduledTime)
      ..writeByte(8)
      ..write(obj.isRead)
      ..writeByte(9)
      ..write(obj.isDone)
      ..writeByte(10)
      ..write(obj.completedAt)
      ..writeByte(11)
      ..write(obj.notes)
      ..writeByte(12)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlertModelImpl _$$AlertModelImplFromJson(Map<String, dynamic> json) =>
    _$AlertModelImpl(
      id: json['id'] as String,
      cropId: json['cropId'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: $enumDecode(_$AlertTypeEnumMap, json['type']),
      priority: $enumDecode(_$AlertPriorityEnumMap, json['priority']),
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      isRead: json['isRead'] as bool? ?? false,
      isDone: json['isDone'] as bool? ?? false,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AlertModelImplToJson(_$AlertModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cropId': instance.cropId,
      'userId': instance.userId,
      'title': instance.title,
      'message': instance.message,
      'type': _$AlertTypeEnumMap[instance.type]!,
      'priority': _$AlertPriorityEnumMap[instance.priority]!,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'isRead': instance.isRead,
      'isDone': instance.isDone,
      'completedAt': instance.completedAt?.toIso8601String(),
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$AlertTypeEnumMap = {
  AlertType.irrigation: 'irrigation',
  AlertType.fertilizer: 'fertilizer',
  AlertType.pest: 'pest',
  AlertType.disease: 'disease',
  AlertType.weed: 'weed',
  AlertType.stage: 'stage',
  AlertType.harvest: 'harvest',
};

const _$AlertPriorityEnumMap = {
  AlertPriority.low: 'low',
  AlertPriority.medium: 'medium',
  AlertPriority.high: 'high',
  AlertPriority.urgent: 'urgent',
};
