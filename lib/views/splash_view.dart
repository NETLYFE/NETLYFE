import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/screen_intents.dart';
import 'package:netlyfe/Utils/strings.dart';
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
    Timer(const Duration(seconds: 4),
        () => nextScreenReplace(context, const OnboardScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Image.asset(StringData.applogo,
                      width: 150, height: 150))),
          Expanded(
              child: Center(
                  child: Column(children: const [
            Text(
              StringData.appSlogan,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              strokeWidth: 3.0,
            )
          ])))
        ],
      ),
    );
  }
}
