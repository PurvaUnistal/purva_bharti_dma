import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/app_color.dart';
import 'app_string.dart';
import 'styles_widget.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : AppColor.white,
      body: Stack(
        children: [
          child,
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(color: AppColor.prime),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        AppString.companyName,
                        textAlign: TextAlign.start,
                        style: Styles.rel,
                      )),
                      Flexible(
                          child: Text(
                            AppString.version,
                            textAlign: TextAlign.start,
                            style: Styles.rel,
                          )),
                    ],
                  )))
        ],
      ),
    );
  }
}
