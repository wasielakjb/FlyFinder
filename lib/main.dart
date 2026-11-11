import 'package:flutter/material.dart';
import 'package:flyfinder/app/app.dart';
import 'package:flyfinder/core/http/di/di.dart';
import 'package:flyfinder/di.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationSupportDirectory()).path,
    ),
  );

  await configureDependencies();

  setupInterceptors();

  runApp(App());
}
