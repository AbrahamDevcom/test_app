import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Widget, BuildContext;
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../pages/register/register_page.dart';
import '../pages/splash/splash_page.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => const LoginPage(),
      Routes.REGISTER: (_) => const RegisterPage(),
      Routes.HOME: (_) => const HomePage(),
    };
