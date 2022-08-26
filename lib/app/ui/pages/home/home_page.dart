import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:profile_test_app/app/ui/global_controllers/session_controller.dart';
import 'controller/home_provider.dart';
import 'package:profile_test_app/app/ui/routes/routes.dart';

final controller = homeProvider.read;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Consumer(builder: (_, ref, __) {
            final user = ref.watch(sessionProvider).user!;
            return Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const SizedBox(
                      height: 220,
                      width: double.infinity,
                    ),
                    Positioned(
                      child: Container(
                        width: double.infinity,
                        height: 160,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://img.freepik.com/vector-gratis/escena-naturaleza-rio-colinas-bosque-montana-ilustracion-estilo-dibujos-animados-planos-paisaje_1150-37326.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "assets/images/no-user.png",
                              width: 120,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(40)),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                RowData(userData: "${user.displayName}"),
                const SizedBox(
                  height: 10,
                ),
                RowData(userData: "${user.email}"),
                const SizedBox(
                  height: 10,
                ),
                RowData(userData: "${user.metadata}"),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CupertinoButton(
          color: Colors.blueAccent,
          child: const Text("Sign Out"),
          onPressed: () async {
            await sessionProvider.read.signOut();
            router.pushNamedAndRemoveUntil(Routes.LOGIN);
          },
        ),
      ),
    );
  }
}

class RowData extends StatelessWidget {
  const RowData({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final String userData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black54,
          ),
        ),
        child: Text(userData),
      ),
    );
  }
}
