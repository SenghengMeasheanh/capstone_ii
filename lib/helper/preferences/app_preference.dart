import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  // * Shared Preferences
  static late SharedPreferences _preferences;

  // * Authentication Info
  static const _keyAccessToken = 'accessToken';
  static const _keyRefreshToken = 'refreshToken';

  // * User Info
  static const _keyProfile = 'profile';

  // * Ensure Initialized
  static Future<void> ensureInitialized() async => _preferences = await SharedPreferences.getInstance();

  // * Setter
  static Future<void> saveAccessToken(String accessToken) async {
    await _preferences.setString(_keyAccessToken, 'bearer $accessToken');
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    await _preferences.setString(_keyRefreshToken, refreshToken);
  }

  // * Getter
  static String? get getAccessToken {
    return _preferences.getString(_keyAccessToken);
  }

  static String? get getRefreshToken {
    return _preferences.getString(_keyRefreshToken);
  }

  // * Operation
  static Future<void> clearCredential() async {
    // * Authentication Info
    await _preferences.remove(_keyAccessToken);
    await _preferences.remove(_keyRefreshToken);
    // * User Info
    await _preferences.remove(_keyProfile);
  }

  static Future<void> clear() async => await _preferences.clear();
}
