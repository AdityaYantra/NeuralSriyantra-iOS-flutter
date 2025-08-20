import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/auth_controller.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(authControllerProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('NeuralSriYantra')),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () => controller.signInWithApple(),
                child: const Text('Sign in with Apple'),
              ),
              CupertinoButton(
                onPressed: () => controller.signInWithGoogle(),
                child: const Text('Sign in with Google'),
              ),
              CupertinoButton(
                onPressed: () {
                  // For brevity, sign in with dummy credentials
                  controller.signInWithEmail('test@example.com', 'password');
                },
                child: const Text('Continue with Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
