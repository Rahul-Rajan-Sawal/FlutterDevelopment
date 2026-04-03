import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/common/encryption_util.dart';
import 'package:flutter_bottom_nav/common/progress_dialog.dart';
import 'package:flutter_bottom_nav/core/static_variables.dart';
import 'package:flutter_bottom_nav/database/database_helper.dart';
import 'package:flutter_bottom_nav/models/contact_Model.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

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

  static Future<bool> isPrivacyFlag()async{

    try{
      final db = await DatabaseHelper.instance.database;

      final result = await db.query(
        'iUser',
        where: 'UserId = ?',
        whereArgs: [encryptIfNotEmpty(StaticVariables.mSAPCode)],
      );


      if(result.isNotEmpty){
        String EncryptedPFlag = result.first['Privacy_Flag']?.toString() ?? '';

        String DecryptedPFlag = decryptIfNotEmpty(EncryptedPFlag);
        
        return DecryptedPFlag.trim().toUpperCase()=='Y';
      }

      return false;

    }catch(e){
      print("Error Getting Privacy Flag : $e");
      return false;
    }
  }

Future<List<ContactModel>> getContactFrmCustCnct(
  Database db,
  String customerCode,
  String type,
) async {
  try {
    final result = await db.query(
      'CUSTOMER_CONTACT',
      where: 'CustomerCode = ? AND Type = ?',
      whereArgs: [customerCode, type],
    );

    return result.map((row) {
      final encryptedContact = row['Contact'] as String? ?? '';

      return ContactModel(
        custCode: row['CustomerCode'].toString(),
        type: row['Type'].toString(),
        contact: decryptIfNotEmpty(encryptedContact),
      );
    }).toList();
  } catch (e) {
    print("Error fetching contacts: $e");
    return [];
  }
}

}
