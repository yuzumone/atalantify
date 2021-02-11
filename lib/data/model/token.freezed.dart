// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
class _$TokenTearOff {
  const _$TokenTearOff();

// ignore: unused_element
  _Token call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken}) {
    return _Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

// ignore: unused_element
  Token fromJson(Map<String, Object> json) {
    return Token.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Token = _$TokenTearOff();

/// @nodoc
mixin _$Token {
  @JsonKey(name: 'access_token')
  String get accessToken;
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res> implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  final Token _value;
  // ignore: unused_field
  final $Res Function(Token) _then;

  @override
  $Res call({
    Object accessToken = freezed,
    Object refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
    ));
  }
}

/// @nodoc
abstract class _$TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$TokenCopyWith(_Token value, $Res Function(_Token) then) =
      __$TokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class __$TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res>
    implements _$TokenCopyWith<$Res> {
  __$TokenCopyWithImpl(_Token _value, $Res Function(_Token) _then)
      : super(_value, (v) => _then(v as _Token));

  @override
  _Token get _value => super._value as _Token;

  @override
  $Res call({
    Object accessToken = freezed,
    Object refreshToken = freezed,
  }) {
    return _then(_Token(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Token implements _Token {
  _$_Token(
      {@JsonKey(name: 'access_token') this.accessToken,
      @JsonKey(name: 'refresh_token') this.refreshToken});

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$_$_TokenFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString() {
    return 'Token(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Token &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(refreshToken);

  @JsonKey(ignore: true)
  @override
  _$TokenCopyWith<_Token> get copyWith =>
      __$TokenCopyWithImpl<_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TokenToJson(this);
  }
}

abstract class _Token implements Token {
  factory _Token(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken}) = _$_Token;

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$TokenCopyWith<_Token> get copyWith;
}
