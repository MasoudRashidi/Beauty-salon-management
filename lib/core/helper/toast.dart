import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/services/color_service.dart';

class ToastUtil {
  ToastUtil._();

  static void showSuccessToast({
    @required String message,
    String title,
    Duration duration = const Duration(seconds: 2),
  }) {
    Get.snackbar(
      title ?? "",
      message,
      colorText: Colors.white,
      animationDuration: duration,
      backgroundColor: Colors.green,
      icon: Icon(
        Icons.check,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
    );
  }

  static void showInformationToast({
    @required String message,
    String title,
    Duration duration = const Duration(seconds: 2),
  }) {
    Get.snackbar(
      title ?? "",
      message,
      animationDuration: duration,
      backgroundColor: Colors.blueAccent,
      icon: Icon(
        Icons.info,
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
    );
  }

  static void showErrorToast({
    @required String message,
    String title,
    Duration duration,
  }) {
    Get.snackbar(
      title ?? "",
      message,
      animationDuration: duration,
      backgroundColor: ColorService.error,
      colorText: Colors.white,
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(20),
    );
  }

  static void showCustomToast() {}
}
