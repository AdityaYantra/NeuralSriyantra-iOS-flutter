import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/band_power_sample.dart';
import '../../../services/ble_providers.dart';

final bandPowerStreamProvider = StreamProvider<BandPowerSample>((ref) {
  return ref.read(bleRepositoryProvider).bandPowerStream as Stream<BandPowerSample>;
});
