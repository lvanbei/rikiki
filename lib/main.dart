import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


// https://pub.dev/packages/pwa_install

// https://progressier.com/pwa-icons-and-ios-splash-screen-generator

// https://medium.com/@azharbinanwar/change-the-app-theme-using-flutter-bloc-hydrated-bloc-42d091482829