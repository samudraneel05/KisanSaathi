import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_saathi/features/crops/data/repositories/crop_repository.dart';
import 'package:kisan_saathi/shared/models/crop_model.dart';
import 'package:kisan_saathi/shared/services/firebase_service.dart';

// Crop repository provider
final cropRepositoryProvider = Provider((ref) => CropRepository());

// Crops stream provider (all user's crops)
final cropsStreamProvider = StreamProvider<List<CropModel>>((ref) {
  final user = FirebaseService.instance.auth.currentUser;
  if (user == null) return Stream.value([]);
  
  final repository = ref.watch(cropRepositoryProvider);
  return repository.getCropsForUserStream(user.uid);
});

// Crops for specific field stream provider
final cropsForFieldStreamProvider = StreamProvider.family<List<CropModel>, String>((ref, fieldId) {
  final repository = ref.watch(cropRepositoryProvider);
  return repository.getCropsForFieldStream(fieldId);
});

// Crop controller provider
final cropControllerProvider = Provider((ref) => CropController(ref));

class CropController {
  final Ref ref;
  
  CropController(this.ref);

  Future<String?> addCrop(CropModel crop) async {
    final repository = ref.read(cropRepositoryProvider);
    return await repository.addCrop(crop);
  }

  Future<bool> updateCrop(CropModel crop) async {
    final repository = ref.read(cropRepositoryProvider);
    return await repository.updateCrop(crop);
  }

  Future<bool> deleteCrop(String cropId) async {
    final repository = ref.read(cropRepositoryProvider);
    return await repository.deleteCrop(cropId);
  }

  Future<CropModel?> getCrop(String cropId) async {
    final repository = ref.read(cropRepositoryProvider);
    return await repository.getCrop(cropId);
  }

  DateTime calculateHarvestDate(String cropType, DateTime sowingDate) {
    final repository = ref.read(cropRepositoryProvider);
    return repository.calculateHarvestDate(cropType, sowingDate);
  }
}
