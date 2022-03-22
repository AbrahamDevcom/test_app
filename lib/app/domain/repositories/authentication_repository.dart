import 'package:firebase_auth/firebase_auth.dart';

import '../responses/sign_in_responses.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signInWhitEmailAndPassword(
    String email,
    String password,
  );
}
