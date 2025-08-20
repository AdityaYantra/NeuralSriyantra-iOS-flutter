part of 'horseshoe_status.dart';

HorseshoeStatus _$HorseshoeStatusFromJson(Map<String, dynamic> json) =>
    HorseshoeStatus(
      ts: DateTime.parse(json['ts'] as String),
      deviceId: json['deviceId'] as String,
      leftEar: json['leftEar'] as int,
      leftForehead: json['leftForehead'] as int,
      rightForehead: json['rightForehead'] as int,
      rightEar: json['rightEar'] as int,
    );

Map<String, dynamic> _$HorseshoeStatusToJson(HorseshoeStatus instance) =>
    <String, dynamic>{
      'ts': instance.ts.toIso8601String(),
      'deviceId': instance.deviceId,
      'leftEar': instance.leftEar,
      'leftForehead': instance.leftForehead,
      'rightForehead': instance.rightForehead,
      'rightEar': instance.rightEar,
    };
