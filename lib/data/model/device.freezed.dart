// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
class _$DeviceTearOff {
  const _$DeviceTearOff();

// ignore: unused_element
  _Device call(
      {String id,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_private_session') bool isPricateSession,
      @JsonKey(name: 'is_restricted') bool isRestricted,
      String name,
      String type,
      @JsonKey(name: 'volume_percent') int volumePercent}) {
    return _Device(
      id: id,
      isActive: isActive,
      isPricateSession: isPricateSession,
      isRestricted: isRestricted,
      name: name,
      type: type,
      volumePercent: volumePercent,
    );
  }

// ignore: unused_element
  Device fromJson(Map<String, Object> json) {
    return Device.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Device = _$DeviceTearOff();

/// @nodoc
mixin _$Device {
  String get id;
  @JsonKey(name: 'is_active')
  bool get isActive;
  @JsonKey(name: 'is_private_session')
  bool get isPricateSession;
  @JsonKey(name: 'is_restricted')
  bool get isRestricted;
  String get name;
  String get type;
  @JsonKey(name: 'volume_percent')
  int get volumePercent;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_private_session') bool isPricateSession,
      @JsonKey(name: 'is_restricted') bool isRestricted,
      String name,
      String type,
      @JsonKey(name: 'volume_percent') int volumePercent});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res> implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  final Device _value;
  // ignore: unused_field
  final $Res Function(Device) _then;

  @override
  $Res call({
    Object id = freezed,
    Object isActive = freezed,
    Object isPricateSession = freezed,
    Object isRestricted = freezed,
    Object name = freezed,
    Object type = freezed,
    Object volumePercent = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      isActive: isActive == freezed ? _value.isActive : isActive as bool,
      isPricateSession: isPricateSession == freezed
          ? _value.isPricateSession
          : isPricateSession as bool,
      isRestricted:
          isRestricted == freezed ? _value.isRestricted : isRestricted as bool,
      name: name == freezed ? _value.name : name as String,
      type: type == freezed ? _value.type : type as String,
      volumePercent: volumePercent == freezed
          ? _value.volumePercent
          : volumePercent as int,
    ));
  }
}

/// @nodoc
abstract class _$DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$DeviceCopyWith(_Device value, $Res Function(_Device) then) =
      __$DeviceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_private_session') bool isPricateSession,
      @JsonKey(name: 'is_restricted') bool isRestricted,
      String name,
      String type,
      @JsonKey(name: 'volume_percent') int volumePercent});
}

/// @nodoc
class __$DeviceCopyWithImpl<$Res> extends _$DeviceCopyWithImpl<$Res>
    implements _$DeviceCopyWith<$Res> {
  __$DeviceCopyWithImpl(_Device _value, $Res Function(_Device) _then)
      : super(_value, (v) => _then(v as _Device));

  @override
  _Device get _value => super._value as _Device;

  @override
  $Res call({
    Object id = freezed,
    Object isActive = freezed,
    Object isPricateSession = freezed,
    Object isRestricted = freezed,
    Object name = freezed,
    Object type = freezed,
    Object volumePercent = freezed,
  }) {
    return _then(_Device(
      id: id == freezed ? _value.id : id as String,
      isActive: isActive == freezed ? _value.isActive : isActive as bool,
      isPricateSession: isPricateSession == freezed
          ? _value.isPricateSession
          : isPricateSession as bool,
      isRestricted:
          isRestricted == freezed ? _value.isRestricted : isRestricted as bool,
      name: name == freezed ? _value.name : name as String,
      type: type == freezed ? _value.type : type as String,
      volumePercent: volumePercent == freezed
          ? _value.volumePercent
          : volumePercent as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Device implements _Device {
  _$_Device(
      {this.id,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'is_private_session') this.isPricateSession,
      @JsonKey(name: 'is_restricted') this.isRestricted,
      this.name,
      this.type,
      @JsonKey(name: 'volume_percent') this.volumePercent});

  factory _$_Device.fromJson(Map<String, dynamic> json) =>
      _$_$_DeviceFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_private_session')
  final bool isPricateSession;
  @override
  @JsonKey(name: 'is_restricted')
  final bool isRestricted;
  @override
  final String name;
  @override
  final String type;
  @override
  @JsonKey(name: 'volume_percent')
  final int volumePercent;

  @override
  String toString() {
    return 'Device(id: $id, isActive: $isActive, isPricateSession: $isPricateSession, isRestricted: $isRestricted, name: $name, type: $type, volumePercent: $volumePercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Device &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)) &&
            (identical(other.isPricateSession, isPricateSession) ||
                const DeepCollectionEquality()
                    .equals(other.isPricateSession, isPricateSession)) &&
            (identical(other.isRestricted, isRestricted) ||
                const DeepCollectionEquality()
                    .equals(other.isRestricted, isRestricted)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.volumePercent, volumePercent) ||
                const DeepCollectionEquality()
                    .equals(other.volumePercent, volumePercent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(isPricateSession) ^
      const DeepCollectionEquality().hash(isRestricted) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(volumePercent);

  @JsonKey(ignore: true)
  @override
  _$DeviceCopyWith<_Device> get copyWith =>
      __$DeviceCopyWithImpl<_Device>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DeviceToJson(this);
  }
}

abstract class _Device implements Device {
  factory _Device(
      {String id,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_private_session') bool isPricateSession,
      @JsonKey(name: 'is_restricted') bool isRestricted,
      String name,
      String type,
      @JsonKey(name: 'volume_percent') int volumePercent}) = _$_Device;

  factory _Device.fromJson(Map<String, dynamic> json) = _$_Device.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_private_session')
  bool get isPricateSession;
  @override
  @JsonKey(name: 'is_restricted')
  bool get isRestricted;
  @override
  String get name;
  @override
  String get type;
  @override
  @JsonKey(name: 'volume_percent')
  int get volumePercent;
  @override
  @JsonKey(ignore: true)
  _$DeviceCopyWith<_Device> get copyWith;
}
