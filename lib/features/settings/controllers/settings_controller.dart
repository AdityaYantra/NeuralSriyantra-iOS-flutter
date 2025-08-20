import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/device_info.dart';
import '../../../data/models/user_profile.dart';
import '../../../services/auth_providers.dart';
import '../../../services/ble_providers.dart';

final deviceScanProvider = StreamProvider<List<DeviceInfo>>((ref) {
  return ref.read(bleRepositoryProvider).scan(museOnly: true);
});

final profileProvider = authStateProvider;
