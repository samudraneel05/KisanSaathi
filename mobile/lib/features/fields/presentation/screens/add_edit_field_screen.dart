import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_saathi/core/constants/app_colors.dart';
import 'package:kisan_saathi/core/localization/app_localizations.dart';
import 'package:kisan_saathi/features/fields/presentation/providers/field_provider.dart';
import 'package:kisan_saathi/shared/models/field_model.dart';
import 'package:kisan_saathi/shared/services/firebase_service.dart';
import 'package:uuid/uuid.dart';
import 'package:geolocator/geolocator.dart';

class AddEditFieldScreen extends ConsumerStatefulWidget {
  final FieldModel? field;

  const AddEditFieldScreen({super.key, this.field});

  @override
  ConsumerState<AddEditFieldScreen> createState() => _AddEditFieldScreenState();
}

class _AddEditFieldScreenState extends ConsumerState<AddEditFieldScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _areaController;
  late TextEditingController _soilTypeController;
  
  String _selectedAreaUnit = 'hectare';
  Position? _currentPosition;
  bool _isLoading = false;
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.field?.name ?? '');
    _areaController = TextEditingController(
      text: widget.field?.area.toString() ?? '',
    );
    _soilTypeController = TextEditingController(text: widget.field?.soilType ?? '');
    _selectedAreaUnit = widget.field?.areaUnit ?? 'hectare';
    
    if (widget.field?.latitude != null && widget.field?.longitude != null) {
      _currentPosition = Position(
        latitude: widget.field!.latitude!,
        longitude: widget.field!.longitude!,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _areaController.dispose();
    _soilTypeController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);

    try {
      // Check if service is enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw Exception('Location permission denied');
      }

      _currentPosition = await Geolocator.getCurrentPosition();
      setState(() {});
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location captured successfully'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location not available on web. It will work on Android/iOS devices.'),
            backgroundColor: AppColors.warning,
            duration: Duration(seconds: 4),
          ),
        );
      }
    } finally {
      setState(() => _isLoadingLocation = false);
    }
  }

  Future<void> _saveField() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final user = FirebaseService.instance.auth.currentUser;
    if (user == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not logged in'),
            backgroundColor: AppColors.error,
          ),
        );
      }
      setState(() => _isLoading = false);
      return;
    }

    final field = FieldModel(
      id: widget.field?.id ?? const Uuid().v4(),
      userId: user.uid,
      name: _nameController.text.trim(),
      area: double.parse(_areaController.text.trim()),
      areaUnit: _selectedAreaUnit,
      soilType: _soilTypeController.text.trim().isEmpty
          ? null
          : _soilTypeController.text.trim(),
      latitude: _currentPosition?.latitude,
      longitude: _currentPosition?.longitude,
      createdAt: widget.field?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final controller = ref.read(fieldControllerProvider);
    final success = widget.field == null
        ? await controller.addField(field) != null
        : await controller.updateField(field);

    setState(() => _isLoading = false);

    if (mounted) {
      if (success) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.field == null
                ? 'Field added successfully'
                : 'Field updated successfully'),
            backgroundColor: AppColors.success,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.field == null
                ? 'Failed to add field'
                : 'Failed to update field'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.field != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit
            ? context.tr('field.edit_field')
            : context.tr('field.add_field')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Field Name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: context.tr('field.field_name'),
                  hintText: 'e.g., North Field',
                  prefixIcon: const Icon(Icons.label),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter field name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Field Area
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _areaController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: context.tr('field.field_area'),
                        prefixIcon: const Icon(Icons.square_foot),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter area';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Invalid number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedAreaUnit,
                      decoration: const InputDecoration(
                        labelText: 'Unit',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'hectare',
                          child: Text('Hectare'),
                        ),
                        DropdownMenuItem(
                          value: 'acre',
                          child: Text('Acre'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _selectedAreaUnit = value);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Soil Type
              TextFormField(
                controller: _soilTypeController,
                decoration: InputDecoration(
                  labelText: '${context.tr('field.soil_type')} (Optional)',
                  hintText: 'e.g., Loamy, Clay, Sandy',
                  prefixIcon: const Icon(Icons.terrain),
                ),
              ),
              const SizedBox(height: 24),

              // Location Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: AppColors.primary),
                        const SizedBox(width: 8),
                        Text(
                          'Location (Optional)',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (_currentPosition != null) ...[
                      Text(
                        'Latitude: ${_currentPosition!.latitude.toStringAsFixed(6)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        'Longitude: ${_currentPosition!.longitude.toStringAsFixed(6)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 12),
                    ],
                    ElevatedButton.icon(
                      onPressed: _isLoadingLocation ? null : _getCurrentLocation,
                      icon: _isLoadingLocation
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.my_location),
                      label: Text(_currentPosition == null
                          ? 'Capture Location'
                          : 'Update Location'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.surface,
                        foregroundColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Save Button
              ElevatedButton(
                onPressed: _isLoading ? null : _saveField,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(context.tr('common.save')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
