import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CenterLoaderWidget extends StatelessWidget {
  const CenterLoaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size  =  MediaQuery.of(context).size.width * 0.10;
    return Container(
      child: Center(child:
      SpinKitCubeGrid(
        color: Colors.green.shade800,
        size: size,),),
    );
  }
}