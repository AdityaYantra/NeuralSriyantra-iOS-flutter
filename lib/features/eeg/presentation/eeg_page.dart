import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/eeg_controller.dart';

class EegPage extends ConsumerWidget {
  const EegPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sample = ref.watch(eegStreamProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('EEG')),
      child: sample.when(
        data: (e) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text('ch1: ${e.ch1.toStringAsFixed(2)}'),
              Text('ch2: ${e.ch2.toStringAsFixed(2)}'),
              Text('ch3: ${e.ch3.toStringAsFixed(2)}'),
              Text('ch4: ${e.ch4.toStringAsFixed(2)}'),
            ],
          ),
        ),
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
