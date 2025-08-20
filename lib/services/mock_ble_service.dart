import 'dart:async';
import 'dart:math';

import '../core/logger.dart';
import '../data/models/models.dart';
import 'ble_service.dart';

class MockBleService implements BleService {
  MockBleService();

  final _rand = Random();
  Timer? _timer;

  @override
  Stream<List<DeviceInfo>> scan({required bool museOnly}) async* {
    // Emit a single fake device after a short delay.
    await Future<void>.delayed(const Duration(milliseconds: 500));
    yield [DeviceInfo(id: 'muse-001', name: 'Muse-Mock')];
  }

  @override
  Future<void> connect(String deviceId) async {
    logger.i('Mock connect to $deviceId');
    _timer ??= Timer.periodic(const Duration(seconds: 1), (_) {});
  }

  @override
  Future<void> disconnect() async {
    _timer?.cancel();
    _timer = null;
  }

  Stream<T> _periodic<T>(T Function() generator) async* {
    while (true) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      yield generator();
    }
  }

  DateTime get _now => DateTime.now();

  @override
  Stream<EegSample> eegStream() => _periodic(() => EegSample(
        ts: _now,
        deviceId: 'muse-001',
        ch1: _rand.nextDouble(),
        ch2: _rand.nextDouble(),
        ch3: _rand.nextDouble(),
        ch4: _rand.nextDouble(),
      ));

  @override
  Stream<BandPowerSample> bandPowerStream() => _periodic(() => BandPowerSample(
        ts: _now,
        deviceId: 'muse-001',
        alpha: _rand.nextDouble(),
        beta: _rand.nextDouble(),
        theta: _rand.nextDouble(),
        delta: _rand.nextDouble(),
        gamma: _rand.nextDouble(),
      ));

  @override
  Stream<AccelSample> accelStream() => _periodic(() => AccelSample(
        ts: _now,
        deviceId: 'muse-001',
        x: _rand.nextDouble(),
        y: _rand.nextDouble(),
        z: _rand.nextDouble(),
      ));

  @override
  Stream<GyroSample> gyroStream() => _periodic(() => GyroSample(
        ts: _now,
        deviceId: 'muse-001',
        x: _rand.nextDouble(),
        y: _rand.nextDouble(),
        z: _rand.nextDouble(),
      ));

  @override
  Stream<HeartRateSample> heartRateStream() => _periodic(() => HeartRateSample(
        ts: _now,
        deviceId: 'muse-001',
        bpm: 60 + _rand.nextInt(30),
      ));

  @override
  Stream<BatteryStatus> batteryStream() => _periodic(() => BatteryStatus(
        ts: _now,
        deviceId: 'muse-001',
        percent: 80,
      ));

  @override
  Stream<HorseshoeStatus> horseshoeStream() =>
      _periodic(() => HorseshoeStatus(
            ts: _now,
            deviceId: 'muse-001',
            leftEar: _rand.nextInt(4),
            leftForehead: _rand.nextInt(4),
            rightForehead: _rand.nextInt(4),
            rightEar: _rand.nextInt(4),
          ));
}
