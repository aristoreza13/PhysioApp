import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/joanna.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Nama Akun
                Text(
                  "Lorem Ipsum",
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Email Akun
                Text(
                  "lorem.ipsum@gmail.com",
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
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
                    onTap: () {
                      // logout(context);
                    },
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
                    leading: Icon(Icons.note_add_outlined),
                    title: Text(
                      "Ganti Tema",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                      ),
                    ),
                    trailing: Text("Light"),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
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
                  style: GoogleFonts.montserrat(color: Colors.black54),
                ),
                Text(
                  "v.1.0",
                  style: GoogleFonts.montserrat(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
