import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_entry_model.freezed.dart';
part 'journal_entry_model.g.dart';

@freezed
class JournalEntryModel with _$JournalEntryModel {
  const factory JournalEntryModel({
    required String id,
    required String cropId,
    required String userId,
    required DateTime date,
    String? notes,
    List<String>? photoUrls,
    double? yieldAmount,
    String? yieldUnit,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _JournalEntryModel;

  factory JournalEntryModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryModelFromJson(json);
}
