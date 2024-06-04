import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/app_color.dart';
import 'package:pbg_app/Utils/common_widgets/styles_widget.dart';

class ImageWidget extends StatelessWidget {
  final String? star;
  final String label;
  final Widget child;
  final Function() onTap;
  const ImageWidget({Key? key,
    this.star,
    required this.label,
    required this.child,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0.9,
        color: Colors.white,
        shadowColor: AppColor.prime,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: Text(star??"", style: Styles.stars)),
                    Flexible(child: Text(label?? "", style: Styles.labels)),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09, child: child),
            ],
          ),
        ),
      ),
    );
  }
}
