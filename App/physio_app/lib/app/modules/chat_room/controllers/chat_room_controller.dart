import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatRoomController extends GetxController {
  late TextEditingController chatC;
  late ScrollController scrollC;
  int total_unread = 0;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamChats(String chat_id) {
    CollectionReference chats = firestore.collection("chats");

    return chats.doc(chat_id).collection("chat").orderBy("time").snapshots();
  }

  Stream<DocumentSnapshot<Object?>> streamFriendData(String doctorEmail) {
    CollectionReference users = firestore.collection("users");

    return users.doc(doctorEmail).snapshots();
  }

  void newChat(String email, Map<String, dynamic> argument, String chat) async {
    if (chat != "") {
      CollectionReference chats = firestore.collection("chats");
      CollectionReference users = firestore.collection("users");

      String date = DateTime.now().toIso8601String();

      await chats.doc(argument["chat_id"]).collection("chat").add({
        "pengirim": email,
        "penerima": argument["doctorEmail"],
        "msg": chat,
        "time": date,
        "isRead": false,
        "groupTime": DateFormat.yMMMMd('en_US').format(DateTime.parse(date)),
      });

      Timer(
        Duration.zero,
        () => scrollC.jumpTo(scrollC.position.maxScrollExtent),
      );

      chatC.clear();

      await users
          .doc(email)
          .collection("chats")
          .doc(argument["chat_id"])
          .update({
        "lastTime": date,
      });

      final checkChatsDoctor = await users
          .doc(argument["doctorEmail"])
          .collection("chats")
          .doc(argument["chat_id"])
          .get();

      if (checkChatsDoctor.exists) {
        // exist on friend DB
        // first check total unread
        final checkTotalUnread = await chats
            .doc(argument["chat_id"])
            .collection("chat")
            .where("isRead", isEqualTo: false)
            .where("pengirim", isEqualTo: email)
            .get();

        // total unread for friend
        total_unread = checkTotalUnread.docs.length;

        await users
            .doc(argument["doctorEmail"])
            .collection("chats")
            .doc(argument["chat_id"])
            .update({"lastTime": date, "total_unread": total_unread});
      } else {
        // not exist on friend DB
        await users
            .doc(argument["doctorEmail"])
            .collection("chats")
            .doc(argument["chat_id"])
            .set({
          "connection": email,
          "lastTime": date,
          "total_unread": 1,
        });
      }
    }
  }

  @override
  void onInit() {
    chatC = TextEditingController();
    scrollC = ScrollController();

    super.onInit();
  }

  @override
  void onClose() {
    chatC.dispose();
    scrollC.dispose();
    super.onClose();
  }
}
