import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gyro_sample.g.dart';

@JsonSerializable()
class GyroSample extends Equatable {
  const GyroSample({
    required this.ts,
    required this.deviceId,
    required this.x,
    required this.y,
    required this.z,
  });

  factory GyroSample.fromJson(Map<String, dynamic> json) =>
      _$GyroSampleFromJson(json);

  final DateTime ts;
  final String deviceId;
  final double x;
  final double y;
  final double z;

  Map<String, dynamic> toJson() => _$GyroSampleToJson(this);

  @override
  List<Object?> get props => [ts, deviceId, x, y, z];
}
