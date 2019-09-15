class Token {
  final String token;
  final int expires;
  final String refresh;

  Token(this.token, this.expires, this.refresh);

  Token.fromMap(Map<String, dynamic> map)
      : token = map['access_token'],
        expires = map['expires_in'],
        refresh = map['refresh_token'];
}
