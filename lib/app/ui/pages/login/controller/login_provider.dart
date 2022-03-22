import 'package:flutter_meedu/meedu.dart';
import 'package:profile_test_app/app/ui/global_controllers/session_controller.dart';
import 'login_controller.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
);
