import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:physio_app/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Temukan Terapis Anda!",
            body:
                "Kamu bisa menemukan terapis disekitar anda. Dengan beberapa sentuhan saja",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child:
                    Lottie.asset("assets/lottie/doctor-welcoming-pacient.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Interaksi Bersama Terapis Anda!",
            body:
                "Kamu bisa berbincang langsung dengan terapis yang anda inginkan",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/online-doctor-app.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Daftar Sekarang!",
            body:
                "Dapatkan beragam kemudahan untuk konsultasi dengan satu akun",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/register.json"),
              ),
            ),
          ),
        ],
        onDone: () => Get.offAllNamed(Routes.LOGIN),
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Text(
          "Berikut",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
