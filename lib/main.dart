import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dropoff/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bindings/app_bindings.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  AppBindings().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
