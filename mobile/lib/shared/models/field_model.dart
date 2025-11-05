import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'field_model.freezed.dart';
part 'field_model.g.dart';

@freezed
@HiveType(typeId: 1)
class FieldModel with _$FieldModel {
  const factory FieldModel({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String name,
    @HiveField(3) required double area,
    @HiveField(4) @Default('hectare') String areaUnit,
    @HiveField(5) String? soilType,
    @HiveField(6) double? latitude,
    @HiveField(7) double? longitude,
    @HiveField(8) DateTime? createdAt,
    @HiveField(9) DateTime? updatedAt,
  }) = _FieldModel;

  factory FieldModel.fromJson(Map<String, dynamic> json) =>
      _$FieldModelFromJson(json);
}
