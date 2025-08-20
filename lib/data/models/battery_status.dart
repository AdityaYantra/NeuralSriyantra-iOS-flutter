import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'battery_status.g.dart';

@JsonSerializable()
class BatteryStatus extends Equatable {
  const BatteryStatus({
    required this.ts,
    required this.deviceId,
    required this.percent,
  });

  factory BatteryStatus.fromJson(Map<String, dynamic> json) =>
      _$BatteryStatusFromJson(json);

  final DateTime ts;
  final String deviceId;
  final int percent;

  Map<String, dynamic> toJson() => _$BatteryStatusToJson(this);

  @override
  List<Object?> get props => [ts, deviceId, percent];
}
