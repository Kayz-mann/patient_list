import 'package:flutter/material.dart';
import 'package:flutter_task/content/data/mock_data.dart';
import 'package:flutter_task/content/widgets/info_card.dart';
import 'package:flutter_task/content/widgets/info_row.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientDetailsScreen extends StatelessWidget {
  final Patient patient;

  const PatientDetailsScreen({Key? key, required this.patient})
      : super(key: key);

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  patient.initials,
                  style: TextStyle(fontSize: 32, color: Colors.blue.shade900),
                ),
              ),
            ),
            SizedBox(height: 24),
            InfoCard(
              title: 'Personal Information',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoRow(label: 'Name', value: patient.name),
                  InfoRow(label: 'Age', value: patient.age.toString()),
                  InfoRow(label: 'Gender', value: patient.gender),
                  InfoRow(label: 'Email', value: patient.email),
                ],
              ),
            ),
            SizedBox(height: 16),
            InfoCard(
              title: 'Address',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoRow(label: 'Street', value: patient.address['street']!),
                  InfoRow(label: 'City', value: patient.address['city']!),
                  InfoRow(label: 'State', value: patient.address['state']!),
                  InfoRow(label: 'ZIP', value: patient.address['zip']!),
                ],
              ),
            ),
            SizedBox(height: 16),
            InfoCard(
              title: 'Medical Records',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: patient.medicalRecords.map((record) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoRow(label: 'Date', value: record['date']),
                        InfoRow(
                            label: 'Department', value: record['department']),
                        InfoRow(label: 'Doctor', value: record['doctor']),
                        InfoRow(label: 'Diagnosis', value: record['diagnosis']),
                        InfoRow(label: 'Treatment', value: record['treatment']),
                        InfoRow(label: 'Notes', value: record['notes']),
                        Divider(),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.phone),
                label: const Text('Call Patient'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: () => _makePhoneCall(patient.contact),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
