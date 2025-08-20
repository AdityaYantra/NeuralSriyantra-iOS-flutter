part of 'device_info.dart';

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) => DeviceInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      firmware: json['firmware'] as String?,
      battery: json['battery'] as int?,
      rssi: json['rssi'] as int?,
    );

Map<String, dynamic> _$DeviceInfoToJson(DeviceInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'firmware': instance.firmware,
      'battery': instance.battery,
      'rssi': instance.rssi,
    };
