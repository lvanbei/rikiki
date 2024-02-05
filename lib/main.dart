import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}


// https://pub.dev/packages/pwa_install

// https://progressier.com/pwa-icons-and-ios-splash-screen-generator

// https://medium.com/@azharbinanwar/change-the-app-theme-using-flutter-bloc-hydrated-bloc-42d091482829