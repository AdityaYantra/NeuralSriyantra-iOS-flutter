import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ble_service.dart';
import 'flutter_blue_plus_service.dart';
import '../data/repositories/ble_repository.dart';

final bleServiceProvider = Provider<BleService>((ref) {
  return FlutterBluePlusService();
});

final bleRepositoryProvider = Provider<BleRepository>((ref) {
  return BleRepository(ref.read(bleServiceProvider));
});
