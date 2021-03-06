import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  late TextEditingController searchC;

  var queryAwal = [].obs;
  var tempSearch = [].obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void searchDoctor(String data, String email) async {
    print("SEARCH : $data");

    if (data.length == 0) {
      queryAwal.value = [];
      tempSearch.value = [];
    } else {
      var kapital = data.substring(0, 1).toUpperCase() + data.substring(1);
      print(kapital);

      if (queryAwal.length == 0 && data.length == 1) {
        // fungsi yang akan dijalankan pada 1 huruf pertama
        CollectionReference users = await firestore.collection("users");
        final result = await users
            .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
            .where("email", isNotEqualTo: email)
            .get();

        print("Total Data : ${result.docs.length}");
        if (result.docs.length > 0) {
          for (int i = 0; i < result.docs.length; i++) {
            queryAwal.add(result.docs[i].data() as Map<String, dynamic>);
          }
          print("Hasil Kueri : ");
          print(queryAwal);
        } else {
          print("Tidak ada hasil");
        }
      }

      if (queryAwal.length != 0) {
        tempSearch.value = [];
        queryAwal.forEach((element) {
          if (element["name"].startsWith(kapital)) {
            tempSearch.add(element);
          }
        });
      }
    }
    queryAwal.refresh();
    tempSearch.refresh();
  }

  @override
  void onInit() {
    searchC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchC.dispose();
    super.onClose();
  }
}
