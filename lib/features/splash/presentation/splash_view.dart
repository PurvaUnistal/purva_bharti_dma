import 'package:flutter/material.dart';
import 'package:hpcl_app/ExportFile/export_file.dart';
import 'package:hpcl_app/features/common/Utils/common_widget/app_string.dart';
import 'package:hpcl_app/features/common/Utils/routes/routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
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

  Future<void> toLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(GlobalConstants.isUserLogIn) ?? false;
    String? changePassword = prefs.getString(GlobalConstants.changePassword);
    Timer(
      const Duration(seconds: 2),
      () async {
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(
            context,
            RoutesName.dashboardView,
          );
          /* if(changePassword == "0"){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChangePasswordPage()));
        } else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationForm()));
        }*/
        } else {
          Navigator.pushReplacementNamed(
            context,
            RoutesName.loginView,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AppString.appLogo,
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
