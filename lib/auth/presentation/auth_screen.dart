import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/constants/asset_constants.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_task/auth/notifier/auth_notifier.dart';

class AuthScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  bool _isEmailValid(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final authNotifier = ref.read(authStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    // Email validation
                    if (!_isEmailValid(email)) {
                      _showSnackBar(context, "Invalid email format");
                      return;
                    }

                    // Password validation
                    if (password.isEmpty || password.length < 8) {
                      _showSnackBar(
                          context, "Password must be at least 8 characters");
                      return;
                    }

                    try {
                      await authNotifier.login(email, password);
                      _showSnackBar(context, "Login successful");
                    } catch (e) {
                      _showSnackBar(context, "Login failed: ${e.toString()}");
                    }
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
          if (authState.isLoading)
            Container(
              color: Colors.white.withOpacity(0.8), // Semi-transparent overlay
              child: Center(
                child: Lottie.asset(
                  AssetConstants
                      .loadingAnimation, // Replace with your Lottie animation
                  width: 450,
                  height: 450,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
