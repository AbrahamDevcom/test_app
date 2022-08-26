import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:profile_test_app/app/ui/routes/app_routes.dart';
import 'package:profile_test_app/app/ui/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Test',
      key: router.appKey,
      debugShowCheckedModeBanner: false,
      navigatorKey: router.navigatorKey,
      navigatorObservers: [
        router.observer,
      ],
      initialRoute: Routes.SPLASH,
      routes: appRoutes,
    );
  }
}
