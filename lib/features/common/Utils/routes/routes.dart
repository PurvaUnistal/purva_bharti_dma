import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashView:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());
      case RoutesName.loginView:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.dashboardView:
        return MaterialPageRoute(builder: (BuildContext context) => const DashboardPage());
      case RoutesName.customerRegistrationFormPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  CustomerRegistrationFormPage(
      isUpdate: false, position: 0, localData: null));
      case RoutesName.viewSyncRecordPage:
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
