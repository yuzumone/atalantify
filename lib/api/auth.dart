import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils.dart';
import '../model/token.dart';

final authUrl = 'https://accounts.spotify.com/authorize';
final tokenUrl = 'https://accounts.spotify.com/api/token';

Future<Stream<String>> _server() async {
  final StreamController<String> onCode = new StreamController();
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  server.listen((HttpRequest request) async {
    final String code = request.uri.queryParameters["code"];
    request.response
      ..statusCode = 200
      ..headers.set("Content-Type", ContentType.html.mimeType)
      ..write("<html><h1>You can now close this window</h1></html>");
    await request.response.close();
    await server.close(force: true);
    onCode.add(code);
    await onCode.close();
  });
  return onCode.stream;
}

Future<Token> authSpotify(String clientId, String secretId) async {
  Stream<String> onCode = await _server();
  List<String> scopes = [
    'user-read-currently-playing',
    'user-library-modify',
    'playlist-read-private',
    'playlist-modify-public',
    'playlist-modify-private'
  ];
  String _authUrl =
      "$authUrl?client_id=$clientId&response_type=code&scope=${scopes.join('%20')}&redirect_uri=http://localhost:8080/";
  launchURL(_authUrl);
  final String code = await onCode.first;
  String encodedSecret = base64.encode(utf8.encode("$clientId:$secretId"));
  var data = {
    'code': code,
    'redirect_uri': 'http://localhost:8080/',
    'grant_type': 'authorization_code'
  };
  var header = {'Authorization': "Basic $encodedSecret"};
  var res = await http.post(tokenUrl, headers: header, body: data);
  return Token.fromMap(json.decode(res.body));
}

Future<Token> refreshToken(String clientId, String secretId, Token token) async {
  var data = {
    'grant_type': 'refresh_token',
    'refresh_token': token.refresh,
  };
  String encodedSecret = base64.encode(utf8.encode("$clientId:$secretId"));
  var header = {'Authorization': "Basic $encodedSecret"};
  var res = await http.post(tokenUrl, headers: header, body: data);
  return Token.fromMap(json.decode(res.body));
}