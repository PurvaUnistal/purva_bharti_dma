import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';


class AppBarWidget extends StatelessWidget {
  final String? titleAppBar;
  final Widget? leading;
  final Widget? child;
  final List<Widget>? actions;
  const AppBarWidget(
      {Key? key, this.titleAppBar, this.leading, this.actions, this.child})
      : super(key: key);

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
              colors: <Color>[AppColor.appRedColor, AppColor.appBlueColor]),
        ),
      ),
      centerTitle: true,
      title: Text(
        titleAppBar!,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      actions: actions,
    );
  }
}
