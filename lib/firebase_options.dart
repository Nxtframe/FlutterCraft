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
    apiKey: 'AIzaSyCA6W126IwQoeJRGQMGvyQR9gl4XHgOEDg',
    appId: '1:848331948618:web:721ab783feedceaa229cb3',
    messagingSenderId: '848331948618',
    projectId: 'craftui',
    authDomain: 'craftui.firebaseapp.com',
    storageBucket: 'craftui.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClnPjw_J65HgxVrmbDmzHWDsTb87iEMjQ',
    appId: '1:848331948618:android:d8af2dbdf12e1264229cb3',
    messagingSenderId: '848331948618',
    projectId: 'craftui',
    storageBucket: 'craftui.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdSXCN8rIlkOyeFXc-RzB1XYVpV-7Awx8',
    appId: '1:848331948618:ios:3daeb70e5732f472229cb3',
    messagingSenderId: '848331948618',
    projectId: 'craftui',
    storageBucket: 'craftui.appspot.com',
    iosClientId: '848331948618-oqh497qblhgme13nnickggbqske6vr6p.apps.googleusercontent.com',
    iosBundleId: 'com.example.craftui',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdSXCN8rIlkOyeFXc-RzB1XYVpV-7Awx8',
    appId: '1:848331948618:ios:7dabb742ece2da6f229cb3',
    messagingSenderId: '848331948618',
    projectId: 'craftui',
    storageBucket: 'craftui.appspot.com',
    iosClientId: '848331948618-r6ejgc9iuclga8v66bsudtn3mhoi57dk.apps.googleusercontent.com',
    iosBundleId: 'com.example.craftui.RunnerTests',
  );
}
