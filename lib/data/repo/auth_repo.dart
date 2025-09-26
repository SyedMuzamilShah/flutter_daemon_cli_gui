abstract class AuthRepo {
  Future<String> signInWithGoogle();
  Future<void> signOut();
}