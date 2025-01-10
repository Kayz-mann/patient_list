import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/auth/notifier/auth_notifier.dart';
import 'package:flutter_task/constants/asset_constants.dart';
import 'package:flutter_task/content/data/mock_data.dart';
import 'package:flutter_task/content/notifier/patient_notifier.dart';

import 'package:flutter_task/content/presentation/patient_details.dart';
import 'package:lottie/lottie.dart';

class PatientListScreen extends ConsumerWidget {
  PatientListScreen({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              AssetConstants
                  .loadingAnimation, // Replace with your Lottie animation
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 26),
          Text(
            'Loading patients...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_off,
            size: 64,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            'No patients found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Try adjusting your search criteria',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[400],
          ),
          SizedBox(height: 16),
          Text(
            error,
            style: TextStyle(
              fontSize: 18,
              color: Colors.red[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientList(List<Patient> patients) {
    return ListView.builder(
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Text(patient.initials),
          ),
          title: Text(patient.name),
          subtitle: Text('ID: ${patient.id}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PatientDetailsScreen(patient: patient),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final patientState = ref.watch(patientProvider);
    final patientNotifier = ref.read(patientProvider.notifier);

    final userInitials = authState.email?.substring(0, 2).toUpperCase() ?? 'UN';

    return Scaffold(
      appBar: AppBar(
        title: Text('Patients'),
        leading: Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Text(
              userInitials,
              style: TextStyle(color: Colors.blue.shade900),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => ref.read(authStateProvider.notifier).logout(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) => patientNotifier.searchPatients(query),
              decoration: InputDecoration(
                hintText: 'Search by name or patient ID',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: patientState.isLoading
                  ? _buildLoadingState()
                  : patientState.error != null
                      ? _buildErrorState(patientState.error!)
                      : patientState.filteredPatients.isEmpty
                          ? _buildEmptyState()
                          : _buildPatientList(patientState.filteredPatients),
            ),
          ),
        ],
      ),
    );
  }
}
