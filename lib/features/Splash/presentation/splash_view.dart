import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/enums.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    _getData();
    toLogin();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  Future<LoginModel?> _getData() async {
    try {
      String? userJson = await SharedPref.getString(key: PrefsValue.userInfo ?? "");
      if (userJson != '') {
        Map<String, dynamic> userMap = jsonDecode(userJson!);
        LoginModel loginModel = LoginModel.fromJson(userMap);
        final appConfig = AppConfig.instanceInit();
        if (appConfig != null) {
          await appConfig.setLoginData(newLoginData: loginModel);
        }
        return loginModel;
      }
    } catch (e) {
      debugPrint("Error in _getData: $e");
    }
    return null;
  }

    Future<void> toLogin() async {
      String email = await SharedPref.getString(key: PrefsValue.emailVal);
      String password = await SharedPref.getString(key: PrefsValue.passwordVal);
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      AppConfig.instanceInit()?.setBuildName(name: packageInfo.buildNumber);
      String newVersion = packageInfo.buildNumber;
      String oldVersion = await SharedPref.getString(key: PrefsValue.buildNumber);
      print("newVersion--${newVersion}");
      print("oldVersion--${oldVersion}");
      Timer(
        const Duration(seconds: 3),
            () async {
          if(oldVersion == newVersion){
            if (email.isNotEmpty || password.isNotEmpty) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashboardPage()));
            }
          } else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginView()));
          }
        },
      );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
             AppIcon.logo(),
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
