import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_class/Controllers/auth_controller.dart';
import 'package:master_class/Controllers/zoom_drawer_controller.dart';
import 'package:master_class/config/themes/app_colors.dart';
import 'package:master_class/config/themes/ui_parameters.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool isSignedIn = Get.find<AuthController>().isLoggedIn();
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: onSurfaceTextColor)),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.2, top: 12),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height / 1.8 -
                                    1.0) -
                                250.0,
                            child: Column(
                              children: [
                                Obx(() => controller.user.value == null
                                    ? const SizedBox()
                                    : Column(
                                        children: [
                                          Image.network(
                                              '${controller.user.value!.photoURL}'),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10)),
                                          Text(
                                            controller
                                                    .user.value!.displayName ??
                                                '',
                                            style: const TextStyle(
                                                fontFamily:
                                                    AutofillHints.nickname,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 18,
                                                color: onSurfaceTextColor),
                                          ),
                                        ],
                                      )),
                              ],
                            ))
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 35)),
                    Expanded(
                        child: ListView(
                      children: [
                        ListTile(
                            onTap: () {
                              controller.website();
                            },
                            leading: const Icon(Icons.web, color: Colors.white),
                            title: const Text(
                              "Website",
                              style: TextStyle(
                                  fontFamily: AutofillHints.nickname,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: onSurfaceTextColor),
                            )),
                        ListTile(
                            onTap: () => controller.facebook(),
                            leading:
                                const Icon(Icons.facebook, color: Colors.white),
                            title: const Text(
                              "Facebook",
                              style: TextStyle(
                                  fontFamily: AutofillHints.nickname,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: onSurfaceTextColor),
                            )),
                        ListTile(
                            onTap: () => controller.email(),
                            leading:
                                const Icon(Icons.email, color: Colors.white),
                            title: const Text("Email",
                                style: TextStyle(
                                    fontFamily: AutofillHints.nickname,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: onSurfaceTextColor))),
                        isSignedIn
                            ? ListTile(
                                onTap: () => controller.signOut(),
                                leading: const Icon(Icons.logout,
                                    color: Colors.white),
                                title: const Text("Logout",
                                    style: TextStyle(
                                        fontFamily: AutofillHints.nickname,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        color: onSurfaceTextColor)))
                            : const Text("")
                      ],
                    ))
                    // _DrawerButton(
                    //   icon: Icons.web,
                    //   label: "Website",
                    //   onPressed: () => controller.website(),
                    // ),
                    // _DrawerButton(
                    //   icon: Icons.facebook,
                    //   label: "Facebook",
                    //   onPressed: () => controller.facebook(),
                    // ),
                    // _DrawerButton(
                    //   icon: Icons.email,
                    //   label: "Email",
                    //   onPressed: () => controller.email(),
                    // ),
                    // const Spacer(flex: 4),
                    // _DrawerButton(
                    //   icon: Icons.logout,
                    //   label: "Logout",
                    //   onPressed: () => controller.signOut(),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 25),
      label: Text(
        label,
        style:
            const TextStyle(fontSize: 25, fontFamily: AutofillHints.nickname),
      ),
    );
  }
}
