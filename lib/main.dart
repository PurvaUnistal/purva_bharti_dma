import 'package:flutter/material.dart';
import '../../ExportFile/export_file.dart';
import 'models/save_customer_registration_offline_model.dart';


String dataBoxName= "dataBoxName";


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<SaveCustomerRegistrationOfflineModel>(SaveCustomerRegistrationOfflineModelAdapter());
  await Hive.openBox<SaveCustomerRegistrationOfflineModel>("saveCustRegDataBoxName");

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HPCL',
      theme: ThemeData(
        primaryColor: Colors.blue.shade900,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     home: SplashScreen(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }
}

