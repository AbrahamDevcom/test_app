import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/meedu.dart';
import 'package:profile_test_app/app/domain/repositories/authentication_repository.dart';
import 'package:profile_test_app/app/ui/global_controllers/session_controller.dart';

import '../../../../domain/responses/sign_in_responses.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;

  String _email = '', _password = '';
  final _authenticationRepository = Get.find<AuthenticationRepository>();
  final GlobalKey<FormState> formKey = GlobalKey();

  LoginController(this._sessionController);

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() async {
    final response = await _authenticationRepository.signInWhitEmailAndPassword(
      _email,
      _password,
    );

    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }

    return response;
  }
}
