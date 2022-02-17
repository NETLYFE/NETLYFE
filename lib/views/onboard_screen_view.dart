import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:netlyfe/Utils/onboard_list.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        pages: pageList,
      )
    ]));
  }
}
