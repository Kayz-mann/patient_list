// lib/content/data/patient_state.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/content/data/mock_data.dart';

// State class to handle different states
class PatientState {
  final bool isLoading;
  final List<Patient> patients;
  final String? error;
  final List<Patient> filteredPatients;
  final String searchQuery;

  PatientState({
    this.isLoading = false,
    this.patients = const [],
    this.error,
    this.filteredPatients = const [],
    this.searchQuery = '',
  });

  PatientState copyWith({
    bool? isLoading,
    List<Patient>? patients,
    String? error,
    List<Patient>? filteredPatients,
    String? searchQuery,
  }) {
    return PatientState(
      isLoading: isLoading ?? this.isLoading,
      patients: patients ?? this.patients,
      error: error ?? this.error,
      filteredPatients: filteredPatients ?? this.filteredPatients,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

// Notifier to handle state changes
class PatientNotifier extends StateNotifier<PatientState> {
  PatientNotifier() : super(PatientState()) {
    fetchPatients();
  }

  Future<void> fetchPatients() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await Future.delayed(Duration(seconds: 4));

      // Fetch mock data
      final patients = mockPatients;

      state = state.copyWith(
        isLoading: false,
        patients: patients,
        filteredPatients: patients,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load patients',
      );
    }
  }

  void searchPatients(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        filteredPatients: state.patients,
        searchQuery: query,
      );
      return;
    }

    final filteredList = state.patients.where((patient) {
      return patient.name.toLowerCase().contains(query.toLowerCase()) ||
          patient.id.toLowerCase().contains(query.toLowerCase());
    }).toList();

    state = state.copyWith(
      filteredPatients: filteredList,
      searchQuery: query,
    );
  }
}

final patientProvider =
    StateNotifierProvider<PatientNotifier, PatientState>((ref) {
  return PatientNotifier();
});
