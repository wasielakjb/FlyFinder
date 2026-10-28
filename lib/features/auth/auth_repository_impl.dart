import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRepository {
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  bool get isAuthenticated => firebaseAuth.currentUser != null;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  bool isRegistrationPending = false;

  Future<void> login({required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    isRegistrationPending = true;
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
