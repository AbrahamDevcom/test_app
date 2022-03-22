import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:profile_test_app/app/ui/global_controllers/session_controller.dart';

import '../../../../domain/repositories/authentication_repository.dart';

class HomeController extends SimpleNotifier {
  final SessionController _sessionController;
  final AuthenticationRepository _account = Get.i.find();

  HomeController(this._sessionController);
}
