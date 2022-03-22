import 'package:flutter_meedu/meedu.dart';
import 'package:profile_test_app/app/ui/global_controllers/session_controller.dart';

import 'home_controller.dart';

final homeProvider = SimpleProvider(
  (_) => HomeController(sessionProvider.read),
);
