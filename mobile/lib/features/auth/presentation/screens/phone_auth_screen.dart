import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_saathi/core/constants/app_colors.dart';
import 'package:kisan_saathi/core/localization/app_localizations.dart';
import 'package:kisan_saathi/features/auth/presentation/providers/auth_provider.dart';
import 'package:kisan_saathi/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:kisan_saathi/features/onboarding/presentation/screens/onboarding_screen.dart';

class PhoneAuthScreen extends ConsumerStatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  ConsumerState<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends ConsumerState<PhoneAuthScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _selectedCountryCode = '+91';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _sendOTP() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final phoneNumber = _selectedCountryCode + _phoneController.text.trim();
    final authController = ref.read(authControllerProvider);

    final success = await authController.sendOTP(phoneNumber);

    setState(() => _isLoading = false);

    if (success && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPVerificationScreen(
            phoneNumber: phoneNumber,
          ),
        ),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.tr('errors.something_went_wrong')),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _signInAsGuest() async {
    setState(() => _isLoading = true);

    final authController = ref.read(authControllerProvider);
    final user = await authController.signInAsGuest();

    setState(() => _isLoading = false);

    if (user != null && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.tr('errors.something_went_wrong')),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                
                // Logo
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.agriculture,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Welcome text
                Text(
                  context.tr('welcome'),
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  context.tr('welcome_subtitle'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                
                // Phone number input
                Text(
                  context.tr('auth.phone_number'),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Country code dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedCountryCode,
                          items: const [
                            DropdownMenuItem(value: '+91', child: Text('+91')),
                            DropdownMenuItem(value: '+1', child: Text('+1')),
                            DropdownMenuItem(value: '+44', child: Text('+44')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => _selectedCountryCode = value);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Phone number field
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: context.tr('auth.enter_phone'),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          if (value.length < 10) {
                            return 'Phone number must be at least 10 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                
                // Send OTP button
                ElevatedButton(
                  onPressed: _isLoading ? null : _sendOTP,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(context.tr('auth.send_otp')),
                ),
                const SizedBox(height: 16),
                
                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Guest button
                OutlinedButton(
                  onPressed: _isLoading ? null : _signInAsGuest,
                  child: Text(context.tr('auth.continue_as_guest')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
