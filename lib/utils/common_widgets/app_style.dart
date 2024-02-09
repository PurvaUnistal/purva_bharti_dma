import 'package:flutter/material.dart';
import 'package:pbg_app/utils/common_widgets/app_color.dart';

class AppStyle{
 static OutlineInputBorder border({Color color}){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1,color: color),
    );
  }

 static TextStyle styleB(){
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11,decoration: TextDecoration.none);
  }

 static TextStyle styleAlter(){
   return TextStyle(
       color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12,decoration: TextDecoration.none);
 }

 static TextStyle styleN(){
   return TextStyle(
       color: Colors.black, fontWeight: FontWeight.normal, fontSize: 13,decoration: TextDecoration.none);
 }

 static TextStyle btn(){
   return TextStyle(color: AppColor.white, fontWeight: FontWeight.bold,);
 }

 static vertical(BuildContext context){
    return SizedBox(
     height: MediaQuery.of(context).size.height * 0.015,
   );
 }

}