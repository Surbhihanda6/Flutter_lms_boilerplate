import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../modules/login/model/user_model.dart';
import '../constants.dart';

class AppStorage {
  AppStorage._();

  // static SharedPreferences? _storage;
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> init() async {
    // _storage = await SharedPreferences.getInstance();
  }

  // Obtain shared preferences.

  static Future<void> saveValue(String key, dynamic value) async =>
      await _secureStorage.write(key: key, value: value);

  static Future<String?> getValue<T>(String key) async =>
      await _secureStorage.read(key: key);

  static Future<bool> hasData(String key) async =>
      await _secureStorage.read(key: key) != null;

  static Future<void> removeValue(String key) =>
      _secureStorage.delete(key: key);

  static Future<void> clearStorage() => _secureStorage.deleteAll();

  static Future<void> saveUserModel(UserModel model) async {
    // cache the access token as well
    await saveAccessToken(model.userSession.accessToken);
    await saveRefreshToken(model.userSession.refreshToken);
    String jsonString = jsonEncode(model.toJson());
    await _secureStorage.write(key: StorageKeys.userDetail, value: jsonString);
  }

  static Future<UserModel?> getUserModel() async {
    String? jsonString = await _secureStorage.read(key: StorageKeys.userDetail);
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return UserModel.fromJson(jsonMap);
    }
    return null;
  }

  static Future<void> clearUserDetails() async {
    return await _secureStorage.delete(key: StorageKeys.userDetail);
  }

  // ...

  static Future<bool> saveAccessToken(String token) async {
    try {
      await _secureStorage.write(key: StorageKeys.accessToken, value: token);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> getAccessToken() async {
    try {
      String? x = await _secureStorage.read(key: StorageKeys.accessToken);
      return x;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> deleteAccessToken() async {
    try {
      await _secureStorage.delete(key: StorageKeys.accessToken);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> saveRefreshToken(String token) async {
    try {
      await _secureStorage.write(key: StorageKeys.refreshToken, value: token);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> getRefreshToken() async {
    try {
      return await _secureStorage.read(key: StorageKeys.refreshToken);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> deleteRefreshToken() async {
    try {
      await _secureStorage.delete(key: StorageKeys.refreshToken);
      return true;
    } catch (e) {
      return false;
    }
  }
}
