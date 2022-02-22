import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/customtheme.dart';
import 'package:netlyfe/views/login_view.dart';
import 'package:netlyfe/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme().lightTheme,
      supportedLocales: const [Locale("en")],
      home: const SplashView()
    );
  }
}

