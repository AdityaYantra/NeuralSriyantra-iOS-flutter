import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ble_service.dart';
import 'mock_ble_service.dart';
import '../data/repositories/ble_repository.dart';

final bleServiceProvider = Provider<BleService>((ref) {
  // Use mock service for development.
  return MockBleService();
});

final bleRepositoryProvider = Provider<BleRepository>((ref) {
  return BleRepository(ref.read(bleServiceProvider));
});
