import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_saathi/shared/services/firebase_service.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

// Auth state provider
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseService.instance.auth.authStateChanges();
});

// Auth controller provider
final authControllerProvider = Provider((ref) => AuthController(ref));

class AuthController {
  final Ref ref;
  final FirebaseAuth _auth = FirebaseService.instance.auth;
  String? _verificationId;

  AuthController(this.ref);

  // Send OTP to phone number
  Future<bool> sendOTP(String phoneNumber) async {
    try {
      _logger.i('Sending OTP to $phoneNumber');
      
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          _logger.i('Auto verification completed');
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          _logger.e('Verification failed: ${e.message}');
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) {
          _logger.i('Code sent: $verificationId');
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _logger.i('Auto retrieval timeout');
          _verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
      
      return true;
    } catch (e) {
      _logger.e('Send OTP error: $e');
      return false;
    }
  }

  // Verify OTP
  Future<User?> verifyOTP(String otp) async {
    try {
      if (_verificationId == null) {
        throw Exception('Verification ID is null');
      }
      
      _logger.i('Verifying OTP');
      
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      _logger.i('OTP verified successfully');
      
      return userCredential.user;
    } catch (e) {
      _logger.e('Verify OTP error: $e');
      return null;
    }
  }

  // Sign in as guest
  Future<User?> signInAsGuest() async {
    try {
      _logger.i('Signing in as guest');
      UserCredential userCredential = await _auth.signInAnonymously();
      _logger.i('Guest sign in successful');
      return userCredential.user;
    } catch (e) {
      _logger.e('Guest sign in error: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _logger.i('User signed out');
    } catch (e) {
      _logger.e('Sign out error: $e');
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
