// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalEntryModelImpl _$$JournalEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalEntryModelImpl(
      id: json['id'] as String,
      cropId: json['cropId'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      notes: json['notes'] as String?,
      photoUrls: (json['photoUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      yieldAmount: (json['yieldAmount'] as num?)?.toDouble(),
      yieldUnit: json['yieldUnit'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$JournalEntryModelImplToJson(
        _$JournalEntryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cropId': instance.cropId,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'notes': instance.notes,
      'photoUrls': instance.photoUrls,
      'yieldAmount': instance.yieldAmount,
      'yieldUnit': instance.yieldUnit,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
