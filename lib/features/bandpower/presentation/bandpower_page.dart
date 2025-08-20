import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/bandpower_controller.dart';

class BandPowerPage extends ConsumerWidget {
  const BandPowerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sample = ref.watch(bandPowerStreamProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Band Power')),
      child: sample.when(
        data: (e) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text('α: ${e.alpha.toStringAsFixed(2)}'),
              Text('β: ${e.beta.toStringAsFixed(2)}'),
              Text('θ: ${e.theta.toStringAsFixed(2)}'),
              Text('δ: ${e.delta.toStringAsFixed(2)}'),
              Text('γ: ${e.gamma.toStringAsFixed(2)}'),
            ],
          ),
        ),
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
