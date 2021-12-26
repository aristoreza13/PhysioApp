import 'package:google_fonts/google_fonts.dart';
import 'package:physio_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:physio_app/app/models/global.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            centerTitle: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(
                      "Cari Terapis Disekitar Anda",
                      style: GoogleFonts.montserrat(
                          fontSize: 32, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextField(
                        onChanged: (value) => controller.searchDoctor(
                          value,
                          authC.user.value.email!,
                        ),
                        controller: controller.searchC,
                        cursorColor: primaryGreen,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Mulai Percakapan",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 20,
                          ),
                          suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                            child: Icon(
                              Icons.search,
                              color: Colors.grey.shade600,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: primaryGreen,
            elevation: 0,
          )),
      body: Obx(
        () => controller.tempSearch.length == 0
            ? Center(
                child: Container(
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: Lottie.asset("assets/lottie/empty.json"),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.tempSearch.length,
                itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black26,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: controller.tempSearch[index]["photoUrl"] ==
                                  "noimage"
                              ? Image.asset(
                                  "assets/logo/noimage.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  controller.tempSearch[index]["photoUrl"],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      title: Text(
                        "${controller.tempSearch[index]["name"]}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "${controller.tempSearch[index]["email"]}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      // TODO : FIXING CONNECTION TO CHATROOM
                      trailing: GestureDetector(
                        onTap: () => authC.addNewConnection(
                          controller.tempSearch[index]["email"],
                        ),
                        child: Chip(
                          label: Text("Chat"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
