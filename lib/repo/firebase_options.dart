import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAeZFfiODrNhSXk4tVcuKsss7-hvqZw4Xw',
    appId: '1:55067068968:web:a0688081ec1ac5c4b8c31d',
    messagingSenderId: '55067068968',
    projectId: 'with-cli',
    authDomain: 'with-cli.firebaseapp.com',
    storageBucket: 'with-cli.appspot.com',
    measurementId: 'G-3B72DX2484',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA4rJ0VMiRGSKJWEJHoVRDn_ZRXgWHnUI',
    appId: '1:809377215638:android:9ce9592d6daab6f2aabeb7',
    messagingSenderId: '809377215638',
    projectId: 'tbcam-8e183',
    storageBucket: 'tbcam-8e183-default-rtdb.firebaseio.com',
  );
}