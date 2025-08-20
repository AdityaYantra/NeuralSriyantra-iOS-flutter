import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/accel_sample.dart';
import '../../../data/models/gyro_sample.dart';
import '../../../services/ble_providers.dart';

final accelStreamProvider = StreamProvider<AccelSample>((ref) {
  return ref.read(bleRepositoryProvider).accelStream as Stream<AccelSample>;
});

final gyroStreamProvider = StreamProvider<GyroSample>((ref) {
  return ref.read(bleRepositoryProvider).gyroStream as Stream<GyroSample>;
});
