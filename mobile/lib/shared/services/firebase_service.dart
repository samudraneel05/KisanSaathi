import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_saathi/firebase_options.dart';
import 'package:logger/logger.dart';

class FirebaseService {
  static FirebaseService? _instance;
  final Logger _logger = Logger();
  
  FirebaseService._();
  
  static FirebaseService get instance {
    _instance ??= FirebaseService._();
    return _instance!;
  }

  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseMessaging get messaging => FirebaseMessaging.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _logger.i('Firebase initialized successfully');
      
      // Request notification permissions
      await _requestNotificationPermissions();
      
      // Setup FCM
      await _setupFCM();
    } catch (e) {
      _logger.e('Firebase initialization error: $e');
    }
  }

  Future<void> _requestNotificationPermissions() async {
    try {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      
      _logger.i('Notification permission: ${settings.authorizationStatus}');
    } catch (e) {
      _logger.e('Notification permission error: $e');
    }
  }

  Future<void> _setupFCM() async {
    try {
      // Get FCM token
      String? token = await messaging.getToken();
      _logger.i('FCM Token: $token');
      
      // Handle foreground messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _logger.i('Foreground message: ${message.notification?.title}');
        // Handle notification in foreground
      });
      
      // Handle background messages
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        _logger.i('Message opened app: ${message.notification?.title}');
        // Handle notification tap
      });
    } catch (e) {
      _logger.e('FCM setup error: $e');
    }
  }

  Future<String?> getFCMToken() async {
    try {
      return await messaging.getToken();
    } catch (e) {
      _logger.e('Get FCM token error: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      _logger.i('User signed out');
    } catch (e) {
      _logger.e('Sign out error: $e');
    }
  }
}
