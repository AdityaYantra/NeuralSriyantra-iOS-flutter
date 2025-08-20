import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/motion_controller.dart';

class MotionPage extends ConsumerWidget {
  const MotionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accel = ref.watch(accelStreamProvider);
    final gyro = ref.watch(gyroStreamProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Motion')),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            accel.when(
              data: (a) => Text('Accel x:${a.x.toStringAsFixed(2)} y:${a.y.toStringAsFixed(2)} z:${a.z.toStringAsFixed(2)}'),
              loading: () => const CupertinoActivityIndicator(),
              error: (e, _) => Text('Accel error: $e'),
            ),
            const SizedBox(height: 16),
            gyro.when(
              data: (g) => Text('Gyro x:${g.x.toStringAsFixed(2)} y:${g.y.toStringAsFixed(2)} z:${g.z.toStringAsFixed(2)}'),
              loading: () => const CupertinoActivityIndicator(),
              error: (e, _) => Text('Gyro error: $e'),
            ),
          ],
        ),
      ),
    );
  }
}
