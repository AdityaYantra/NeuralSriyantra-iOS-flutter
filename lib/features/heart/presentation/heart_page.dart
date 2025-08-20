import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/heart_controller.dart';

class HeartPage extends ConsumerWidget {
  const HeartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sample = ref.watch(heartStreamProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Heart Rate')),
      child: sample.when(
        data: (e) => Center(
          child: Text('${e.bpm} bpm', style: const TextStyle(fontSize: 32)),
        ),
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
