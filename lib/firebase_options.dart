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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCTlbsC04d-8MOxIoonKUj5GRInt3irvwc',
    appId: '1:307727121013:web:1797506d2aa1eead64d63c',
    messagingSenderId: '307727121013',
    projectId: 'smartgenie-c7f88',
    authDomain: 'smartgenie-c7f88.firebaseapp.com',
    storageBucket: 'smartgenie-c7f88.appspot.com',
    measurementId: 'G-HJKK1KJK1M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASO24WplAwJTsgo6x74baqRtLievZg0hI',
    appId: '1:307727121013:android:0855b11c6615463264d63c',
    messagingSenderId: '307727121013',
    projectId: 'smartgenie-c7f88',
    storageBucket: 'smartgenie-c7f88.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNbsAgOtdSpnSiuvJdCl7UsaieztxPkzo',
    appId: '1:307727121013:ios:5b9a2cb47a3cd16e64d63c',
    messagingSenderId: '307727121013',
    projectId: 'smartgenie-c7f88',
    storageBucket: 'smartgenie-c7f88.appspot.com',
    iosBundleId: 'com.example.aiChatBot',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTlbsC04d-8MOxIoonKUj5GRInt3irvwc',
    appId: '1:307727121013:web:86341fabebe3adad64d63c',
    messagingSenderId: '307727121013',
    projectId: 'smartgenie-c7f88',
    authDomain: 'smartgenie-c7f88.firebaseapp.com',
    storageBucket: 'smartgenie-c7f88.appspot.com',
    measurementId: 'G-2J7XKNX579',
  );
}
