import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_saathi/shared/models/field_model.dart';
import 'package:kisan_saathi/shared/services/firebase_service.dart';
import 'package:logger/logger.dart';

class FieldRepository {
  final FirebaseFirestore _firestore = FirebaseService.instance.firestore;
  final Logger _logger = Logger();

  // Get all fields for a user
  Stream<List<FieldModel>> getFieldsStream(String userId) {
    try {
      return _firestore
          .collection('fields')
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          final data = doc.data();
          return FieldModel.fromJson({
            ...data,
            'id': doc.id,
            'createdAt': (data['createdAt'] as Timestamp?)?.toDate().toIso8601String(),
            'updatedAt': (data['updatedAt'] as Timestamp?)?.toDate().toIso8601String(),
          });
        }).toList();
      });
    } catch (e) {
      _logger.e('Get fields stream error: $e');
      return Stream.value([]);
    }
  }

  // Get single field
  Future<FieldModel?> getField(String fieldId) async {
    try {
      final doc = await _firestore.collection('fields').doc(fieldId).get();
      if (doc.exists) {
        final data = doc.data()!;
        return FieldModel.fromJson({
          ...data,
          'id': doc.id,
          'createdAt': (data['createdAt'] as Timestamp?)?.toDate().toIso8601String(),
          'updatedAt': (data['updatedAt'] as Timestamp?)?.toDate().toIso8601String(),
        });
      }
      return null;
    } catch (e) {
      _logger.e('Get field error: $e');
      return null;
    }
  }

  // Add new field
  Future<String?> addField(FieldModel field) async {
    try {
      final docRef = await _firestore.collection('fields').add({
        'userId': field.userId,
        'name': field.name,
        'area': field.area,
        'areaUnit': field.areaUnit,
        'soilType': field.soilType,
        'latitude': field.latitude,
        'longitude': field.longitude,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      _logger.i('Field added: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      _logger.e('Add field error: $e');
      return null;
    }
  }

  // Update field
  Future<bool> updateField(FieldModel field) async {
    try {
      await _firestore.collection('fields').doc(field.id).update({
        'name': field.name,
        'area': field.area,
        'areaUnit': field.areaUnit,
        'soilType': field.soilType,
        'latitude': field.latitude,
        'longitude': field.longitude,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      _logger.i('Field updated: ${field.id}');
      return true;
    } catch (e) {
      _logger.e('Update field error: $e');
      return false;
    }
  }

  // Delete field
  Future<bool> deleteField(String fieldId) async {
    try {
      // Also delete associated crops
      final crops = await _firestore
          .collection('crops')
          .where('fieldId', isEqualTo: fieldId)
          .get();
      
      final batch = _firestore.batch();
      for (var doc in crops.docs) {
        batch.delete(doc.reference);
      }
      batch.delete(_firestore.collection('fields').doc(fieldId));
      
      await batch.commit();
      _logger.i('Field deleted: $fieldId');
      return true;
    } catch (e) {
      _logger.e('Delete field error: $e');
      return false;
    }
  }
}
