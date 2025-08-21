import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../data/models/device_info.dart';
import '../data/models/models.dart';
import 'ble_service.dart';

/// BLE service implementation using flutter_blue_plus.
class FlutterBluePlusService implements BleService {
  FlutterBluePlusService();

  @override
  Stream<List<DeviceInfo>> scan({required bool museOnly}) async* {
    final results = <DeviceInfo>[];
    final sub = FlutterBluePlus.scanResults.listen((r) {
      results
        ..clear()
        ..addAll(r
            .where((s) => !museOnly || s.advertisementData.advName.contains('Muse'))
            .map((s) => DeviceInfo(
                  id: s.device.remoteId.str,
                  name: s.device.platformName,
                  rssi: s.rssi,
                )));
    });
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
    await Future<void>.delayed(const Duration(seconds: 4));
    await FlutterBluePlus.stopScan();
    await sub.cancel();
    yield results;
  }

  @override
  Future<void> connect(String deviceId) async {
    final device = BluetoothDevice.fromId(deviceId);
    await device.connect();
  }

  @override
  Future<void> disconnect() async {
    for (final d in await FlutterBluePlus.connectedDevices) {
      await d.disconnect();
    }
  }

  @override
  Stream<EegSample> eegStream() => const Stream.empty();

  @override
  Stream<BandPowerSample> bandPowerStream() => const Stream.empty();

  @override
  Stream<AccelSample> accelStream() => const Stream.empty();

  @override
  Stream<GyroSample> gyroStream() => const Stream.empty();

  @override
  Stream<HeartRateSample> heartRateStream() => const Stream.empty();

  @override
  Stream<BatteryStatus> batteryStream() => const Stream.empty();

  @override
  Stream<HorseshoeStatus> horseshoeStream() => const Stream.empty();
}
