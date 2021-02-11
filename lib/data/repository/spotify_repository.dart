import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:atalantify/data/model/device.dart';
import 'package:atalantify/data/model/token.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyRepository {
  static const clientId = bool.hasEnvironment('SPOTIFY_CLIENT_ID')
      ? String.fromEnvironment('SPOTIFY_CLIENT_ID')
      : '';
  static const clientSecret = bool.hasEnvironment('SPOTIFY_CLIENT_SECRET')
      ? String.fromEnvironment('SPOTIFY_CLIENT_SECRET')
      : '';
  static const redirectUrl = bool.hasEnvironment('SPOTIFY_REDIRECT_URL')
      ? String.fromEnvironment('SPOTIFY_REDIRECT_URL')
      : 'http://localhost:8080/';
  static const authorizationEndpoint = 'https://accounts.spotify.com/authorize';
  static const tokenEndpoint = 'https://accounts.spotify.com/api/token';
  final Client client;

  SpotifyRepository({@required this.client});

  Future<Stream<String>> _server() async {
    final onCode = StreamController<String>();
    var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
    server.listen((request) async {
      final code = request.uri.queryParameters['code'];
      request.response
        ..statusCode = 200
        ..headers.set('Content-Type', ContentType.html.mimeType)
        ..write('close this window');
      await request.response.close();
      await server.close(force: true);
      onCode.add(code);
      await onCode.close();
    });
    return onCode.stream;
  }

  Future<Token> getAuthToken() async {
    final scopes = [
      'user-read-playback-state',
      'user-modify-playback-state',
      'user-read-currently-playing',
    ];
    var onCode = await _server();
    var param =
        '?client_id=$clientId&response_type=code&scope=${scopes.join('%20')}&redirect_uri=$redirectUrl';
    await launch('$authorizationEndpoint$param');
    var code = await onCode.first;
    var token = _token(code);
    return token;
  }

  Future<Token> _token(String code) async {
    var encodedSecret =
        base64.encode(utf8.encode('$clientId:$clientSecret'));
    var data = {
      'code': code,
      'redirect_uri': redirectUrl,
      'grant_type': 'authorization_code'
    };
    var header = {'Authorization': 'Basic $encodedSecret'};
    var res = await client.post(tokenEndpoint, headers: header, body: data);
    return Token.fromJson(json.decode(res.body));
  }

  Future<Token> refreshAuthToken(Token token) async {
    var data = {
      'grant_type': 'refresh_token',
      'refresh_token': token.refreshToken,
    };
    var encodedSecret =
        base64.encode(utf8.encode('$clientId:$clientSecret'));
    var header = {'Authorization': 'Basic $encodedSecret'};
    var res = await client.post(tokenEndpoint, headers: header, body: data);
    var accessToken = json.decode(res.body)['access_token'];
    return token.copyWith(accessToken: accessToken);
  }

  Future<List<Device>> getDevices(Token token) async {
    var headers = {'Authorization': 'Bearer ${token.accessToken}'};
    var devices = <Device>[];
    var res = await client.get('https://api.spotify.com/v1/me/player/devices',
        headers: headers);
    if (res.statusCode < 300) {
      var d = json.decode(res.body)['devices'];
      d.forEach((e) => devices.add(Device.fromJson(e)));
    }
    return devices;
  }

  Future<bool> transferPlayback(Token token, String device) async {
    var body = {
      'device_ids': [device]
    };
    var headers = {'Authorization': 'Bearer ${token.accessToken}'};
    var res = await client.put('https://api.spotify.com/v1/me/player',
        headers: headers, body: json.encode(body));
    return res.statusCode < 300 ? true : false;
  }
}
