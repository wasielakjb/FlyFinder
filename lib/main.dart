import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/app/app.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/firebase_options.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationSupportDirectory()).path,
    ),
  );

  await configureDependencies();
  runApp(App());
}
