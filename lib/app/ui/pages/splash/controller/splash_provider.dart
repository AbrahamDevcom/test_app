import 'package:flutter_meedu/meedu.dart';
import 'package:profile_test_app/app/ui/global_controllers/session_controller.dart';
import 'splash_controller.dart';

final splashProvider = SimpleProvider(
  (_) => SplashController(sessionProvider.read),
);
