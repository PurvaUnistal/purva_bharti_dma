import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/common/Utils/Hive/hive_ex.dart';
import 'package:pbg_app/common/Utils/Hive/hive_functions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  await HiveFunctions.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => InternetBloc()),
        BlocProvider(create: (BuildContext context) => LoginBloc()),
        BlocProvider(create: (BuildContext context) => CustomRegistrationFormBloc()),
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
        initialRoute: RoutesName.splashView,
        onGenerateRoute: Routes.generateRoute,
       /* home: MainScreen(),*/
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
