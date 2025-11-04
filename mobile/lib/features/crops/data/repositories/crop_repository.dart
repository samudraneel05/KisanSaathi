import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_saathi/shared/models/crop_model.dart';
import 'package:kisan_saathi/shared/services/firebase_service.dart';
import 'package:logger/logger.dart';

class CropRepository {
  final FirebaseFirestore _firestore = FirebaseService.instance.firestore;
  final Logger _logger = Logger();

  // Get all crops for a field
  Stream<List<CropModel>> getCropsForFieldStream(String fieldId) {
    try {
      return _firestore
          .collection('crops')
          .where('fieldId', isEqualTo: fieldId)
          .snapshots()
          .map((snapshot) {
        // Filter active crops and sort in memory
        final crops = snapshot.docs
            .map((doc) {
              final data = doc.data();
              return CropModel.fromJson({
                ...data,
                'id': doc.id,
                'sowingDate': (data['sowingDate'] as Timestamp?)?.toDate().toIso8601String(),
                'expectedHarvestDate': (data['expectedHarvestDate'] as Timestamp?)?.toDate().toIso8601String(),
                'createdAt': (data['createdAt'] as Timestamp?)?.toDate().toIso8601String(),
                'updatedAt': (data['updatedAt'] as Timestamp?)?.toDate().toIso8601String(),
              });
            })
            .where((crop) => crop.status == 'active')
            .toList();
        
        // Sort by createdAt in memory
        crops.sort((a, b) {
          if (a.createdAt == null || b.createdAt == null) return 0;
          return b.createdAt!.compareTo(a.createdAt!);
        });
        
        return crops;
      });
    } catch (e) {
      _logger.e('Get crops stream error: $e');
      return Stream.value([]);
    }
  }

  // Get all crops for a user
  Stream<List<CropModel>> getCropsForUserStream(String userId) {
    try {
      return _firestore
          .collection('crops')
          .snapshots()
          .asyncMap((snapshot) async {
        final crops = <CropModel>[];
        for (var doc in snapshot.docs) {
          final data = doc.data();
          
          // Only process active crops
          if (data['status'] != 'active') continue;
          
          // Check if field belongs to user
          final fieldId = data['fieldId'];
          final fieldDoc = await _firestore.collection('fields').doc(fieldId).get();
          if (fieldDoc.exists && fieldDoc.data()?['userId'] == userId) {
            crops.add(CropModel.fromJson({
              ...data,
              'id': doc.id,
              'sowingDate': (data['sowingDate'] as Timestamp?)?.toDate().toIso8601String(),
              'expectedHarvestDate': (data['expectedHarvestDate'] as Timestamp?)?.toDate().toIso8601String(),
              'createdAt': (data['createdAt'] as Timestamp?)?.toDate().toIso8601String(),
              'updatedAt': (data['updatedAt'] as Timestamp?)?.toDate().toIso8601String(),
            }));
          }
        }
        
        // Sort by createdAt in memory
        crops.sort((a, b) {
          if (a.createdAt == null || b.createdAt == null) return 0;
          return b.createdAt!.compareTo(a.createdAt!);
        });
        
        return crops;
      });
    } catch (e) {
      _logger.e('Get user crops stream error: $e');
      return Stream.value([]);
    }
  }

  // Get single crop
  Future<CropModel?> getCrop(String cropId) async {
    try {
      final doc = await _firestore.collection('crops').doc(cropId).get();
      if (doc.exists) {
        final data = doc.data()!;
        return CropModel.fromJson({
          ...data,
          'id': doc.id,
          'sowingDate': (data['sowingDate'] as Timestamp?)?.toDate().toIso8601String(),
          'expectedHarvestDate': (data['expectedHarvestDate'] as Timestamp?)?.toDate().toIso8601String(),
          'createdAt': (data['createdAt'] as Timestamp?)?.toDate().toIso8601String(),
          'updatedAt': (data['updatedAt'] as Timestamp?)?.toDate().toIso8601String(),
        });
      }
      return null;
    } catch (e) {
      _logger.e('Get crop error: $e');
      return null;
    }
  }

  // Add new crop
  Future<String?> addCrop(CropModel crop) async {
    try {
      final docRef = await _firestore.collection('crops').add({
        'fieldId': crop.fieldId,
        'cropType': crop.cropType,
        'seedVariety': crop.seedVariety,
        'sowingDate': Timestamp.fromDate(crop.sowingDate),
        'irrigationType': crop.irrigationType,
        'currentStage': crop.currentStage ?? 'Germination',
        'currentStageDays': crop.currentStageDays ?? 0,
        'expectedHarvestDate': crop.expectedHarvestDate != null
            ? Timestamp.fromDate(crop.expectedHarvestDate!)
            : null,
        'status': crop.status,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      _logger.i('Crop added: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      _logger.e('Add crop error: $e');
      return null;
    }
  }

  // Update crop
  Future<bool> updateCrop(CropModel crop) async {
    try {
      await _firestore.collection('crops').doc(crop.id).update({
        'cropType': crop.cropType,
        'seedVariety': crop.seedVariety,
        'sowingDate': Timestamp.fromDate(crop.sowingDate),
        'irrigationType': crop.irrigationType,
        'currentStage': crop.currentStage,
        'currentStageDays': crop.currentStageDays,
        'expectedHarvestDate': crop.expectedHarvestDate != null
            ? Timestamp.fromDate(crop.expectedHarvestDate!)
            : null,
        'status': crop.status,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      _logger.i('Crop updated: ${crop.id}');
      return true;
    } catch (e) {
      _logger.e('Update crop error: $e');
      return false;
    }
  }

  // Delete crop (mark as inactive)
  Future<bool> deleteCrop(String cropId) async {
    try {
      await _firestore.collection('crops').doc(cropId).update({
        'status': 'inactive',
        'updatedAt': FieldValue.serverTimestamp(),
      });
      _logger.i('Crop deleted: $cropId');
      return true;
    } catch (e) {
      _logger.e('Delete crop error: $e');
      return false;
    }
  }

  // Calculate expected harvest date based on crop type
  DateTime calculateHarvestDate(String cropType, DateTime sowingDate) {
    // Default durations in days for common crops
    final durations = {
      'Wheat': 130,
      'Rice': 120,
      'Mustard': 100,
      'Sugarcane': 365,
      'Cotton': 180,
      'Maize': 90,
      'Potato': 90,
      'Tomato': 80,
    };
    
    final duration = durations[cropType] ?? 120;
    return sowingDate.add(Duration(days: duration));
  }
}
