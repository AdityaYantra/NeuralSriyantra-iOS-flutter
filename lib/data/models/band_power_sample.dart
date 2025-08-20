import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'band_power_sample.g.dart';

@JsonSerializable()
class BandPowerSample extends Equatable {
  const BandPowerSample({
    required this.ts,
    required this.deviceId,
    required this.alpha,
    required this.beta,
    required this.theta,
    required this.delta,
    required this.gamma,
  });

  factory BandPowerSample.fromJson(Map<String, dynamic> json) =>
      _$BandPowerSampleFromJson(json);

  final DateTime ts;
  final String deviceId;
  final double alpha;
  final double beta;
  final double theta;
  final double delta;
  final double gamma;

  Map<String, dynamic> toJson() => _$BandPowerSampleToJson(this);

  @override
  List<Object?> get props => [
        ts,
        deviceId,
        alpha,
        beta,
        theta,
        delta,
        gamma,
      ];
}
