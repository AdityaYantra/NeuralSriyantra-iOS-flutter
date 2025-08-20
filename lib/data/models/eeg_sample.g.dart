part of 'eeg_sample.dart';

EegSample _$EegSampleFromJson(Map<String, dynamic> json) => EegSample(
      ts: DateTime.parse(json['ts'] as String),
      deviceId: json['deviceId'] as String,
      ch1: (json['ch1'] as num).toDouble(),
      ch2: (json['ch2'] as num).toDouble(),
      ch3: (json['ch3'] as num).toDouble(),
      ch4: (json['ch4'] as num).toDouble(),
    );

Map<String, dynamic> _$EegSampleToJson(EegSample instance) => <String, dynamic>{
      'ts': instance.ts.toIso8601String(),
      'deviceId': instance.deviceId,
      'ch1': instance.ch1,
      'ch2': instance.ch2,
      'ch3': instance.ch3,
      'ch4': instance.ch4,
    };
