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
    apiKey: 'AIzaSyA_smMGiZfykeN_lUphCHrCx6qGuyIDEHQ',
    appId: '1:989360297588:web:c8a2b5886c5f658aa36321',
    messagingSenderId: '989360297588',
    projectId: 'masterclass-90c38',
    authDomain: 'masterclass-90c38.firebaseapp.com',
    storageBucket: 'masterclass-90c38.appspot.com',
    measurementId: 'G-KXBM6V3T5Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzMFneQO9tfP18xyft4QLEIBbhAS1f0mA',
    appId: '1:989360297588:android:0b6826fe9f2b8a86a36321',
    messagingSenderId: '989360297588',
    projectId: 'masterclass-90c38',
    storageBucket: 'masterclass-90c38.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDe8YVak8lPYRhW5BlUlDFyEKMUgycEZmQ',
    appId: '1:989360297588:ios:40247debe0bafbb1a36321',
    messagingSenderId: '989360297588',
    projectId: 'masterclass-90c38',
    storageBucket: 'masterclass-90c38.appspot.com',
    iosBundleId: 'com.example.masterClass',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDe8YVak8lPYRhW5BlUlDFyEKMUgycEZmQ',
    appId: '1:989360297588:ios:2e1d85590b9c1357a36321',
    messagingSenderId: '989360297588',
    projectId: 'masterclass-90c38',
    storageBucket: 'masterclass-90c38.appspot.com',
    iosBundleId: 'com.example.masterClass.RunnerTests',
  );
}
