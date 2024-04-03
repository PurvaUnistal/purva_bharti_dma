import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';
import 'package:pbg_app/common/Utils/common_widget/app_string.dart';
import 'package:pbg_app/common/Utils/routes/routes.dart';
import 'package:pbg_app/common/Utils/routes/routes_name.dart';
import 'package:pbg_app/features/customRegistrationForm/domain/bloc/custom_registration_form_bloc.dart';
import 'package:pbg_app/features/internet/bloc/internet_bloc.dart';
import 'package:pbg_app/features/login/domain/bloc/login_bloc.dart';
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
