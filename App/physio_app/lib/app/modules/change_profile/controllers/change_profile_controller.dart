import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController nameController;

  @override
  void onInit() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
