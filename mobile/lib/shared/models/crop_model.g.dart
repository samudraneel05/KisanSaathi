// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CropModelAdapter extends TypeAdapter<CropModel> {
  @override
  final int typeId = 2;

  @override
  CropModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CropModel(
      id: fields[0] as String,
      fieldId: fields[1] as String,
      cropType: fields[2] as String,
      seedVariety: fields[3] as String,
      sowingDate: fields[4] as DateTime,
      irrigationType: fields[5] as String?,
      currentStage: fields[6] as String?,
      currentStageDays: fields[7] as int?,
      expectedHarvestDate: fields[8] as DateTime?,
      status: fields[9] as String,
      createdAt: fields[10] as DateTime?,
      updatedAt: fields[11] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CropModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fieldId)
      ..writeByte(2)
      ..write(obj.cropType)
      ..writeByte(3)
      ..write(obj.seedVariety)
      ..writeByte(4)
      ..write(obj.sowingDate)
      ..writeByte(5)
      ..write(obj.irrigationType)
      ..writeByte(6)
      ..write(obj.currentStage)
      ..writeByte(7)
      ..write(obj.currentStageDays)
      ..writeByte(8)
      ..write(obj.expectedHarvestDate)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CropModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CropModelImpl _$$CropModelImplFromJson(Map<String, dynamic> json) =>
    _$CropModelImpl(
      id: json['id'] as String,
      fieldId: json['fieldId'] as String,
      cropType: json['cropType'] as String,
      seedVariety: json['seedVariety'] as String,
      sowingDate: DateTime.parse(json['sowingDate'] as String),
      irrigationType: json['irrigationType'] as String?,
      currentStage: json['currentStage'] as String?,
      currentStageDays: (json['currentStageDays'] as num?)?.toInt(),
      expectedHarvestDate: json['expectedHarvestDate'] == null
          ? null
          : DateTime.parse(json['expectedHarvestDate'] as String),
      status: json['status'] as String? ?? 'active',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CropModelImplToJson(_$CropModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fieldId': instance.fieldId,
      'cropType': instance.cropType,
      'seedVariety': instance.seedVariety,
      'sowingDate': instance.sowingDate.toIso8601String(),
      'irrigationType': instance.irrigationType,
      'currentStage': instance.currentStage,
      'currentStageDays': instance.currentStageDays,
      'expectedHarvestDate': instance.expectedHarvestDate?.toIso8601String(),
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
