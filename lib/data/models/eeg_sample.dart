import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'eeg_sample.g.dart';

@JsonSerializable()
class EegSample extends Equatable {
  const EegSample({
    required this.ts,
    required this.deviceId,
    required this.ch1,
    required this.ch2,
    required this.ch3,
    required this.ch4,
  });

  factory EegSample.fromJson(Map<String, dynamic> json) =>
      _$EegSampleFromJson(json);

  final DateTime ts;
  final String deviceId;
  final double ch1;
  final double ch2;
  final double ch3;
  final double ch4;

  Map<String, dynamic> toJson() => _$EegSampleToJson(this);

  @override
  List<Object?> get props => [ts, deviceId, ch1, ch2, ch3, ch4];
}
