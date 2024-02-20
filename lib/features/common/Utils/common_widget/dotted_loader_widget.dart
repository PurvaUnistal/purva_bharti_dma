import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class DottedLoaderWidget extends StatelessWidget {

  const DottedLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size  =  MediaQuery.of(context).size.width * 0.12;
    return SpinKitThreeInOut(
      color: AppColor.appBlueColor,
      size: size,);
  }
}
