import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:physio_app/app/models/global.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primaryGreen,
        body: Center(
          child: Container(
            width: Get.width * 0.5,
            height: Get.height * 0.5,
            child: Image.asset("assets/logo.png"),
          ),
        ),
      ),
    );
  }
}
