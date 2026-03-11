import 'package:flutter_bottom_nav/core/network/key_decryptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future<void> saveKeys() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    await prefs.setString("server", KeyDecryptor.serverKey);
    await prefs.setString("pad", KeyDecryptor.pad);
    await prefs.setString("api_key", KeyDecryptor.apiKey);
    await prefs.setString("shared_key", KeyDecryptor.sharedKey);
    await prefs.setString("dbKey", KeyDecryptor.dbKey);
    await prefs.setString("Authorization", KeyDecryptor.authorization);
  }
}
