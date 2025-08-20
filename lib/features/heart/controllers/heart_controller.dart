import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/heart_rate_sample.dart';
import '../../../services/ble_providers.dart';

final heartStreamProvider = StreamProvider<HeartRateSample>((ref) {
  return ref.read(bleRepositoryProvider).heartRateStream as Stream<HeartRateSample>;
});
