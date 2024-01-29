import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/domain/bloc/booking_registration_form_bloc.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/presentation/widget/app_string.dart';
import 'ExportFile/export_file.dart';

String dataBoxName = "dataBoxName";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<SaveCustomerRegistrationOfflineModel>(
      SaveCustomerRegistrationOfflineModelAdapter());
  await Hive.openBox<SaveCustomerRegistrationOfflineModel>(
      "saveCustRegDataBoxName");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => BookingRegistrationFormBloc()),
      ],
      child: MaterialApp(
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
