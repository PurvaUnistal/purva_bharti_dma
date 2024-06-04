import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/SharedPerfs/shared_pref.dart';
import 'package:pbg_app/Utils/common_widgets/app_string.dart';

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
    String email = await SharedPref.getString(key: PrefsValue.emailVal);
    String password = await SharedPref.getString(key: PrefsValue.passwordVal);
    Timer(
      const Duration(seconds: 2),
      () async {
        if (email.isNotEmpty || password.isNotEmpty) {
          Navigator.pushReplacementNamed(
            context,
            RoutesName.dashboard,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            RoutesName.login,
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
              ImgAsset.appLogo,
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
