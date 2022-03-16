import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:netlyfe/database/db_helper.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/services/theme_services.dart';
import 'package:netlyfe/views/splash_view.dart';

import 'controllers/phone_auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = Get.put(PhoneAuthController());
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: NetThemes.lightMode,
        darkTheme: NetThemes.darkMode,
        themeMode: ThemeServices().theme,
        home: const SplashView());
  }
}
