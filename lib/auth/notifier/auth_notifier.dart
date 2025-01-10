import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoggedIn;
  final bool isLoading;
  final String? email;
  final String? password;

  AuthState({
    required this.isLoggedIn,
    this.isLoading = false,
    this.email,
    this.password,
  });

  AuthState copyWith(
      {bool? isLoggedIn, bool? isLoading, String? email, String? password}) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState(isLoggedIn: false));

  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true);
      // firebase login
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      state = state.copyWith(
          isLoggedIn: true, isLoading: false, email: email, password: password);
    } catch (e) {
      state = state.copyWith(isLoggedIn: false, isLoading: false);
      rethrow;
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    state = state.copyWith(isLoggedIn: false);
  }
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);
