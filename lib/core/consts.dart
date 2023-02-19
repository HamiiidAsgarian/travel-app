import 'package:flutter/material.dart';

class AppConsts {
  static Color mainRed = Colors.red;
  static Color mainGreen = Colors.green;
  static Color mainBlue = const Color(0xFF5082ff);
  static Color secondBlue = const Color(0xFF76abfb);
  static Color thirdBlue = const Color(0xFF739dff);

  ///Tabbar seleted color

  static void snackbar(context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }
}
