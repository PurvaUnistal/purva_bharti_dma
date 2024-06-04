import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class CircleLoaderWidget extends StatelessWidget {
  const CircleLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
      width: w * 0.05,
      height: h * 0.02,
      child: SpinKitCircle(
        color: AppColor.prime,
        size: 15,
      ),
    );
  }
}
