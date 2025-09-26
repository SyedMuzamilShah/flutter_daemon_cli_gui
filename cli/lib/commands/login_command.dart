import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mnm/auth_process.dart';
import 'package:mnm/core/generated/sso_google.pb.dart';

class LoginCommand extends Command {
  @override
  final name = 'login';
  @override
  final description = 'Login to the application using Google SSO';

  LoginCommand();

  @override
  void run() async {
    final client = GoogleSSOClient();
    try {
      final isLoggedIn = await client.client.isLoggedIn(AuthEmpty());
      if (isLoggedIn.isLoggedIn) {
        stdout.writeln(isLoggedIn.message);
        return;
      }
      final response = await client.client.signInWithGoogle(AuthEmpty());
      stdout.writeln('Login successful! : ${response.token}');
    } catch (e) {
      stdout.writeln('Login failed: $e');
    } finally {
      await client.shutdown();
    }
  }
}
