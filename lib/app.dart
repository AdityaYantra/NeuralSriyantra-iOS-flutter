import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/auth/presentation/auth_screen.dart';
import 'features/home/presentation/home_shell.dart';
import 'features/auth/controllers/auth_controller.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(brightness: Brightness.dark),
      home: user.when(
        data: (u) => u != null ? const HomeShell() : const AuthScreen(),
        loading: () => const CupertinoPageScaffold(child: Center(child: CupertinoActivityIndicator())),
        error: (e, _) => CupertinoPageScaffold(child: Center(child: Text('Error: $e'))),
      ),
    );
  }
}
