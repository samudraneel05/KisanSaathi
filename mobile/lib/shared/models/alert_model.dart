import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'alert_model.freezed.dart';
part 'alert_model.g.dart';

enum AlertType {
  irrigation,
  fertilizer,
  pest,
  disease,
  weed,
  stage,
  harvest,
}

enum AlertPriority {
  low,
  medium,
  high,
  urgent,
}

@freezed
@HiveType(typeId: 3)
class AlertModel with _$AlertModel {
  const factory AlertModel({
    @HiveField(0) required String id,
    @HiveField(1) required String cropId,
    @HiveField(2) required String userId,
    @HiveField(3) required String title,
    @HiveField(4) required String message,
    @HiveField(5) required AlertType type,
    @HiveField(6) required AlertPriority priority,
    @HiveField(7) required DateTime scheduledTime,
    @HiveField(8) @Default(false) bool isRead,
    @HiveField(9) @Default(false) bool isDone,
    @HiveField(10) DateTime? completedAt,
    @HiveField(11) String? notes,
    @HiveField(12) DateTime? createdAt,
  }) = _AlertModel;

  factory AlertModel.fromJson(Map<String, dynamic> json) =>
      _$AlertModelFromJson(json);
}
