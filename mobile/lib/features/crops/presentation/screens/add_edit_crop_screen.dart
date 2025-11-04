import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_saathi/core/constants/app_colors.dart';
import 'package:kisan_saathi/core/localization/app_localizations.dart';
import 'package:kisan_saathi/features/crops/presentation/providers/crop_provider.dart';
import 'package:kisan_saathi/shared/models/crop_model.dart';
import 'package:uuid/uuid.dart';

class AddEditCropScreen extends ConsumerStatefulWidget {
  final String fieldId;
  final CropModel? crop;

  const AddEditCropScreen({
    super.key,
    required this.fieldId,
    this.crop,
  });

  @override
  ConsumerState<AddEditCropScreen> createState() => _AddEditCropScreenState();
}

class _AddEditCropScreenState extends ConsumerState<AddEditCropScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String? _selectedCropType;
  late TextEditingController _varietyController;
  DateTime _sowingDate = DateTime.now();
  String? _selectedIrrigation;
  bool _isLoading = false;

  final List<String> _cropTypes = [
    'Wheat',
    'Rice',
    'Mustard',
    'Sugarcane',
    'Cotton',
    'Maize',
    'Potato',
    'Tomato',
  ];

  final List<String> _irrigationTypes = [
    'Drip Irrigation',
    'Sprinkler',
    'Flood Irrigation',
    'Rainfed',
  ];

  @override
  void initState() {
    super.initState();
    _selectedCropType = widget.crop?.cropType;
    _varietyController = TextEditingController(text: widget.crop?.seedVariety ?? '');
    _sowingDate = widget.crop?.sowingDate ?? DateTime.now();
    _selectedIrrigation = widget.crop?.irrigationType;
  }

  @override
  void dispose() {
    _varietyController.dispose();
    super.dispose();
  }

  Future<void> _selectSowingDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _sowingDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    
    if (date != null) {
      setState(() => _sowingDate = date);
    }
  }

  Future<void> _saveCrop() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final controller = ref.read(cropControllerProvider);
    final harvestDate = controller.calculateHarvestDate(_selectedCropType!, _sowingDate);

    final crop = CropModel(
      id: widget.crop?.id ?? const Uuid().v4(),
      fieldId: widget.fieldId,
      cropType: _selectedCropType!,
      seedVariety: _varietyController.text.trim(),
      sowingDate: _sowingDate,
      irrigationType: _selectedIrrigation,
      currentStage: widget.crop?.currentStage ?? 'Germination',
      currentStageDays: widget.crop?.currentStageDays ?? 0,
      expectedHarvestDate: harvestDate,
      status: 'active',
      createdAt: widget.crop?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final success = widget.crop == null
        ? await controller.addCrop(crop) != null
        : await controller.updateCrop(crop);

    setState(() => _isLoading = false);

    if (mounted) {
      if (success) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.crop == null
                ? 'Crop added successfully'
                : 'Crop updated successfully'),
            backgroundColor: AppColors.success,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.crop == null
                ? 'Failed to add crop'
                : 'Failed to update crop'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.crop != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit
            ? context.tr('crop.edit_crop')
            : context.tr('crop.add_crop')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Crop Type Dropdown
              DropdownButtonFormField<String>(
                value: _selectedCropType,
                decoration: InputDecoration(
                  labelText: context.tr('crop.crop_type'),
                  prefixIcon: const Icon(Icons.grass),
                ),
                items: _cropTypes.map((crop) {
                  return DropdownMenuItem(
                    value: crop,
                    child: Text(crop),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => _selectedCropType = value);
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select crop type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Seed Variety
              TextFormField(
                controller: _varietyController,
                decoration: InputDecoration(
                  labelText: context.tr('crop.seed_variety'),
                  hintText: 'e.g., HD 2967, PBW 343',
                  prefixIcon: const Icon(Icons.label),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter seed variety';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Sowing Date
              InkWell(
                onTap: _selectSowingDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: context.tr('crop.sowing_date'),
                    prefixIcon: const Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    '${_sowingDate.day}/${_sowingDate.month}/${_sowingDate.year}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Irrigation Type
              DropdownButtonFormField<String>(
                value: _selectedIrrigation,
                decoration: InputDecoration(
                  labelText: context.tr('crop.irrigation_type'),
                  prefixIcon: const Icon(Icons.water_drop),
                ),
                items: _irrigationTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => _selectedIrrigation = value);
                },
              ),
              const SizedBox(height: 24),

              // Info Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.info.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.info.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: AppColors.info),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'The app will automatically track crop stages and send timely alerts for irrigation, fertilization, and pest control.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Save Button
              ElevatedButton(
                onPressed: _isLoading ? null : _saveCrop,
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
