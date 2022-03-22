import 'package:flutter/material.dart';
import 'package:profile_test_app/app/domain/inputs/sign_up.dart';
import 'package:profile_test_app/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:profile_test_app/app/ui/global_widgets/dialogs/progress_dialogs.dart';
import 'package:profile_test_app/app/ui/routes/routes.dart';
import '../../../../domain/responses/sing_up_responses.dart';
import '../register_page.dart' show registerProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendRegister(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String content;
      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = "Email already in use";
          break;
        case SignUpError.weakPassword:
          content = "Weak password in use";
          break;
        case SignUpError.networkRequestFailed:
          content = "Network Request Failed";
          break;
        case SignUpError.unknown:
        default:
          content = "unknown error";
          break;
      }

      Dialogs.alert(context, title: "ERROR", content: content);
    } else {
      router.pushNamedAndRemoveUntil(Routes.HOME);
    }
  } else {
    Dialogs.alert(context, title: "ERROR", content: "Invalid Fields");
  }
}
