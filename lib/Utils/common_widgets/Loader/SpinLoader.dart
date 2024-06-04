import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class SpinLoader extends StatelessWidget {
  const SpinLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCubeGrid(
      color: AppColor.prime,
    );
  }
}
