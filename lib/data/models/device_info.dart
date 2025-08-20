import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_info.g.dart';

@JsonSerializable()
class DeviceInfo extends Equatable {
  const DeviceInfo({
    required this.id,
    required this.name,
    this.firmware,
    this.battery,
    this.rssi,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);

  final String id;
  final String name;
  final String? firmware;
  final int? battery;
  final int? rssi;

  Map<String, dynamic> toJson() => _$DeviceInfoToJson(this);

  DeviceInfo copyWith({
    String? id,
    String? name,
    String? firmware,
    int? battery,
    int? rssi,
  }) =>
      DeviceInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        firmware: firmware ?? this.firmware,
        battery: battery ?? this.battery,
        rssi: rssi ?? this.rssi,
      );

  @override
  List<Object?> get props => [id, name, firmware, battery, rssi];
}
