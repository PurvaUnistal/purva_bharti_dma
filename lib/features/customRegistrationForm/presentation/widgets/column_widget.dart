

import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  final BuildContext context;
  final Widget child;
  const ColumnWidget({Key? key, required this.context, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        _verticalSpace()
      ],
    );
  }
  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
