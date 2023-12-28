import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final Widget leading;
  final Widget child;
  final List<Widget> actions;
  const CustomAppBar(
      {Key key, this.titleAppBar, this.leading, this.actions, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          // color: Colors.green.shade800
          // decoration: BoxDecoration(color: Colors.yellow.shade800
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.green.shade800, Colors.yellow.shade800]),
        ),
      ),
      centerTitle: true,
      title: Text(
        titleAppBar,
        style: TextStyle(fontSize: 18),
      ),
      actions: actions,
    );
  }
}
