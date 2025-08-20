import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/auth_repository.dart';
import '../data/models/user_profile.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<UserProfile?>((ref) {
  return ref.read(authRepositoryProvider).authStateChanges();
});
