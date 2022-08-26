import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:profile_test_app/app/domain/inputs/sign_up.dart';

import 'package:profile_test_app/app/domain/repositories/sign_up_repository.dart';
import 'package:profile_test_app/app/ui/global_controllers/session_controller.dart';
import 'package:profile_test_app/app/ui/pages/register/controller/register_state.dart';

import '../../../../domain/responses/sing_up_responses.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final SessionController _sessionController;
  RegisterController(this._sessionController)
      : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();
  final _signUpRepository = Get.find<SignUpRepository>();

  Future<SignUpResponse> submit() async {
    print("im here now");
    final response = await _signUpRepository.register(
      SignUpData(
        name: state.name,
        lastname: state.lastname,
        email: state.email,
        password: state.password,
      ),
    );
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }

  void onNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onLastnameChanged(String text) {
    state = state.copyWith(lastname: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChanged(String text) {
    state = state.copyWith(vPassword: text);
  }
}
