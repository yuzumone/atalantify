import 'package:atalantify/data/local/app_shared_preferences.dart';
import 'package:atalantify/data/model/token.dart';
import 'package:flutter/material.dart';

class PreferenceRepository {
  final AppSharedPreferences appSharedPreferences;
  final String tokenKey = 'token';
  final String refreshKey = 'refresh';
  final String deviceIdKey = 'device_id';

  PreferenceRepository({@required this.appSharedPreferences});

  Future<void> setToken(Token token) async {
    var _prefs = await appSharedPreferences.getInstance();
    await _prefs.setString(tokenKey, token.accessToken);
    await _prefs.setString(refreshKey, token.refreshToken);
  }

  Future<Token> getToken() async {
    var _prefs = await appSharedPreferences.getInstance();
    var token = _prefs.getString(tokenKey);
    var refresh = _prefs.getString(refreshKey);
    if (token == null || refresh == null) {
      return null;
    } else {
      return Token(accessToken: token, refreshToken: refresh);
    }
  }

  Future<void> setDeviceId(String deviceId) async {
    var _prefs = await appSharedPreferences.getInstance();
    await _prefs.setString(deviceIdKey, deviceId);
  }

  Future<String> getDeviceId() async {
    var _prefs = await appSharedPreferences.getInstance();
    return await _prefs.getString(deviceIdKey);
  }
}
