import 'package:mnm/data/repo/auth_repo.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AuthSignal {
  final AuthClientRepo authRepo;

  // Reactive state
  final loading = Signal<bool>(false);
  final error = Signal<String?>(null);
  final success = Signal<String?>(null);
  final token = Signal<String?>(null);
  final loggedIn = Signal<bool>(false); // added

  AuthSignal(this.authRepo);

  Future<void> bootstrap() async {
    loading.value = true;
    try {
      final ok = await authRepo.isLoggedIn();
      loggedIn.value = ok;
      if (ok) {
        success.value = 'Signed in';
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
    }
  }

  Future<bool> isLoggedIn() async {
    return await authRepo.isLoggedIn();
  }

  Future<void> signInWithGoogle() async {
    loading.value = true;
    error.value = null;
    success.value = null;
    try {
      final t = await authRepo.signInWithGoogle();
      token.value = t;
      loggedIn.value = true;
      success.value = 'Signed in successfully';
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
    }
  }

  Future<void> signOut() async {
    loading.value = true;
    error.value = null;
    success.value = null;
    try {
      await authRepo.signOut();
      token.value = null;
      loggedIn.value = false;
      success.value = 'Signed out';
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
    }
  }
}