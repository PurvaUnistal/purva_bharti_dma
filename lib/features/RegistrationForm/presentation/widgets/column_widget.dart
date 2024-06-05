import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  final Widget child;
  const ColumnWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      )
      ],
    );
  }
}
