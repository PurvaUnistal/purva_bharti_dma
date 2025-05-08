import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:pbg_app/Utils/common_widgets/HiveDatabase/hive_database.dart';
import 'package:pbg_app/Utils/common_widgets/res/enums.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';
import 'package:pbg_app/root.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDataBase().init();
/*  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };*/
  var configurationApp = EnvironmentConfig(
      child: Root(client: Client.purvaBharti),
      flavors: EnvironmentFlavors.pbgplDMA);
  runApp(configurationApp);
}
