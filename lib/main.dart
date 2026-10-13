import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/app/app.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(App());
}
