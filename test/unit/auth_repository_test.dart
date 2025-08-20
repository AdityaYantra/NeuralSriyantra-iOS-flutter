import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:neural_sriyantra/data/repositories/auth_repository.dart';

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  group('AuthRepository', () {
    test('signOut calls FirebaseAuth.signOut', () async {
      final auth = _MockFirebaseAuth();
      final repo = AuthRepository(auth);
      when(() => auth.signOut()).thenAnswer((_) async {});
      await repo.signOut();
      verify(() => auth.signOut()).called(1);
    });
  });
}
