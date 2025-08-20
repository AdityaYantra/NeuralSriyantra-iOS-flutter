import 'package:flutter_test/flutter_test.dart';

import 'package:neural_sriyantra/services/mock_ble_service.dart';

void main() {
  test('mock BLE emits eeg samples', () async {
    final service = MockBleService();
    await service.connect('muse-001');
    final sample = await service.eegStream().first;
    expect(sample.deviceId, 'muse-001');
  });
}
