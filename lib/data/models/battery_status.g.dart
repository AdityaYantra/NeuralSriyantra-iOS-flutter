part of 'battery_status.dart';

BatteryStatus _$BatteryStatusFromJson(Map<String, dynamic> json) =>
    BatteryStatus(
      ts: DateTime.parse(json['ts'] as String),
      deviceId: json['deviceId'] as String,
      percent: json['percent'] as int,
    );

Map<String, dynamic> _$BatteryStatusToJson(BatteryStatus instance) =>
    <String, dynamic>{
      'ts': instance.ts.toIso8601String(),
      'deviceId': instance.deviceId,
      'percent': instance.percent,
    };
