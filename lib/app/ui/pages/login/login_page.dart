import 'package:flutter/material.dart';
import 'package:profile_test_app/app/ui/global_widgets/custom_input_field.dart';
import 'package:profile_test_app/app/ui/pages/login/utils/send_login_form.dart';

import 'package:profile_test_app/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:profile_test_app/app/utils/email_validator.dart';
import '../../utils/helpers.dart';
import 'controller/login_provider.dart';
import 'widgets/logo_header.dart';

final controller = loginProvider.read;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          KeyboardUtil.hideKeyboard(context);
        },
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const LogoHeader(),
                    const SizedBox(height: 20),
                    CustomInputField(
                      label: "email",
                      onChanged: controller.onEmailChanged,
                      inputType: TextInputType.emailAddress,
                      validator: (text) {
                        if (isValidEmail(text!)) {
                          return null;
                        }
                        return "invalid email";
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      label: "password",
                      isPassword: true,
                      onChanged: controller.onPasswordChanged,
                      validator: (text) {
                        if (text!.trim().length >= 6) {
                          return null;
                        }
                        return "Invalid password";
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () => sendLoginForm(context), child: Text('Login')),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  router.pushNamed(Routes.REGISTER);
                },
                child: Text('Registration')),
          ],
        ),
      ),
    );
  }
}
