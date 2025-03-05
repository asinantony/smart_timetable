import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

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
        return windows;
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
    apiKey: 'AIzaSyBdbGJ_nvlZjyO3LYpeG5CzOCAeFnLeFc0',
    appId: '1:109126583991:web:a8506358dc1ef85d77ef32',
    messagingSenderId: '109126583991',
    projectId: 'smart-timetable-generation',
    authDomain: 'smart-timetable-generation.firebaseapp.com',
    storageBucket: 'smart-timetable-generation.firebasestorage.app',
    measurementId: 'G-P2KZ5LWK18',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuIaYZAf7PYSzRGSB7graTL04jOnjcSsM',
    appId: '1:109126583991:android:a140b5d81c8c56a677ef32',
    messagingSenderId: '109126583991',
    projectId: 'smart-timetable-generation',
    storageBucket: 'smart-timetable-generation.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4eAQuF-9KvoROGU8k7_xoU6ShuvycORs',
    appId: '1:109126583991:ios:19b1ea2b84e7739377ef32',
    messagingSenderId: '109126583991',
    projectId: 'smart-timetable-generation',
    storageBucket: 'smart-timetable-generation.firebasestorage.app',
    iosBundleId: 'com.example.smartTimetable',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4eAQuF-9KvoROGU8k7_xoU6ShuvycORs',
    appId: '1:109126583991:ios:19b1ea2b84e7739377ef32',
    messagingSenderId: '109126583991',
    projectId: 'smart-timetable-generation',
    storageBucket: 'smart-timetable-generation.firebasestorage.app',
    iosBundleId: 'com.example.smartTimetable',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdbGJ_nvlZjyO3LYpeG5CzOCAeFnLeFc0',
    appId: '1:109126583991:web:54e7478c4d8bd2d977ef32',
    messagingSenderId: '109126583991',
    projectId: 'smart-timetable-generation',
    authDomain: 'smart-timetable-generation.firebaseapp.com',
    storageBucket: 'smart-timetable-generation.firebasestorage.app',
    measurementId: 'G-9CDRPKGRVE',
  );
}
