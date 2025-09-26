import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:mnm/state/auth_signal.dart';

class AuthScreen extends StatelessWidget {
  final AuthSignal signals;
  const AuthScreen({super.key, required this.signals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: Watch((context) {
          final isLoading = signals.loading.value;
          final err = signals.error.value;
          final ok = signals.success.value;
          final tkn = signals.token.value;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading) const CircularProgressIndicator(),
                if (!isLoading) ...[
                  ElevatedButton(
                    onPressed: () => signals.signInWithGoogle(),
                    child: const Text('Sign in with Google'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => signals.signOut(),
                    child: const Text('Sign out'),
                  ),
                ],
                const SizedBox(height: 12),
                if (err != null) Text(err, style: const TextStyle(color: Colors.red)),
                if (ok != null) Text(ok, style: const TextStyle(color: Colors.green)),
                if (tkn != null) Text('Token: ${tkn.substring(0, tkn.length.clamp(0, 12))}...'),
              ],
            ),
          );
        }),
      ),
    );
  }
}