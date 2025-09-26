import 'package:mnm/data/repo/auth_repo.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AuthSignal {
  final AuthRepo authRepo;

  // Reactive state
  final loading = Signal<bool>(false);
  final error = Signal<String?>(null);
  final success = Signal<String?>(null);
  final token = Signal<String?>(null);

  AuthSignal(this.authRepo);

  Future<void> signInWithGoogle() async {
    loading.value = true;
    error.value = null;
    success.value = null;
    try {
      final t = await authRepo.signInWithGoogle();
      token.value = t;
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
      success.value = 'Signed out';
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
    }
  }
}