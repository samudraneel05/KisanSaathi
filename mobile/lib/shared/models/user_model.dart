import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@HiveType(typeId: 0)
class UserModel with _$UserModel {
  const factory UserModel({
    @HiveField(0) required String id,
    @HiveField(1) required String phoneNumber,
    @HiveField(2) String? name,
    @HiveField(3) String? region,
    @HiveField(4) double? latitude,
    @HiveField(5) double? longitude,
    @HiveField(6) List<String>? preferredCrops,
    @HiveField(7) @Default(false) bool isGuest,
    @HiveField(8) DateTime? createdAt,
    @HiveField(9) DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
