import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _prefs;

  AppPreferences(this._prefs);

  // ======================
  // KEY
  // ======================
  static const _keyIsLogin = 'is_login';
  static const _keyToken = 'token';
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _keyProfile = 'profile';

  // ======================
  // LOGIN STATE
  // ======================
  Future<void> setLogin(bool value) async {
    await _prefs.setBool(_keyIsLogin, value);
  }

  bool get isLogin => _prefs.getBool(_keyIsLogin) ?? false;

  // ======================
  // AUTH DATA
  // ======================
  Future<void> saveToken({required String token}) async {
    await _prefs.setString(_keyToken, token);
  }

  String get token => _prefs.getString(_keyToken) ?? '';
  String get email => _prefs.getString(_keyEmail) ?? '';
  String get password => _prefs.getString(_keyPassword) ?? '';

  // ======================
  // PROFILE (OBJECT)
  // ======================
  Future<void> saveProfile(Map<String, dynamic> profile) async {
    await _prefs.setString(_keyProfile, jsonEncode(profile));
  }

  Map<String, dynamic>? get profile {
    final json = _prefs.getString(_keyProfile);
    if (json == null) return null;
    return jsonDecode(json);
  }

  // ======================
  // CLEAR
  // ======================
  Future<void> clearAuth() async {
    await _prefs.remove(_keyIsLogin);
    await _prefs.remove(_keyToken);
    await _prefs.remove(_keyEmail);
    await _prefs.remove(_keyPassword);
    await _prefs.remove(_keyProfile);
  }
}
