import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';

class BorderWidget extends StatelessWidget {
  final List<Widget> children;
  const BorderWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DottedBorder(
      options: RectDottedBorderOptions(
        dashPattern: [10, 5],
        strokeWidth: 2,
        color:EnvironmentConfig.of(context)!.primaryTheme,
      ),


      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}