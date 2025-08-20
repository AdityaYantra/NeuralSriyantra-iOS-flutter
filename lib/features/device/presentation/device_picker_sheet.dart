import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/device_controller.dart';
import '../../../services/ble_providers.dart';

class DevicePickerSheet extends ConsumerWidget {
  const DevicePickerSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(deviceScanProvider);
    final repo = ref.read(bleRepositoryProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Available Muse Devices')),
      child: devices.when(
        data: (list) => ListView(
          children: [
            for (final d in list)
              ListTile(
                title: Text(d.name),
                subtitle: Text(d.id),
                onTap: () {
                  repo.connect(d.id);
                  Navigator.pop(context);
                },
              )
          ],
        ),
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
