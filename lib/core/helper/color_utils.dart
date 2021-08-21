import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorUtils {
  static Color get blue => Color(0xFF00BFFE);

  static Color get blueA => Color(0xFF0277FD);

  static Color get greyBox => Color.fromARGB(255, 39, 40, 42);

  static Color get greyLight => Color(0xFFCFCFCF);

  static Color get greyLightA => Color(0xFF5D5D5D);

  static Color get lightAppBar => Color(0xFF7B7B7B).withOpacity(0.1);

  static Color get green => Color(0xFF40FF46);

  static Color get purple => Color(0xFF6e46e6);

  // static Color get yellow => Color(0xFFF1FF31);
  static Color get yellow => Theme.of(Get.context).dividerColor;

  // static LinearGradient get gradientGrey =>  LinearGradient(colors: [Color(0xFF0B0C0E), Color(0xFF313131)]);
  static LinearGradient get gradientGrey => LinearGradient(colors: [
        Theme.of(Get.context).shadowColor,
        Theme.of(Get.context).accentColor,
      ]);

  static LinearGradient get gradientBlue =>
      LinearGradient(colors: [Color(0xFF0277FD), Color(0xFF00BFFE)]);
}
