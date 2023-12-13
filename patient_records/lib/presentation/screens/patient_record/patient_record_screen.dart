import 'package:flutter/material.dart';
import 'package:patient_records/presentation/common/widget/rounded_button.dart';
import 'package:patient_records/presentation/screens/patient_record/ui/information_tile.dart';

class PatientRecordScreen extends StatelessWidget {
  const PatientRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Divider(),
                const SizedBox(height: 20),
                const Text(
                  'Hi Usman,',
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.50,
                  ),
                ),
                const Divider(height: 40),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('Last modification Information'),
                        SizedBox(height: 30),
                        Text('Date: August 2, 2023'),
                        Text('Time: 23:59'),
                        Text('By: Sumaiya Khan'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const InformationTile(
                  title: 'Patient Information: ',
                  description: 'Usman Danfodio',
                ),
                const SizedBox(height: 20),
                const InformationTile(
                  title: 'Address: ',
                  description: '23, Meadows Road, Manchester City, UK.',
                ),
                const SizedBox(height: 20),
                const InformationTile(
                  title: 'Treatment type: ',
                  description: 'Diabetes',
                ),
                const SizedBox(height: 20),
                const InformationTile(
                  title: 'Cholesterol level: ',
                  description: '120',
                ),
                const SizedBox(height: 20),
                const InformationTile(
                  title: 'Weight (LB): ',
                  description: '140',
                ),
                const SizedBox(height: 20),
                const InformationTile(
                  title: 'BP 1S: ',
                  description: '34',
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      text: 'Refresh',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
