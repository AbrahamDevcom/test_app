import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:profile_test_app/app/inject.dart';
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  injectDependecies();
  runApp(
    const MyApp(),
  );
}
