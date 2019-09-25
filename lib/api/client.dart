import 'package:atalantify/model/token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/_model.dart';

final String currentlyUrl = 'https://api.spotify.com/v1/me/player/currently-playing';

class SpotifyClient {
  final Token _token;

  SpotifyClient(this._token);

  Map<String, String> _getHeader() {
    return {'Authorization': "Bearer ${_token.token}"};
  }

  Future<CurrentlyPlaying> getCurrentlyPlaying() async {
    var res = await http.get(currentlyUrl, headers: _getHeader());
    if (res.statusCode != 200) {
      return null;
    }
    return CurrentlyPlaying.fromJson(json.decode(res.body));
  }
}