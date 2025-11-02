import 'package:flutter/material.dart';
import 'package:kisan_saathi/core/constants/app_colors.dart';
import 'package:kisan_saathi/core/localization/app_localizations.dart';
import 'package:kisan_saathi/features/home/presentation/screens/home_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:logger/logger.dart';
import 'package:kisan_saathi/shared/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Logger _logger = Logger();

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  // Form data
  String? _region;
  Position? _position;
  final List<String> _selectedCrops = [];
  bool _isLoadingLocation = false;

  final List<String> _cropOptions = [
    'Wheat',
    'Rice',
    'Mustard',
    'Sugarcane',
    'Cotton',
    'Maize',
    'Potato',
    'Tomato',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);

    try {
      // Check if service is enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _logger.w('Location services are disabled');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _logger.w('Location permission denied');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _logger.w('Location permission permanently denied');
        return;
      }

      _position = await Geolocator.getCurrentPosition();
      
      // Get address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _position!.latitude,
        _position!.longitude,
      );
      
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _region = '${place.locality}, ${place.administrativeArea}';
        });
      }
    } catch (e) {
      _logger.e('Location error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location not available. You can enter your region manually below.'),
            backgroundColor: AppColors.warning,
          ),
        );
      }
    } finally {
      setState(() => _isLoadingLocation = false);
    }
  }

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  Future<void> _completeOnboarding() async {
    try {
      final user = FirebaseService.instance.auth.currentUser;
      if (user != null) {
        // Save onboarding data to Firestore
        await FirebaseService.instance.firestore
            .collection('users')
            .doc(user.uid)
            .set({
          'onboardingCompleted': true,
          'region': _region,
          'latitude': _position?.latitude,
          'longitude': _position?.longitude,
          'preferredCrops': _selectedCrops,
          'completedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
        
        _logger.i('Onboarding completed and saved');
      }
    } catch (e) {
      _logger.e('Error saving onboarding: $e');
    }
    
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (_currentPage < 1)
            TextButton(
              onPressed: _completeOnboarding,
              child: Text(
                context.tr('onboarding.skip'),
                style: const TextStyle(color: AppColors.primary),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          // Page indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 32 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.primary
                        : AppColors.border,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          
          // Pages
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() => _currentPage = page);
              },
              children: [
                _buildRegionPage(),
                _buildCropsPage(),
              ],
            ),
          ),
          
          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                if (_currentPage > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(context.tr('common.back')),
                    ),
                  ),
                if (_currentPage > 0) const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    child: Text(
                      _currentPage < 1
                          ? context.tr('common.next')
                          : context.tr('onboarding.get_started'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          
          // Icon
          const Icon(
            Icons.location_on,
            size: 80,
            color: AppColors.primary,
          ),
          const SizedBox(height: 24),
          
          // Title
          Text(
            context.tr('onboarding.select_region'),
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          
          // Location display
          if (_region != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary),
              ),
              child: Row(
                children: [
                  const Icon(Icons.place, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _region!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          
          // Get location button
          ElevatedButton.icon(
            onPressed: _isLoadingLocation ? null : _getCurrentLocation,
            icon: _isLoadingLocation
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Icon(Icons.my_location),
            label: Text(context.tr('onboarding.use_current_location')),
          ),
          const SizedBox(height: 16),
          
          // Manual region input
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Or enter manually',
              hintText: 'e.g., Ludhiana, Punjab',
            ),
            onChanged: (value) {
              setState(() => _region = value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCropsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          
          // Icon
          const Icon(
            Icons.grass,
            size: 80,
            color: AppColors.primary,
          ),
          const SizedBox(height: 24),
          
          // Title
          Text(
            context.tr('onboarding.typical_crops'),
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          
          // Crop chips
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _cropOptions.map((crop) {
              final isSelected = _selectedCrops.contains(crop);
              return FilterChip(
                label: Text(crop),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCrops.add(crop);
                    } else {
                      _selectedCrops.remove(crop);
                    }
                  });
                },
                selectedColor: AppColors.primary.withOpacity(0.2),
                checkmarkColor: AppColors.primary,
                side: BorderSide(
                  color: isSelected ? AppColors.primary : AppColors.border,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
