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
    apiKey: 'AIzaSyC8YyJsvBFNBvFMocnzmxDGh1WSXfXGPrg',
    appId: '1:293496424991:web:b7947ecdba30b7a822a32a',
    messagingSenderId: '293496424991',
    projectId: 'bamx-d99f0',
    authDomain: 'bamx-d99f0.firebaseapp.com',
    databaseURL: 'https://bamx-d99f0-default-rtdb.firebaseio.com',
    storageBucket: 'bamx-d99f0.appspot.com',
    measurementId: 'G-M6SGF11CJK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjLCmJlPIpnW5yVkwaHT-EghR9TdF5ZwE',
    appId: '1:293496424991:android:aff5f14b1dad339822a32a',
    messagingSenderId: '293496424991',
    projectId: 'bamx-d99f0',
    databaseURL: 'https://bamx-d99f0-default-rtdb.firebaseio.com',
    storageBucket: 'bamx-d99f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSp342Ls2N5hNc6s04PuImqCcSx1hZZaw',
    appId: '1:293496424991:ios:5242ebb5f9fea41d22a32a',
    messagingSenderId: '293496424991',
    projectId: 'bamx-d99f0',
    databaseURL: 'https://bamx-d99f0-default-rtdb.firebaseio.com',
    storageBucket: 'bamx-d99f0.appspot.com',
    iosClientId: '293496424991-0ur56s8httirs55iis0kclpam4mg6ut0.apps.googleusercontent.com',
    iosBundleId: 'com.example.bamxApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSp342Ls2N5hNc6s04PuImqCcSx1hZZaw',
    appId: '1:293496424991:ios:5242ebb5f9fea41d22a32a',
    messagingSenderId: '293496424991',
    projectId: 'bamx-d99f0',
    databaseURL: 'https://bamx-d99f0-default-rtdb.firebaseio.com',
    storageBucket: 'bamx-d99f0.appspot.com',
    iosClientId: '293496424991-0ur56s8httirs55iis0kclpam4mg6ut0.apps.googleusercontent.com',
    iosBundleId: 'com.example.bamxApp',
  );
}
