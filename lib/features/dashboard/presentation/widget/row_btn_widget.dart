import 'package:flutter/material.dart';
import 'package:pbg_app/common/Utils/common_widget/app_color.dart';
import 'package:pbg_app/common/Utils/common_widget/styles_widget.dart';

class RowBtnWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final  Function()? onTap;
  final  String text;
  const RowBtnWidget({super.key,required this.icon, required this.color, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? null,
      child: Card(
        elevation: 10,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.white,),
              SizedBox(width: 2,),
              Text(text, textAlign: TextAlign.center,style: Styles.textW,),
            ],
          ),
        ),
      ),
    );
  }
}


class CardBtnWidget extends StatelessWidget {
  final IconData icon;
  final  Function()? onTap;
  final  String text;
  const CardBtnWidget({super.key,required this.icon, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(18),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColor.prime,
              child: CircleAvatar(
                radius: 21,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(text,style: Styles.title,)
          ],
        ),
      ),
    );
  }
}