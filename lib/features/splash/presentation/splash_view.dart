import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

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
    String? userEmail = prefs.getString(PrefsValue.userEmail) ?? "";
    String? userPwd = prefs.getString(PrefsValue.userPwd) ?? "";
    Timer(
      const Duration(seconds: 2),
      () async {
        if (userEmail.isEmpty && userPwd.isEmpty) {
          Navigator.pushReplacementNamed(
            context,
            RoutesName.loginView,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            RoutesName.dashboardView,
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
