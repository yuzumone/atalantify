// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Device _$_$_DeviceFromJson(Map<String, dynamic> json) {
  return _$_Device(
    id: json['id'] as String,
    isActive: json['is_active'] as bool,
    isPricateSession: json['is_private_session'] as bool,
    isRestricted: json['is_restricted'] as bool,
    name: json['name'] as String,
    type: json['type'] as String,
    volumePercent: json['volume_percent'] as int,
  );
}

Map<String, dynamic> _$_$_DeviceToJson(_$_Device instance) => <String, dynamic>{
      'id': instance.id,
      'is_active': instance.isActive,
      'is_private_session': instance.isPricateSession,
      'is_restricted': instance.isRestricted,
      'name': instance.name,
      'type': instance.type,
      'volume_percent': instance.volumePercent,
    };
