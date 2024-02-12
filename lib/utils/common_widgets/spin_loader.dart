import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pbg_app/utils/common_widgets/app_color.dart';

class SpinLoader extends StatelessWidget {
  const SpinLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCubeGrid(
      color: AppColor.appColor1,
    );
  }
}
