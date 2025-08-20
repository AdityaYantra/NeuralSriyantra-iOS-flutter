part of 'heart_rate_sample.dart';

HeartRateSample _$HeartRateSampleFromJson(Map<String, dynamic> json) =>
    HeartRateSample(
      ts: DateTime.parse(json['ts'] as String),
      deviceId: json['deviceId'] as String,
      bpm: json['bpm'] as int,
    );

Map<String, dynamic> _$HeartRateSampleToJson(HeartRateSample instance) =>
    <String, dynamic>{
      'ts': instance.ts.toIso8601String(),
      'deviceId': instance.deviceId,
      'bpm': instance.bpm,
    };
