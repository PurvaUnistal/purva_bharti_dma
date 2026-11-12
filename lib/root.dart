import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/singleton.dart';

import 'Service/api_server_dio.dart';
import 'Utils/common_widgets/res/app_navigator.dart';
import 'Utils/common_widgets/res/enums.dart';
import 'Utils/common_widgets/res/environment_config.dart';
import 'features/RegistrationForm/helper/registration_sync_service.dart';
import 'features/internet/bloc/internet_bloc.dart';

class Root extends StatefulWidget {
  final Client client;
  const Root({super.key, required this.client});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with WidgetsBindingObserver {

  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppConfig.init(context);
    ApiHelperDio.init();
    AppConfig.instanceInit()!.setClient(client: widget.client);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: EnvironmentConfig.of(context)?.primaryTheme,
      ),
    );
  }

  @override
  void dispose() {
    RegistrationSyncService.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Singleton.instanceInit()?.context = context;
    final primary = EnvironmentConfig.of(context)!.primaryTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InternetBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => DashboardBloc()),
        BlocProvider(create: (_) => RegistrationFormBloc()),
        BlocProvider(create: (_) => ViewSyncRecordBloc()),
      ],
      child: MaterialApp(
        navigatorKey: AppNavigator.navigatorKey,
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primary,
          hintColor: primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
        ),
        home: SplashView(),
      ),
    );
  }
}