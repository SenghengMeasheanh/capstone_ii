import 'dart:convert';

import 'package:capstone_ii/data/data_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  // * Shared Preferences
  static late SharedPreferences _preferences;

  // * Authentication Info
  static const _keyAccessToken = 'token';
  static const _keyRefreshToken = 'refresh_token';

  // * User Info
  static const _keyUser = 'user';

  // * Ensure Initialized
  static Future<void> ensureInitialized() async => _preferences = await SharedPreferences.getInstance();

  // * Setter
  static Future<void> saveAccessToken(String accessToken) async {
    await _preferences.setString(_keyAccessToken, accessToken);
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    await _preferences.setString(_keyRefreshToken, refreshToken);
  }

  static Future<void> saveUser(UserModels userModels) async {
    await _preferences.setString(_keyUser, jsonEncode(userModels));
  }

  // * Getter
  static String? get getAccessToken {
    return _preferences.getString(_keyAccessToken);
  }

  static String? get getRefreshToken {
    return _preferences.getString(_keyRefreshToken);
  }

  static UserModels? get getUser {
    try {
      return UserModels.fromJson(jsonDecode(_preferences.getString(_keyUser)!));
    } catch (_) {
      return null;
    }
  }

  // * Operation
  static Future<void> clearCredential() async {
    // * Authentication Info
    await _preferences.remove(_keyAccessToken);
    await _preferences.remove(_keyRefreshToken);
    // * User Info
    await _preferences.remove(_keyUser);
  }

  static Future<void> clear() async => await _preferences.clear();
}
