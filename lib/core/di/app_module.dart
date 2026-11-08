import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flyfinder/firebase_options.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @preResolve
  @singleton
  Future<FirebaseApp> getFirebase() => Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
