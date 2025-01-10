// lib/data/mock_patients.dart

import 'package:flutter_task/content/presentation/patient_list.dart';

class Patient {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String contact;
  final String email;
  final Map<String, String> address;
  final List<Map<String, dynamic>> medicalRecords;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.contact,
    required this.email,
    required this.address,
    required this.medicalRecords,
  });

  String get initials =>
      name.split(' ').map((e) => e[0]).take(2).join('').toUpperCase();
}

final List<Patient> mockPatients = [
  Patient(
    id: 'pat001',
    name: 'John Doe',
    age: 45,
    gender: 'Male',
    contact: '+1-800-555-1111',
    email: 'johndoe@gmail.com',
    address: {
      'street': '456 Heartbeat Lane',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec001',
        'date': '2025-01-05',
        'department': 'Cardiology',
        'doctor': 'Dr. Emily Johnson',
        'diagnosis': 'Hypertension',
        'treatment': 'Prescribed ACE inhibitors',
        'notes': 'Monitor blood pressure weekly.',
      }
    ],
  ),
  Patient(
    id: 'pat002',
    name: 'Sarah Miller',
    age: 32,
    gender: 'Female',
    contact: '+1-800-555-2222',
    email: 'sarah.miller@gmail.com',
    address: {
      'street': '789 Wellness Drive',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec002',
        'date': '2025-01-08',
        'department': 'Neurology',
        'doctor': 'Dr. Alan Cooper',
        'diagnosis': 'Chronic Migraine',
        'treatment': 'Prescribed preventive medication',
        'notes': 'Keep headache diary for tracking triggers.',
      }
    ],
  ),
  Patient(
    id: 'pat003',
    name: 'Robert Chen',
    age: 58,
    gender: 'Male',
    contact: '+1-800-555-3333',
    email: 'robert.chen@gmail.com',
    address: {
      'street': '234 Health Avenue',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec003',
        'date': '2025-01-10',
        'department': 'Cardiology',
        'doctor': 'Dr. Emily Johnson',
        'diagnosis': 'Atrial Fibrillation',
        'treatment': 'Started on anticoagulation therapy',
        'notes': 'Schedule follow-up in 2 weeks.',
      }
    ],
  ),
  Patient(
    id: 'pat004',
    name: 'Emily Thompson',
    age: 28,
    gender: 'Female',
    contact: '+1-800-555-4444',
    email: 'emily.t@gmail.com',
    address: {
      'street': '567 Care Court',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec004',
        'date': '2025-01-12',
        'department': 'Neurology',
        'doctor': 'Dr. Alan Cooper',
        'diagnosis': 'Multiple Sclerosis',
        'treatment': 'Started immunomodulator therapy',
        'notes': 'Monthly follow-up required.',
      }
    ],
  ),
  Patient(
    id: 'pat005',
    name: 'Michael Rodriguez',
    age: 41,
    gender: 'Male',
    contact: '+1-800-555-5555',
    email: 'mrodriguez@gmail.com',
    address: {
      'street': '890 Medical Park',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec005',
        'date': '2025-01-15',
        'department': 'Cardiology',
        'doctor': 'Dr. Emily Johnson',
        'diagnosis': 'Coronary Artery Disease',
        'treatment': 'Prescribed statins and aspirin',
        'notes': 'Lifestyle modifications discussed.',
      }
    ],
  ),
  Patient(
    id: 'pat006',
    name: 'Lisa Wang',
    age: 35,
    gender: 'Female',
    contact: '+1-800-555-6666',
    email: 'lwang@gmail.com',
    address: {
      'street': '123 Recovery Road',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec006',
        'date': '2025-01-18',
        'department': 'Neurology',
        'doctor': 'Dr. Alan Cooper',
        'diagnosis': 'Epilepsy',
        'treatment': 'Started anticonvulsant therapy',
        'notes': 'Maintain seizure diary.',
      }
    ],
  ),
  Patient(
    id: 'pat007',
    name: 'James Wilson',
    age: 52,
    gender: 'Male',
    contact: '+1-800-555-7777',
    email: 'jwilson@gmail.com',
    address: {
      'street': '456 Healing Path',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec007',
        'date': '2025-01-20',
        'department': 'Cardiology',
        'doctor': 'Dr. Emily Johnson',
        'diagnosis': 'Heart Failure',
        'treatment': 'Prescribed beta blockers and diuretics',
        'notes': 'Daily weight monitoring advised.',
      }
    ],
  ),
  Patient(
    id: 'pat008',
    name: 'Maria Garcia',
    age: 39,
    gender: 'Female',
    contact: '+1-800-555-8888',
    email: 'mgarcia@gmail.com',
    address: {
      'street': '789 Wellness Way',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec008',
        'date': '2025-01-22',
        'department': 'Neurology',
        'doctor': 'Dr. Alan Cooper',
        'diagnosis': 'Tension Headache',
        'treatment': 'Prescribed muscle relaxants',
        'notes': 'Stress management techniques discussed.',
      }
    ],
  ),
  Patient(
    id: 'pat009',
    name: 'David Kim',
    age: 47,
    gender: 'Male',
    contact: '+1-800-555-9999',
    email: 'dkim@gmail.com',
    address: {
      'street': '234 Care Circle',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec009',
        'date': '2025-01-25',
        'department': 'Cardiology',
        'doctor': 'Dr. Emily Johnson',
        'diagnosis': 'Angina',
        'treatment': 'Prescribed nitroglycerin',
        'notes': 'Exercise stress test scheduled.',
      }
    ],
  ),
  Patient(
    id: 'pat010',
    name: 'Amanda Foster',
    age: 31,
    gender: 'Female',
    contact: '+1-800-555-1010',
    email: 'afoster@gmail.com',
    address: {
      'street': '567 Health Street',
      'city': 'Springfield',
      'state': 'IL',
      'zip': '62704',
    },
    medicalRecords: [
      {
        'recordId': 'rec010',
        'date': '2025-01-28',
        'department': 'Neurology',
        'doctor': 'Dr. Alan Cooper',
        'diagnosis': 'Vertigo',
        'treatment': 'Prescribed vestibular suppressants',
        'notes': 'Balance therapy recommended.',
      }
    ],
  ),
];
