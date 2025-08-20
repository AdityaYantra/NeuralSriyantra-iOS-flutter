import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/user_profile.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../services/auth_providers.dart';

class AuthController {
  AuthController(this._repo);
  final AuthRepository _repo;

  Future<void> signOut() => _repo.signOut();
  Future<UserProfile?> signInWithGoogle() => _repo.signInWithGoogle();
  Future<UserProfile?> signInWithApple() => _repo.signInWithApple();
  Future<UserProfile?> signInWithEmail(String email, String password) =>
      _repo.signInWithEmail(email: email, password: password);
  Future<UserProfile?> signUpWithEmail(String email, String password) =>
      _repo.signUpWithEmail(email: email, password: password);
}

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref.read(authRepositoryProvider));
});

final authStateProvider = StreamProvider<UserProfile?>((ref) {
  return ref.read(authRepositoryProvider).authStateChanges();
});
