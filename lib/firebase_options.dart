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
    apiKey: 'AIzaSyD3R0zMb1gn3N-zqwq-qer2b7KQkrqCPxI',
    appId: '1:1032160926808:web:0da55629c1394afc4efe2d',
    messagingSenderId: '1032160926808',
    projectId: 'graduation-d1ee4',
    authDomain: 'graduation-d1ee4.firebaseapp.com',
    storageBucket: 'graduation-d1ee4.appspot.com',
    measurementId: 'G-R0XLFLP0ZT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvU2eDpZrrJGJjWdEf9GWns0e10Ah7AZE',
    appId: '1:1032160926808:android:44dedbb416bc3a594efe2d',
    messagingSenderId: '1032160926808',
    projectId: 'graduation-d1ee4',
    storageBucket: 'graduation-d1ee4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLhnmbR9OiHY_ihCfbTtrk-3fSBw7wYgw',
    appId: '1:1032160926808:ios:f59d05ad11ab02d94efe2d',
    messagingSenderId: '1032160926808',
    projectId: 'graduation-d1ee4',
    storageBucket: 'graduation-d1ee4.appspot.com',
    iosBundleId: 'com.example.mindcareAdminApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLhnmbR9OiHY_ihCfbTtrk-3fSBw7wYgw',
    appId: '1:1032160926808:ios:cf6af27406dbc1ac4efe2d',
    messagingSenderId: '1032160926808',
    projectId: 'graduation-d1ee4',
    storageBucket: 'graduation-d1ee4.appspot.com',
    iosBundleId: 'com.example.mindcareAdminApp.RunnerTests',
  );
}