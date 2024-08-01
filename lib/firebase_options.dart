// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdsaP2_9CJqcaHtD3V9wdugMY-ji3vX6g',
    appId: '1:100527917597:android:a14437291329f6900a14f4',
    messagingSenderId: '100527917597',
    projectId: 'progress-soft-ab166',
    storageBucket: 'progress-soft-ab166.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAM05201PHUfSrF0fCLZBp_v90y2XyT-ck',
    appId: '1:100527917597:ios:baaf7d2919c0824f0a14f4',
    messagingSenderId: '100527917597',
    projectId: 'progress-soft-ab166',
    storageBucket: 'progress-soft-ab166.appspot.com',
    iosBundleId: 'com.example.startUpWorkspace',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBdMNW1eFWznWkcot6gwnoKu_HemVGtrBY',
    appId: '1:100527917597:web:6f28eda1325444ce0a14f4',
    messagingSenderId: '100527917597',
    projectId: 'progress-soft-ab166',
    authDomain: 'progress-soft-ab166.firebaseapp.com',
    storageBucket: 'progress-soft-ab166.appspot.com',
    measurementId: 'G-XG4H6HGJZE',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAM05201PHUfSrF0fCLZBp_v90y2XyT-ck',
    appId: '1:100527917597:ios:baaf7d2919c0824f0a14f4',
    messagingSenderId: '100527917597',
    projectId: 'progress-soft-ab166',
    storageBucket: 'progress-soft-ab166.appspot.com',
    iosBundleId: 'com.example.startUpWorkspace',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdMNW1eFWznWkcot6gwnoKu_HemVGtrBY',
    appId: '1:100527917597:web:5ab86b588974d3e80a14f4',
    messagingSenderId: '100527917597',
    projectId: 'progress-soft-ab166',
    authDomain: 'progress-soft-ab166.firebaseapp.com',
    storageBucket: 'progress-soft-ab166.appspot.com',
    measurementId: 'G-2NEYDCE59Z',
  );
}
