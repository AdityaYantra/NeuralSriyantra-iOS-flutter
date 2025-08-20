part of 'band_power_sample.dart';

BandPowerSample _$BandPowerSampleFromJson(Map<String, dynamic> json) =>
    BandPowerSample(
      ts: DateTime.parse(json['ts'] as String),
      deviceId: json['deviceId'] as String,
      alpha: (json['alpha'] as num).toDouble(),
      beta: (json['beta'] as num).toDouble(),
      theta: (json['theta'] as num).toDouble(),
      delta: (json['delta'] as num).toDouble(),
      gamma: (json['gamma'] as num).toDouble(),
    );

Map<String, dynamic> _$BandPowerSampleToJson(BandPowerSample instance) =>
    <String, dynamic>{
      'ts': instance.ts.toIso8601String(),
      'deviceId': instance.deviceId,
      'alpha': instance.alpha,
      'beta': instance.beta,
      'theta': instance.theta,
      'delta': instance.delta,
      'gamma': instance.gamma,
    };
