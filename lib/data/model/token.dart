import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
abstract class Token with _$Token {
  factory Token({
    @JsonKey(name: 'access_token')
    String accessToken,
    @JsonKey(name: 'refresh_token')
    String refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
