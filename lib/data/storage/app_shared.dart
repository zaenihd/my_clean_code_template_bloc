import 'dart:convert';
import 'package:my_clean_code_template/data/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _prefs;

  AppPreferences(this._prefs);

  // ======================
  // KEY
  // ======================
  static const _keyIsLogin = 'is_login';
  static const _keyToken = 'token';
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

  // ======================
  // PROFILE (OBJECT)
  // ======================
  Future<void> saveProfile(ProfileData profile) async {
    await _prefs.setString(_keyProfile, jsonEncode(profile.toJson()));
  }

  ProfileData? get profile {
    final jsonString = _prefs.getString(_keyProfile);
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return ProfileData.fromJson(jsonMap);
  }

  // ======================
  // CLEAR
  // ======================
  Future<void> clearToken() async {
    await _prefs.remove(_keyToken);
  }

  Future<void> clearProfile() async {
    await _prefs.remove(_keyProfile);
  }

  // await _prefs.remove(_keyProfile);
}
