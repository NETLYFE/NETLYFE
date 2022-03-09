import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlyfe/Utils/screen_intents.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/views/login_view.dart';
import 'package:netlyfe/views/onboard_screen_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    Timer(const Duration(seconds: 2), () => Get.to(() => const LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Image.asset(StringData.applogo,
                      width: 150, height: 150))),
          Expanded(
              child: Center(
                  child: Column(children: [
            Text(StringData.appSlogan, style: descriptionStyle),
            const SizedBox(height: 10),
            const CircularProgressIndicator(
                strokeWidth: 3.0, color: StringData.appThemeColor1)
          ])))
        ],
      ),
    );
  }
}
