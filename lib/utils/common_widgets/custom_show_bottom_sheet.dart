import 'package:flutter/material.dart';

class CustomShowBottomSheet extends StatelessWidget {
  final List<Widget>? children;
  CustomShowBottomSheet({this.children});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Preview'),
        onPressed: () {
          Scaffold.of(context).showBottomSheet<void>(
            (BuildContext context) {
              return Container(
                width: double.infinity,
                color: Colors.black12,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: children!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
