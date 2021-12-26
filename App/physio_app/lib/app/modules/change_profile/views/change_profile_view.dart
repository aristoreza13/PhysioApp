import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:physio_app/app/controllers/auth_controller.dart';
import 'package:physio_app/app/models/global.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    controller.emailController.text = authC.user.value.email!;
    controller.nameController.text = authC.user.value.name!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: primaryGreen,
        title: Text(
          "Ubah Profil",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authC.changeProfile(controller.nameController.text);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 50, 15, 15),
              width: 175,
              height: 175,
              child: Obx(
                () => ClipRRect(
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
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.emailController,
              readOnly: true,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  // color: Get.isDarkMode ? Colors.white : Colors.black,
                  color: Colors.black54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.nameController,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                authC.changeProfile(controller.nameController.text);
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: "Nama",
                labelStyle: TextStyle(
                  // color: Get.isDarkMode ? Colors.white : Colors.black,
                  color: Colors.black54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<ChangeProfileController>(
                    builder: (c) => c.pickedImage != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 110,
                                width: 125,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(c.pickedImage!.path),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -10,
                                      right: -5,
                                      child: IconButton(
                                        onPressed: () => c.resetImage(),
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red[900],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () => c
                                    .uploadImage(authC.user.value.uid!)
                                    .then((hasilKembalian) {
                                  if (hasilKembalian != null) {
                                    authC.updatePhotoUrl(hasilKembalian);
                                  }
                                }),
                                child: Text(
                                  "upload",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Text("no image"),
                  ),
                  TextButton(
                    onPressed: () => controller.selectImage(),
                    child: Text(
                      "chosen",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
