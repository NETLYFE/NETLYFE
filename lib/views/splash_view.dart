import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlyfe/Utils/screen_intents.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/controllers/phone_auth_controller.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/views/home_view.dart';
import 'package:netlyfe/views/login_view.dart';
import 'package:netlyfe/views/onboard_screen_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var mAuth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    var currentUser =  mAuth.currentUser;
    if(currentUser == null){
      navigate(const LoginView());
    }else{
      navigate(const HomeView());
    }
  }

  void navigate(Widget route) {
    Timer(const Duration(seconds: 3), () => Get.to(() => route));
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
