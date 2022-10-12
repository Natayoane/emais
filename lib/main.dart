import 'package:emais/controller/auth_controller.dart';
import 'package:emais/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/articles_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart' as Splash;

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Splash.FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Get.put(AuthController());
  Get.put(ArticlesController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Splash.FlutterNativeSplash.remove();
    return GetMaterialApp(
      title: 'Emais',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.signInRoute,
      getPages: AppPages.pages,
    );
  }
}
