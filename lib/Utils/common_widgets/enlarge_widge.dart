import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

import 'res/environment_config.dart';

class EnlargeWidget extends StatelessWidget {
  final String text;
  final File photoPath;
  const EnlargeWidget({super.key, required this.text, required this.photoPath});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: EnvironmentConfig.of(context)!.primaryTheme,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Styles.header,
                ),
              ),
              CircleAvatar(
                backgroundColor: AppColor.white,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close_rounded, color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: h * 0.6,
          child: photoPath.path.startsWith("http")
              ? Image.network(
            photoPath.path,
            fit: BoxFit.fill,)
              :Image.file(
            photoPath,
            fit: BoxFit.fill,

          ),
        ),
      ],
    );}
}
