import 'dart:async';

import '../models/telemetry_record.dart';
import 'ble_repository.dart';

class StreamRepository {
  StreamRepository(this._ble);

  final BleRepository _ble;

  Stream<TelemetryRecord> mergedStream() {
    final controller = StreamController<TelemetryRecord>();

    controller.onListen = () {
      _ble.eegStream.listen((e) {
        controller.add(TelemetryEeg(e));
      });
      _ble.bandPowerStream.listen((e) {
        controller.add(TelemetryBandPower(e));
      });
      _ble.accelStream.listen((e) {
        controller.add(TelemetryAccel(e));
      });
      _ble.gyroStream.listen((e) {
        controller.add(TelemetryGyro(e));
      });
      _ble.heartRateStream.listen((e) {
        controller.add(TelemetryHeartRate(e));
      });
      _ble.batteryStream.listen((e) {
        controller.add(TelemetryBattery(e));
      });
      _ble.horseshoeStream.listen((e) {
        controller.add(TelemetryHorseshoe(e));
      });
    };

    return controller.stream;
  }
}
