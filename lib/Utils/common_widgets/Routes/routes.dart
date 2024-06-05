import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.dashboard:
        return MaterialPageRoute(builder: (BuildContext context) => const DashboardPage());
      case RoutesName.customerRegistrationForm:
        return MaterialPageRoute(builder: (BuildContext context) =>  RegistrationFormPage(
      isUpdate: false, position: 0, localData: null));
      case RoutesName.viewSyncRecord:
        return MaterialPageRoute(builder: (BuildContext context) => const ViewSyncRecordPage());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
