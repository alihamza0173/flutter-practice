import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_records/application/providers/login_screen_provider.dart';
import 'package:patient_records/application/router/app_routes.dart';
import 'package:patient_records/presentation/common/widget/rounded_button.dart';
import 'package:patient_records/presentation/screens/login/ui/login_textfield.dart';
// import 'package:patient_records/presentation/screens/patient_record/patient_record_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 80),
              const Text(
                'Patient Mobile App',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
              ),
              const SizedBox(height: 40),
              const LoginTextField(labelText: 'Username'),
              const SizedBox(height: 40),
              const LoginTextField(labelText: 'Password'),
              const SizedBox(height: 60),
              RoundedButton(
                onTap: () {
                  ref.read(loginScreenProvider).login();
                  context.push(AppRoutes.patientRecord);
                },
                text: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
