import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_records/application/router/app_routes.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox.fromSize(
        size: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿Whot 😀?'),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: () {
                  context.go(AppRoutes.login);
                },
                child: const Text('go back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
