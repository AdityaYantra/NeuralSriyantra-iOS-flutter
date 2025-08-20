import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accel_sample.g.dart';

@JsonSerializable()
class AccelSample extends Equatable {
  const AccelSample({
    required this.ts,
    required this.deviceId,
    required this.x,
    required this.y,
    required this.z,
  });

  factory AccelSample.fromJson(Map<String, dynamic> json) =>
      _$AccelSampleFromJson(json);

  final DateTime ts;
  final String deviceId;
  final double x;
  final double y;
  final double z;

  Map<String, dynamic> toJson() => _$AccelSampleToJson(this);

  @override
  List<Object?> get props => [ts, deviceId, x, y, z];
}
