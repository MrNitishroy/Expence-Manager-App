// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB6Pxmalm6SASCvwpQT0f-I1pjrHvHMnws',
    appId: '1:790827052588:web:41c3cde64488791d23eb89',
    messagingSenderId: '790827052588',
    projectId: 'expanse-manager-1242b',
    authDomain: 'expanse-manager-1242b.firebaseapp.com',
    storageBucket: 'expanse-manager-1242b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrojL0A4_sD4nF5u5iPj4g53zQrZbhUkY',
    appId: '1:790827052588:android:1e2ab275a3c833b723eb89',
    messagingSenderId: '790827052588',
    projectId: 'expanse-manager-1242b',
    storageBucket: 'expanse-manager-1242b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8QSWs8r6PJ2hgir_5QqxhyFZ2dKXEpDQ',
    appId: '1:790827052588:ios:efb0a162de50afca23eb89',
    messagingSenderId: '790827052588',
    projectId: 'expanse-manager-1242b',
    storageBucket: 'expanse-manager-1242b.appspot.com',
    iosBundleId: 'com.example.expenseManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8QSWs8r6PJ2hgir_5QqxhyFZ2dKXEpDQ',
    appId: '1:790827052588:ios:16e13b4578efbae323eb89',
    messagingSenderId: '790827052588',
    projectId: 'expanse-manager-1242b',
    storageBucket: 'expanse-manager-1242b.appspot.com',
    iosBundleId: 'com.example.expenseManager.RunnerTests',
  );
}
