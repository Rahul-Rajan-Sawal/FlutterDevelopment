import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/common/encryption_util.dart';
import 'package:flutter_bottom_nav/common/progress_dialog.dart';

class CommonUtil {
  static void show(BuildContext context, {String message = "Please wait..."}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => ProgressDialogWidget(message: message),
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static String encryptIfNotEmpty(dynamic value) {
    if (value == null) return "";
    final str = value.toString().trim();
    if (str.isEmpty) return "";
    return EncryptionUtil.encrypt(str);
  }

  static String decryptIfNotEmpty(dynamic value) {
    if (value == null) return "";
    final str = value.toString().trim();
    if (str.isEmpty) return "";
    try {
      return EncryptionUtil.decrypt(str);
    } catch (_) {
      return str;
    }
  }

  static String getValueInLakh(double value) {
    if (value <= 0) return "0.00";

    double amountInLakh = value / 100000;
    return amountInLakh.toStringAsFixed(2);
  }

  static double calculatePercentage(int value, int total) {
    if (total == 0) return 0.0;
    return (value * 100) / total;
  }
}
