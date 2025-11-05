import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'crop_model.freezed.dart';
part 'crop_model.g.dart';

@freezed
@HiveType(typeId: 2)
class CropModel with _$CropModel {
  const factory CropModel({
    @HiveField(0) required String id,
    @HiveField(1) required String fieldId,
    @HiveField(2) required String cropType,
    @HiveField(3) required String seedVariety,
    @HiveField(4) required DateTime sowingDate,
    @HiveField(5) String? irrigationType,
    @HiveField(6) String? currentStage,
    @HiveField(7) int? currentStageDays,
    @HiveField(8) DateTime? expectedHarvestDate,
    @HiveField(9) @Default('active') String status,
    @HiveField(10) DateTime? createdAt,
    @HiveField(11) DateTime? updatedAt,
  }) = _CropModel;

  factory CropModel.fromJson(Map<String, dynamic> json) =>
      _$CropModelFromJson(json);
}
