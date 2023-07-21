import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String textButton;
  final Function onPressed;
  const ButtonWidget({Key key, this.onPressed, this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
    onPressed: onPressed,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.red, Colors.blue.shade900]
          ),
          borderRadius: BorderRadius.all(Radius.circular(80.0))
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      child: Text(textButton,textAlign: TextAlign.center,style:
    TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold,

    ),
    ),
    )
    );
  }
}
