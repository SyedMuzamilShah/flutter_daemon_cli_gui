import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mnm/auth_process.dart';
import 'package:mnm/core/generated/sso_google.pb.dart';

class LogoutCommand extends Command {
  @override
  final name = 'logout';
  @override
  final description = 'Logout from the application using Google SSO';

  LogoutCommand();

  @override
  void run() async {
    final client = GoogleSSOClient();
    try {
      final isLoggedIn = await client.client.isLoggedIn(AuthEmpty());
      if (!isLoggedIn.isLoggedIn) {
        stdout.writeln("User is already logged out.");
        return;
      }
      final response = await client.client.signOut(AuthEmpty());
      stdout.writeln('Logout successful! : ${response.message}');
    } catch (e) {
      stdout.writeln('Logout failed: $e');
    } finally {
      await client.shutdown();
    }
  }
}
