import 'package:flutter/material.dart';
import 'package:pbg_app/utils/common_widgets/app_style.dart';

class CardImageWidget extends StatelessWidget {
 final String imgString, star;
 final Widget children;
  const CardImageWidget({Key key,this.imgString, this.star, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(star ?? "", style: AppStyle.styleAlter(),),
                Text(imgString,style: AppStyle.styleB()),
              ],
            ),
            children

          ],
        ),
      ),
    );
  }
}
