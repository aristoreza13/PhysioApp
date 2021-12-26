import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:physio_app/app/controllers/auth_controller.dart';
import 'package:physio_app/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<AuthController>();
  // final ThemeData light = ThemeData(
  //   brightness: Brightness.light,
  //   primaryColor: Colors.white,
  //   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
  // );

  // final ThemeData dark = ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: Color(0xFF686D76),
  //   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Get.theme.primaryColor,
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                // Judul
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    "Profil Anda",
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Foto Profil
                Container(
                  margin: EdgeInsets.fromLTRB(15, 50, 15, 15),
                  width: 175,
                  height: 175,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: authC.user.value.photoUrl == "noimage"
                        ? Image.asset(
                            "assets/logo/noimage.png",
                            fit: BoxFit.cover,
                          )
                        : Image.network(authC.user.value.photoUrl!,
                            fit: BoxFit.cover),
                  ),
                ),
                // Nama Akun
                Obx(
                  () => Text(
                    "${authC.user.value.name!}",
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Email Akun
                Obx(
                  () => Text(
                    "${authC.user.value.email!}",
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                    leading: Icon(Icons.note_add_outlined),
                    title: Text(
                      "Perbarui Data Profil",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {},
                    // => Get.changeTheme(Get.isDarkMode ? light : dark),
                    leading: Icon(Icons.color_lens),
                    title: Text(
                      "Ganti Tema",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                      ),
                    ),
                    trailing: Text(Get.isDarkMode ? "Dark" : "Light"),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => authC.logout(),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 130),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Icon(Icons.logout),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 27),
                            child: Text(
                              "Logout",
                              style: GoogleFonts.montserrat(
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(bottom: context.mediaQueryPadding.bottom + 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi-Physio App",
                  style: GoogleFonts.montserrat(
                    // color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "v.1.0",
                  style: GoogleFonts.montserrat(
                    // color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
