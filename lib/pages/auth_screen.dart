import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:mnm/state/auth_signal.dart';

class AuthScreen extends StatefulWidget {
  final AuthSignal signals;
  const AuthScreen({super.key, required this.signals});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    // Check login state on start
    Future.microtask(widget.signals.bootstrap);
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.signals;
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: Watch((context) {
          final isLoading = s.loading.value;
          final err = s.error.value;
          final ok = s.success.value;
          final tkn = s.token.value;
          final isLoggedIn = s.loggedIn.value || (tkn != null && tkn.isNotEmpty);

          if (isLoading) {
            return const CircularProgressIndicator();
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Reusable content area: Login or Home
                if (!isLoggedIn)
                  _LoginPanel(onLogin: s.signInWithGoogle)
                else
                  _HomePanel(
                    onLogout: s.signOut,
                    tokenPreview: tkn,
                  ),
                const SizedBox(height: 12),
                if (err != null) Text(err, style: const TextStyle(color: Colors.red)),
                if (ok != null) Text(ok, style: const TextStyle(color: Colors.green)),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// Reusable login view
class _LoginPanel extends StatelessWidget {
  final VoidCallback onLogin;
  const _LoginPanel({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Please sign in'),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onLogin,
          child: const Text('Sign in with Google'),
        ),
      ],
    );
  }
}

// Reusable home view
class _HomePanel extends StatelessWidget {
  final VoidCallback onLogout;
  final String? tokenPreview;
  const _HomePanel({required this.onLogout, this.tokenPreview});

  @override
  Widget build(BuildContext context) {
    final preview = (tokenPreview != null && tokenPreview!.isNotEmpty)
        ? 'Token: ${tokenPreview!.substring(0, tokenPreview!.length.clamp(12, 24))}...'
        : 'You are logged in';
    return Column(
      children: [
        Text(preview),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onLogout,
          child: const Text('Logout'),
        ),
      ],
    );
  }
}