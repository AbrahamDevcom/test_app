import 'package:flutter/material.dart';
import 'package:profile_test_app/app/ui/pages/splash/controller/splash_provider.dart';
import 'controller/splash_controller.dart';
import 'package:flutter_meedu/ui.dart';

final controller = splashProvider.read;

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
        provider: splashProvider,
        onChange: (_, controller) {
          final routeName = controller.routeName;
          if (routeName != null) {
            router.pushReplacementNamed(routeName);
          }
        },
        builder: (_, __) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
