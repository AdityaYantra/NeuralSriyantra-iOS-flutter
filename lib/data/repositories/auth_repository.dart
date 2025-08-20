import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../core/logger.dart';
import '../models/user_profile.dart';

class AuthRepository {
  AuthRepository(this._auth);

  final FirebaseAuth _auth;

  Stream<UserProfile?> authStateChanges() {
    return _auth.authStateChanges().map((user) {
      if (user == null) return null;
      return UserProfile(
        uid: user.uid,
        email: user.email ?? '',
        providers: user.providerData.map((e) => e.providerId).toList(),
      );
    });
  }

  Future<UserProfile?> signInWithGoogle() async {
    try {
      final account = await GoogleSignIn().signIn();
      if (account == null) return null;
      final auth = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );
      final userCred = await _auth.signInWithCredential(credential);
      final user = userCred.user!;
      return UserProfile(
        uid: user.uid,
        email: user.email ?? '',
        providers: user.providerData.map((e) => e.providerId).toList(),
      );
    } catch (e) {
      logger.e('Google sign-in failed', error: e);
      rethrow;
    }
  }

  Future<UserProfile?> signInWithApple() async {
    try {
      final appleId = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
        ],
      );
      final oauth = OAuthProvider('apple.com');
      final credential = oauth.credential(
        idToken: appleId.identityToken,
        accessToken: appleId.authorizationCode,
      );
      final userCred = await _auth.signInWithCredential(credential);
      final user = userCred.user!;
      return UserProfile(
        uid: user.uid,
        email: user.email ?? '',
        providers: user.providerData.map((e) => e.providerId).toList(),
      );
    } catch (e) {
      logger.e('Apple sign-in failed', error: e);
      rethrow;
    }
  }

  Future<UserProfile?> signInWithEmail(
      {required String email, required String password}) async {
    final userCred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final user = userCred.user!;
    return UserProfile(
      uid: user.uid,
      email: user.email ?? '',
      providers: user.providerData.map((e) => e.providerId).toList(),
    );
  }

  Future<UserProfile?> signUpWithEmail(
      {required String email, required String password}) async {
    final userCred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = userCred.user!;
    return UserProfile(
      uid: user.uid,
      email: user.email ?? '',
      providers: user.providerData.map((e) => e.providerId).toList(),
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
