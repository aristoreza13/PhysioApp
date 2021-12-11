import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.red[900],
        title: Text("Ubah Profil"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
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
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage("assets/images/joanna.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black,
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
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: "Nama",
                labelStyle: TextStyle(
                  color: Colors.black,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("data"),
                  TextButton(
                    onPressed: () {},
                    child: Text("Pilih Foto",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
