import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final Widget leading;
  final Widget child;
  final List<Widget> actions;
  const CustomAppBar({Key key, this.titleAppBar, this.leading, this.actions, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: leading,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.red, Colors.blue.shade900]
            ),
          ),
        ),
        centerTitle:true,
        title: Text(titleAppBar,
          style: TextStyle(
            fontSize: 18
          ),
        ),
        actions: actions,
      );
  }
}
