import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/customtheme.dart';
import 'package:netlyfe/views/splash_view.dart';

void main() => runApp(DevicePreview(
    enabled: !kReleaseMode, builder: ((context) => const MyApp())));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: CustomTheme().lightTheme,
        home: const SplashView());

  }
}
