// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) =>
    DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  DoctorModel({
    this.uid,
    this.name,
    this.email,
    this.alamat,
    this.konsentrasi,
    this.chats,
  });

  String? uid;
  String? name;
  String? email;
  String? alamat;
  String? konsentrasi;
  List<ChatUser>? chats;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        alamat: json["alamat"],
        konsentrasi: json["konsentrasi"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "alamat": alamat,
        "konsentrasi": konsentrasi,
      };
}

class ChatUser {
  ChatUser({
    this.connection,
    this.chatId,
    this.lastTime,
    this.total_unread,
  });

  String? connection;
  String? chatId;
  String? lastTime;
  int? total_unread;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        connection: json["connection"],
        chatId: json["chat_id"],
        lastTime: json["lastTime"],
        total_unread: json["total_unread"],
      );

  Map<String, dynamic> toJson() => {
        "connection": connection,
        "chat_id": chatId,
        "lastTime": lastTime,
        "total_unread": total_unread,
      };
}
