import 'package:freezed_annotation/freezed_annotation.dart';

part 'crop_stage_model.freezed.dart';
part 'crop_stage_model.g.dart';

@freezed
class CropStageModel with _$CropStageModel {
  const factory CropStageModel({
    required String id,
    required String cropType,
    required String stageName,
    required int minDays,
    required int maxDays,
    required int stageOrder,
    String? stageNotes,
    List<String>? recommendedActions,
    String? stageColor,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CropStageModel;

  factory CropStageModel.fromJson(Map<String, dynamic> json) =>
      _$CropStageModelFromJson(json);
}
