import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'heart_rate_sample.g.dart';

@JsonSerializable()
class HeartRateSample extends Equatable {
  const HeartRateSample({
    required this.ts,
    required this.deviceId,
    required this.bpm,
  });

  factory HeartRateSample.fromJson(Map<String, dynamic> json) =>
      _$HeartRateSampleFromJson(json);

  final DateTime ts;
  final String deviceId;
  final int bpm;

  Map<String, dynamic> toJson() => _$HeartRateSampleToJson(this);

  @override
  List<Object?> get props => [ts, deviceId, bpm];
}
