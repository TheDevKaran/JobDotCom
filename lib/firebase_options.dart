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
    apiKey: 'AIzaSyAPWYl8zUsEXxSbBpM_6HBFuq52uzwAM00',
    appId: '1:143715742191:web:6df1e47144408bdd7f861a',
    messagingSenderId: '143715742191',
    projectId: 'quickcart-261ef',
    authDomain: 'quickcart-261ef.firebaseapp.com',
    storageBucket: 'quickcart-261ef.appspot.com',
    measurementId: 'G-8DNLGP2YZY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMRaA7_3nSDHDPsg6joD55R9f-hqh8kvg',
    appId: '1:143715742191:android:b304d106ff6653467f861a',
    messagingSenderId: '143715742191',
    projectId: 'quickcart-261ef',
    storageBucket: 'quickcart-261ef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCI2frk1Z-9RGWTzFxOr0ab6o8as_Po9s',
    appId: '1:143715742191:ios:b05a9e7ed4d4f9327f861a',
    messagingSenderId: '143715742191',
    projectId: 'quickcart-261ef',
    storageBucket: 'quickcart-261ef.appspot.com',
    iosClientId: '143715742191-010b9qn63an2v8fct3hfuskhstccb2el.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobdotcom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCI2frk1Z-9RGWTzFxOr0ab6o8as_Po9s',
    appId: '1:143715742191:ios:81717323008486b17f861a',
    messagingSenderId: '143715742191',
    projectId: 'quickcart-261ef',
    storageBucket: 'quickcart-261ef.appspot.com',
    iosClientId: '143715742191-cs3rs6k2joh8qa7i7ccti9mglp46j910.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobdotcom.RunnerTests',
  );
}