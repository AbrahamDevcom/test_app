import '../inputs/sign_up.dart';
import '../responses/sing_up_responses.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> register(SignUpData data);
}
