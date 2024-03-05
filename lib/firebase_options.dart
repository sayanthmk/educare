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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyChao9VC1DA62HFhvU_FBiz650ytnkKukU',
    appId: '1:34207977152:web:2255d173737cbfaa46e725',
    messagingSenderId: '34207977152',
    projectId: 'hoist-126af',
    authDomain: 'hoist-126af.firebaseapp.com',
    storageBucket: 'hoist-126af.appspot.com',
    measurementId: 'G-DY1FSWYPVP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfwg7XMGrLH-1lxrKb_6DfkAKHdxj7K6E',
    appId: '1:34207977152:android:9c6c75847b54203446e725',
    messagingSenderId: '34207977152',
    projectId: 'hoist-126af',
    storageBucket: 'hoist-126af.appspot.com',
  );
}
