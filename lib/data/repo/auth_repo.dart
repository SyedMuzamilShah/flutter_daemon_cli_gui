abstract class AuthClientRepo {
  Future<String> signInWithGoogle();
  Future<void> signOut();
  Future<bool> isLoggedIn();
}