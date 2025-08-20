import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controllers/auth_controller.dart';
import '../controllers/settings_controller.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).value;
    final auth = ref.read(authControllerProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Settings')),
      child: SafeArea(
        child: Column(
          children: [
            if (profile != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('${profile.email} (${profile.providers.join(',')})'),
              ),
            CupertinoButton(
              onPressed: () => auth.signOut(),
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
