import 'package:go_router/go_router.dart';
import 'package:patient_records/application/router/app_routes.dart';
import 'package:patient_records/presentation/screens/error/error_screen.dart';
import 'package:patient_records/presentation/screens/login/login_screen.dart';
import 'package:patient_records/presentation/screens/patient_record/patient_record_screen.dart';

final AppRouter appRouterSingleton = AppRouter();

class AppRouter {
  String get initialAppResolver {
    return AppRoutes.login;
  }

  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
            path: AppRoutes.patientRecord,
            builder: (context, state) => const PatientRecordScreen()),
      ],
      errorBuilder: (context, state) => const ErrorScreen(),
      initialLocation: initialAppResolver,
    );
  }
}
