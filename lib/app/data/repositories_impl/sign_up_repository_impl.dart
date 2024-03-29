import 'package:firebase_auth/firebase_auth.dart';
import 'package:profile_test_app/app/domain/inputs/sign_up.dart';

import '../../domain/repositories/sign_up_repository.dart';
import '../../domain/responses/sing_up_responses.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth _auth;

  SignUpRepositoryImpl(this._auth);

  @override
  Future<SignUpResponse> register(SignUpData data) async {
    try {
      print(data.name);
      print(data.lastname);
      print(data.email);
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: data.email, password: data.password);
      await userCredential.user!
          .updateDisplayName("${data.name} ${data.lastname}");

      return SignUpResponse(null, userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse(parseStringToSignUpError(e.code), null);
    }
  }
}
