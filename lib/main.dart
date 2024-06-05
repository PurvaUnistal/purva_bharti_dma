import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/Routes/routes.dart';
import 'package:pbg_app/features/Login/domain/bloc/login_bloc.dart';
import 'package:pbg_app/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:pbg_app/features/internet/bloc/internet_bloc.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/bloc/view_sync_record_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDataBase().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => InternetBloc()),
        BlocProvider(create: (BuildContext context) => LoginBloc()),
        BlocProvider(create: (BuildContext context) => DashboardBloc()),
        BlocProvider(create: (BuildContext context) => RegistrationFormBloc()),
        BlocProvider(create: (BuildContext context) => ViewSyncRecordBloc()),
      ],
      child: MaterialApp(
        title: AppString.appName,
        theme: ThemeData(
          primaryColor: Colors.green.shade800,
          hintColor: Colors.green.shade800,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor:  Colors.green.shade800),
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
       /* home: MainScreen(),*/
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
