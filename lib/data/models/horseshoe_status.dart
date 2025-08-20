import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'horseshoe_status.g.dart';

@JsonSerializable()
class HorseshoeStatus extends Equatable {
  const HorseshoeStatus({
    required this.ts,
    required this.deviceId,
    required this.leftEar,
    required this.leftForehead,
    required this.rightForehead,
    required this.rightEar,
  });

  factory HorseshoeStatus.fromJson(Map<String, dynamic> json) =>
      _$HorseshoeStatusFromJson(json);

  final DateTime ts;
  final String deviceId;
  final int leftEar;
  final int leftForehead;
  final int rightForehead;
  final int rightEar;

  Map<String, dynamic> toJson() => _$HorseshoeStatusToJson(this);

  @override
  List<Object?> get props =>
      [ts, deviceId, leftEar, leftForehead, rightForehead, rightEar];
}
