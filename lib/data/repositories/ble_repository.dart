import '../../services/ble_service.dart';
import '../models/device_info.dart';

class BleRepository {
  BleRepository(this._service);

  final BleService _service;

  Stream<List<DeviceInfo>> scan({required bool museOnly}) =>
      _service.scan(museOnly: museOnly);

  Future<void> connect(String deviceId) => _service.connect(deviceId);
  Future<void> disconnect() => _service.disconnect();

  Stream get eegStream => _service.eegStream();
  Stream get bandPowerStream => _service.bandPowerStream();
  Stream get accelStream => _service.accelStream();
  Stream get gyroStream => _service.gyroStream();
  Stream get heartRateStream => _service.heartRateStream();
  Stream get batteryStream => _service.batteryStream();
  Stream get horseshoeStream => _service.horseshoeStream();
}
