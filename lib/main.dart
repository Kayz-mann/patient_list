import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_task/auth/notifier/auth_notifier.dart';
import 'package:flutter_task/auth/presentation/auth_screen.dart';
import 'package:flutter_task/content/presentation/patient_list.dart';

// user@email.com
// password@123

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLoggedIn = ref.watch(authStateProvider).isLoggedIn;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? PatientListScreen() : AuthScreen(),
    );
  }
}
