import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/token.dart';

final String tokenKey = 'token';
final String expiresKey = 'expires';
final String refreshKey = 'refresh';

dynamic getKey() async {
  var keyJson = await rootBundle.loadString('assets/.apikeys');
  return json.decode(keyJson);
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void setToken(Token token) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(tokenKey, token.token);
  await _prefs.setInt(expiresKey, token.expires);
  await _prefs.setString(refreshKey, token.refresh);
}

Future<Token> getToken() async {
  SharedPreferences _pref = await SharedPreferences.getInstance();
  var token = _pref.getString(tokenKey);
  var expires = _pref.getInt(expiresKey);
  var refresh = _pref.getString(refreshKey);
  if (token == null || expires == null || refresh == null) {
    return null;
  } else {
    return Token(token, expires, refresh);
  }
}
