import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:profile_test_app/app/ui/global_controllers/session_controller.dart';
import 'package:profile_test_app/app/ui/global_widgets/custom_input_field.dart';
import '../../../utils/email_validator.dart';
import '../../../utils/name_validator.dart';
import '../../utils/helpers.dart';
import 'controller/register_controller.dart';
import 'controller/register_state.dart';
import 'utils/send_register.dart';

import 'package:flutter_meedu/meedu.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () {
              KeyboardUtil.hideKeyboard(context);
            },
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
              child: Form(
                  key: controller.formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(15),
                    children: [
                      CustomInputField(
                        onChanged: controller.onNameChanged,
                        label: 'Name',
                        validator: (text) {
                          return isValidName(text!) ? null : "invalid name";
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomInputField(
                        onChanged: controller.onLastnameChanged,
                        label: 'Lastname',
                        validator: (text) {
                          return isValidName(text!) ? null : "invalid lastname";
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomInputField(
                          inputType: TextInputType.emailAddress,
                          onChanged: controller.onEmailChanged,
                          label: 'E-mail',
                          validator: (text) {
                            return isValidEmail(text!) ? null : "invalid email";
                          }),
                      const SizedBox(height: 15),
                      CustomInputField(
                        isPassword: true,
                        onChanged: controller.onPasswordChanged,
                        label: 'Password',
                        validator: (text) {
                          if (text!.trim().length >= 6) {
                            return null;
                          }
                          return "invalid password";
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomInputField(
                        isPassword: true,
                        onChanged: controller.onVPasswordChanged,
                        label: 'Verification Password',
                        validator: (text) {
                          if (text != controller.state.password) {
                            return "password don't match";
                          }
                          if (text!.trim().length >= 6) {
                            return null;
                          }
                          return "invalid password";
                        },
                      ),
                      const SizedBox(height: 30),
                      CupertinoButton(
                        child: const Text("Register"),
                        color: Colors.blue,
                        onPressed: () => sendRegister(context),
                      )
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
