import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';



String dataBoxName = "dataBoxName";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  // await Hive.initFlutter();
  // Hive.registerAdapter<SaveCustomerRegistrationOfflineModel>(SaveCustomerRegistrationOfflineModelAdapter());
  // await Hive.openBox<SaveCustomerRegistrationOfflineModel>("saveCustRegDataBoxName");
  await HiveDataBase.init();

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
        initialRoute: RoutesName.splashView,
        onGenerateRoute: Routes.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
