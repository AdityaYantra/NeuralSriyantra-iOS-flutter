import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:neural_sriyantra/features/auth/presentation/auth_screen.dart';
import 'package:neural_sriyantra/features/auth/controllers/auth_controller.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthController extends Mock implements AuthController {}

void main() {
  testWidgets('auth screen renders buttons', (tester) async {
    final controller = _MockAuthController();
    await tester.pumpWidget(ProviderScope(overrides: [
      authControllerProvider.overrideWithValue(controller),
    ], child: const CupertinoApp(home: AuthScreen())));

    expect(find.text('Sign in with Apple'), findsOneWidget);
    expect(find.text('Sign in with Google'), findsOneWidget);
    expect(find.text('Continue with Email'), findsOneWidget);
  });
}
