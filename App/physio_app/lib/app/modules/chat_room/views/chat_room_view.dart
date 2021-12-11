import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:physio_app/app/models/global.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarChatRoom(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  ChatItem(
                    isSender: true,
                  ),
                  ChatItem(
                    isSender: false,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.emoji_emotions_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryGreen,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(Icons.send, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBarChatRoom() {
    return AppBar(
      backgroundColor: primaryGreen,
      leadingWidth: 100,
      leading: InkWell(
        onTap: () => Get.back(),
        borderRadius: BorderRadius.circular(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 5),
            Icon(Icons.arrow_back),
            SizedBox(width: 5),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Image.asset("assets/images/joanna.png"),
            ),
          ],
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama Dokter',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Status Dokter',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
      centerTitle: false,
    );
  }
}

// Class untuk isi chat. ada fungsi untuk menentukan letak chat
// apabila itu sender atau receiver
class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.isSender,
  }) : super(key: key);

  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: isSender
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
            ),
            color: primaryGreen,
            padding: EdgeInsets.all(15),
            child: Text(
              "data",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 5),
          Text("data"),
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
