import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_string.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/styles_widget.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white, // White background
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            child,
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      EnvironmentConfig.of(context)!.secondaryTheme,
                      EnvironmentConfig.of(context)!.primaryTheme,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        AppString.companyName,
                        style: Styles.rel,
                      ),
                    ),
                    Text(
                      AppString.version,
                      style: Styles.rel,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}