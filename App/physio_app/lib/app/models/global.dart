//class untuk membuat color sendiri dengan HexColor
import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColor(String hex) {
    String formattedHex = "FF" + hex.toUpperCase().replaceAll("#", "");
    return int.parse(formattedHex, radix: 16);
  }

  HexColor(final String hex) : super(_getColor(hex));
}

Color fountainBlue = HexColor('#55c6c9');
Color turquoise = HexColor('#30D5C8');
Color chathamsBlue = HexColor('#135466');
Color primaryGreen = HexColor('#23AFA4');
Color voyage = HexColor('#536B98');

//Membuat text style baru
TextStyle selamatDatangStyle = new TextStyle(
    fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 40);
