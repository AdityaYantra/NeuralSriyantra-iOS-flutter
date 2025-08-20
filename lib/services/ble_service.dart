import 'dart:async';

import '../data/models/models.dart';

/// BLE service abstraction to hide implementation details.
abstract class BleService {
  Stream<List<DeviceInfo>> scan({required bool museOnly});
  Future<void> connect(String deviceId);
  Future<void> disconnect();

  Stream<EegSample> eegStream();
  Stream<BandPowerSample> bandPowerStream();
  Stream<AccelSample> accelStream();
  Stream<GyroSample> gyroStream();
  Stream<HeartRateSample> heartRateStream();
  Stream<BatteryStatus> batteryStream();
  Stream<HorseshoeStatus> horseshoeStream();
}
