import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

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
