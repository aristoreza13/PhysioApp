import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:physio_app/app/controllers/auth_controller.dart';
import 'package:physio_app/app/utils/error_screen.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/loading_screen.dart';
import 'app/utils/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: Routes.LOGIN,
            getPages: AppPages.routes,
          );
          //       return FutureBuilder(
          //         future: Future.delayed(
          //           Duration(seconds: 3),
          //         ),
          //         builder: (context, snapshot) {
          //           if (snapshot.connectionState == ConnectionState.done) {
          //             return Obx(
          //               () => GetMaterialApp(
          //                 title: "Application",
          //                 initialRoute: authC.isSkipIntro.isTrue
          //                     ? authC.isAuth.isTrue
          //                         ? Routes.HOME
          //                         : Routes.LOGIN
          //                     : Routes.INTRODUCTION,
          //                 getPages: AppPages.routes,
          //               ),
          //             );
          //           }
          //           return SplashScreen();
          //         },
          //       );
        }
        return LoadingScreen();
      },
    );
  }
}