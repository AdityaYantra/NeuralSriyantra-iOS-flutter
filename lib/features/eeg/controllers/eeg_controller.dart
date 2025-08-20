import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/eeg_sample.dart';
import '../../../services/ble_providers.dart';

final eegStreamProvider = StreamProvider<EegSample>((ref) {
  return ref.read(bleRepositoryProvider).eegStream as Stream<EegSample>;
});
