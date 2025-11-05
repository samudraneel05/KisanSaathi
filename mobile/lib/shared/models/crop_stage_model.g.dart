// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_stage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CropStageModelImpl _$$CropStageModelImplFromJson(Map<String, dynamic> json) =>
    _$CropStageModelImpl(
      id: json['id'] as String,
      cropType: json['cropType'] as String,
      stageName: json['stageName'] as String,
      minDays: (json['minDays'] as num).toInt(),
      maxDays: (json['maxDays'] as num).toInt(),
      stageOrder: (json['stageOrder'] as num).toInt(),
      stageNotes: json['stageNotes'] as String?,
      recommendedActions: (json['recommendedActions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stageColor: json['stageColor'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CropStageModelImplToJson(
        _$CropStageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cropType': instance.cropType,
      'stageName': instance.stageName,
      'minDays': instance.minDays,
      'maxDays': instance.maxDays,
      'stageOrder': instance.stageOrder,
      'stageNotes': instance.stageNotes,
      'recommendedActions': instance.recommendedActions,
      'stageColor': instance.stageColor,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
