import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/app_color.dart';

class DotsLoaderWidget extends StatelessWidget {
  const DotsLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.12;
    return SpinKitDualRing(
      color: AppColor.prime,
      size: size,
    );
  }
}
