import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavaData {
  static SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setDataApp({
    @required dynamic value,
    @required String key,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  static dynamic getDataApp({
    @required String key,
  }) async {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({@required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
