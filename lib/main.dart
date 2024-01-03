import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rikiki_for_real/screens/screens.dart';

import 'app.dart';

final getIt = GetIt.asNewInstance();

void main() {
  setup();
  runApp(const MyApp());
}

void setup() {
  getIt.registerSingleton<BaseCubit>(BaseCubit());
}
