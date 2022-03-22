import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:profile_test_app/app/data/repositories_impl/account_repository_impl.dart';
import 'package:profile_test_app/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:profile_test_app/app/domain/repositories/account_repository.dart';
import 'package:profile_test_app/app/domain/repositories/sign_up_repository.dart';

import 'data/repositories_impl/authentication_repository_impl.dart';
import 'domain/repositories/authentication_repository.dart';

Future<void> injectDependecies() async {
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );
  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(FirebaseAuth.instance),
  );
  Get.i.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(FirebaseAuth.instance),
  );
}
