// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vpn_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VpnServerImpl _$$VpnServerImplFromJson(Map<String, dynamic> json) =>
    _$VpnServerImpl(
      name: json['name'] as String,
      config: json['config'] as String,
      flagUrl: json['flagUrl'] as String,
      isFree: json['isFree'] as bool,
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$$VpnServerImplToJson(_$VpnServerImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'config': instance.config,
      'flagUrl': instance.flagUrl,
      'isFree': instance.isFree,
      'isAvailable': instance.isAvailable,
    };
