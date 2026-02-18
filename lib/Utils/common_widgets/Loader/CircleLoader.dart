import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';

class DotsLoaderWidget extends StatelessWidget {
  const DotsLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.12;
    return SpinKitDualRing(
      color:EnvironmentConfig.of(context)!.primaryTheme,
      size: size,
    );
  }
}
