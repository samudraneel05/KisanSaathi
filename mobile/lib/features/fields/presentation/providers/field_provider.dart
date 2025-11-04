import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_saathi/features/fields/data/repositories/field_repository.dart';
import 'package:kisan_saathi/shared/models/field_model.dart';
import 'package:kisan_saathi/shared/services/firebase_service.dart';

// Field repository provider
final fieldRepositoryProvider = Provider((ref) => FieldRepository());

// Fields stream provider
final fieldsStreamProvider = StreamProvider<List<FieldModel>>((ref) {
  final user = FirebaseService.instance.auth.currentUser;
  if (user == null) return Stream.value([]);
  
  final repository = ref.watch(fieldRepositoryProvider);
  return repository.getFieldsStream(user.uid);
});

// Field controller provider
final fieldControllerProvider = Provider((ref) => FieldController(ref));

class FieldController {
  final Ref ref;
  
  FieldController(this.ref);

  Future<String?> addField(FieldModel field) async {
    final repository = ref.read(fieldRepositoryProvider);
    return await repository.addField(field);
  }

  Future<bool> updateField(FieldModel field) async {
    final repository = ref.read(fieldRepositoryProvider);
    return await repository.updateField(field);
  }

  Future<bool> deleteField(String fieldId) async {
    final repository = ref.read(fieldRepositoryProvider);
    return await repository.deleteField(fieldId);
  }

  Future<FieldModel?> getField(String fieldId) async {
    final repository = ref.read(fieldRepositoryProvider);
    return await repository.getField(fieldId);
  }
}
