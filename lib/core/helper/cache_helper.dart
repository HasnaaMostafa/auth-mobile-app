import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/core/data/models/AuthModel.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required key}) {
    return sharedPreferences?.get(key);
  }

  static Future saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences?.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences?.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences?.setBool(key, value);
    }
    return await sharedPreferences?.setDouble(key, value);
  }

  static Future<bool?> removeData({required String key}) async {
    return await sharedPreferences?.remove(key);
  }

  // static Future saveAuthModelToSharedPreferences(AuthModel authModel) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('authModel', jsonEncode(authModel.toJson()));
  // }

  static Future<void> saveModel(String key, AuthModel model) async {
    final prefs = await SharedPreferences.getInstance();
    final modelJson = model.toJson(); // Convert your model to a JSON Map
    final modelJsonString = jsonEncode(modelJson);

    await prefs.setString(key, modelJsonString);
  }

  static Future<AuthModel?> loadModelFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final modelJsonString = prefs.getString('myModelKey');

    if (modelJsonString != null) {
      final modelJson = jsonDecode(modelJsonString);
      return AuthModel.fromJson(
          modelJson); // Create a factory method in MyModel to parse JSON
    } else {
      // Handle the case when the data is not found in SharedPreferences
      return null;
    }
  }

  static Future<void> saveCredentialsToSharedPreferences(
      String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
  }

  static Future<void> saveCredentialsOfRegisterToSharedPreferences(
      String username, String password, String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
    prefs.setString('email', email);
  }

  static void populateSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');
  }
  //
  // static Object? getModel({required key}) {
  //   return sharedPreferences!.get(key);
  // }
}
