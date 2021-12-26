import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:physio_app/app/controllers/auth_controller.dart';
import 'package:physio_app/app/models/global.dart';
import 'package:physio_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(170),
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            centerTitle: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(Routes.SEARCH),
                        child: Icon(
                          Icons.search,
                          size: 35,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: "Halo, ",
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: "${authC.user.value.name}",
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.PROFILE),
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 20,
                          height: 50,
                          child: Icon(
                            Icons.account_box,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Terapis Anda",
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: primaryGreen,
            elevation: 0,
          )),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: controller.chatStream(authC.user.value.email!),
              builder: (context, snapshot1) {
                if (snapshot1.connectionState == ConnectionState.active) {
                  var listDocChats = snapshot1.data!.docs;
                  return Obx(() => controller
                              .doctorStream(authC.user.value.email!) ==
                          0
                      ? Center(
                          child: Container(
                            width: Get.width * 0.7,
                            height: Get.width * 0.7,
                            child:
                                Lottie.asset("assets/lottie/chat-bubbles.json"),
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: listDocChats.length,
                          itemBuilder: (context, index) {
                            return StreamBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                stream: controller.doctorStream(
                                    listDocChats[index]["connection"]),
                                builder: (context, snapshot2) {
                                  if (snapshot2.connectionState ==
                                      ConnectionState.active) {
                                    var data = snapshot2.data!.data();
                                    return ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        onTap: () => controller.goToChatRoom(
                                            "${listDocChats[index].id}",
                                            authC.user.value.email!,
                                            listDocChats[index]["connection"]),
                                        leading: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.black26,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child:
                                                data!["photoUrl"] == "noimage"
                                                    ? Image.asset(
                                                        "assets/logo/noimage.png",
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.network(
                                                        "${data["photoUrl"]}",
                                                        fit: BoxFit.cover,
                                                      ),
                                          ),
                                        ),
                                        title: Text(
                                          "${data["name"]}",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        subtitle: Text(
                                          "${data["email"]}",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        trailing: listDocChats[index]
                                                    ["total_unread"] ==
                                                0
                                            ? SizedBox()
                                            : Chip(
                                                backgroundColor: primaryGreen,
                                                label: Text(
                                                  "${listDocChats[index]["total_unread"]}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                        onLongPress: () {
                                          showModalBottomSheet<void>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  child: new Wrap(
                                                      children: <Widget>[
                                                        new ListTile(
                                                            leading: new Icon(
                                                                Icons.delete),
                                                            title: new Text(
                                                                'Delete'),
                                                            onTap: () {}),
                                                      ]),
                                                );
                                              });
                                        });
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });
                          }));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
