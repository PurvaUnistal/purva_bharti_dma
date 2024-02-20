import 'package:flutter/material.dart';
import 'package:hpcl_app/features/common/Utils/common_widget/app_color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool boolLeading;
  final List<Widget> actions;
  const AppBarWidget(
      {Key? key,
      required this.title,
      required this.boolLeading,
      required this.actions})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColor.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none),
        ),
      ),
      actions: actions ?? [],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColor.appBlueColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
