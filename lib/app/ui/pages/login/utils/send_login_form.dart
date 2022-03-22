import 'package:flutter/cupertino.dart';
import 'package:profile_test_app/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:profile_test_app/app/ui/global_widgets/dialogs/progress_dialogs.dart';
import 'package:profile_test_app/app/ui/routes/routes.dart';
import '../../../../domain/responses/sign_in_responses.dart';
import '../controller/login_provider.dart' show loginProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      String errorMessage = "";
      switch (response.error) {
        case SignInError.networkRequestFailed:
          errorMessage = "Network Request Failed";
          break;
        case SignInError.userDisabled:
          errorMessage = "User Disabled";
          break;
        case SignInError.userNotFound:
          errorMessage = "User Not Found";
          break;
        case SignInError.wrongPassword:
          errorMessage = "Wrong Password";
          break;
        case SignInError.unknown:
        default:
          errorMessage = "Unknown Error";
          break;
      }

      Dialogs.alert(
        context,
        title: "ERROR",
        content: errorMessage,
      );
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
  }
}
