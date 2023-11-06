import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      return const FirebaseOptions(
          //iOS
          apiKey: "AIzaSyCUrSGB7GyfsBSpfSvT96oU_mcLV80EE0M",
          appId: "1:365219531327:android:df35323d3ff099b2c8c68a",
          messagingSenderId: "365219531327",
          projectId: "comicsduka",
          iosBundleId: 'com.example.comicsduka');
    } else {
      //Android
      return const FirebaseOptions(
          apiKey: "AIzaSyCUrSGB7GyfsBSpfSvT96oU_mcLV80EE0M",
          appId: "1:365219531327:android:df35323d3ff099b2c8c68a",
          messagingSenderId: "365219531327",
          projectId: "comicsduka");
    }
  }
}
