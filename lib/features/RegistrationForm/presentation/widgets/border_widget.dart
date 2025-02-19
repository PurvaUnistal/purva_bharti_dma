import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/app_color.dart';

class BorderWidget extends StatelessWidget {
  final List<Widget> children;
  const BorderWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DottedBorder(
      dashPattern: [6, 3, 2, 7],
      color: AppColor.prime,
      child: Center(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}