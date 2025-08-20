part of 'accel_sample.dart';

AccelSample _$AccelSampleFromJson(Map<String, dynamic> json) => AccelSample(
      ts: DateTime.parse(json['ts'] as String),
      deviceId: json['deviceId'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );

Map<String, dynamic> _$AccelSampleToJson(AccelSample instance) =>
    <String, dynamic>{
      'ts': instance.ts.toIso8601String(),
      'deviceId': instance.deviceId,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };
