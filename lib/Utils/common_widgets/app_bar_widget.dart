import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'res/app_color.dart';
import 'res/environment_config.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? boolLeading;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? tabBar;

  const AppBarWidget({
    super.key,
    this.title,
    this.leading,
    this.boolLeading,
    this.actions,
    this.tabBar,
  });

  // Height for two-line AppBar
  static const double toolbarHeight = 72.0;

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + (tabBar?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double logoSize = size.width * 0.085;
    final double titleFont = size.width * 0.032;
    final double subTitleFont = size.width * 0.022;

    // Get user data safely
    final user = AppConfig.instance?.loginData.user;

    final String? projectLogo = user?.projectLogo;
    final String? smartLogo = user?.smartLogo;
    final String? name = user?.name;
    final String? schema = user?.schema;

    final bool hasProjectLogo = projectLogo?.isNotEmpty ?? false;
    final bool hasSmartLogo = smartLogo?.isNotEmpty ?? false;

    final bool hasName = name?.isNotEmpty ?? false;
    final bool hasSchema = schema?.isNotEmpty ?? false;

    final bool hasUserInfo = hasName || hasSchema;

    return AppBar(
      toolbarHeight: toolbarHeight,

      automaticallyImplyLeading: boolLeading ?? true,

      iconTheme: const IconThemeData(color: Colors.white),

      elevation: 0,

      centerTitle: true,

      leading: leading,

      actions: actions,

      bottom: tabBar,

      titleSpacing: 0,

      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              EnvironmentConfig.of(context)!.primaryTheme,
              EnvironmentConfig.of(context)!.secondaryTheme,
            ],
          ),
        ),
      ),

      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// =========================================================
          /// TOP ROW
          /// =========================================================
          SizedBox(
            height: logoSize,
            child: Row(
              children: [
                /// LEFT LOGO
                if (hasProjectLogo)
                  _logoContainer(context, projectLogo, logoSize)
                else
                  SizedBox(width: logoSize),

                SizedBox(width: size.width * 0.015),

                /// PAGE TITLE
                Expanded(
                  child: Text(
                    title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFont,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ),
                ),

                SizedBox(width: size.width * 0.015),

                /// RIGHT LOGO
                if (hasSmartLogo)
                  _logoContainer(context, smartLogo, logoSize)
                else
                  SizedBox(width: logoSize),

                SizedBox(width: size.width * 0.01),
              ],
            ),
          ),

          /// =========================================================
          /// SUB TITLE
          /// =========================================================
          if (hasUserInfo)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                _getUserInfoText(name: name, schema: schema),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: subTitleFont,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// ===============================================================
  /// USER INFO TEXT
  /// ===============================================================
  String _getUserInfoText({
    String? name,
    String? schema,
  }) {
    final bool hasName = name?.isNotEmpty ?? false;
    final bool hasSchema = schema?.isNotEmpty ?? false;

    final String formattedName = capitalizeName(name);

    if (hasName && hasSchema) {
      return "$formattedName ($schema)";
    }

    if (hasName) {
      return formattedName;
    }

    if (hasSchema) {
      return schema!;
    }

    return "";
  }

  String capitalizeName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "";
    }

    return value
        .trim()
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map(
          (word) =>
      '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
    )
        .join(' ');
  }

  /// ===============================================================
  /// LOGO CONTAINER
  /// ===============================================================
  Widget _logoContainer(BuildContext context, String? url, double size) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: size,
      height: size,

      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.15) : Colors.white,

        borderRadius: BorderRadius.circular(size * 0.2),
      ),

      padding: const EdgeInsets.all(3),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.2),

        child:
            (url?.isNotEmpty ?? false)
                ? Image.network(
                  url!,
                  fit: BoxFit.contain,

                  errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) {
                    return const Icon(Icons.image_not_supported, size: 18);
                  },
                )
                : const Icon(Icons.image_not_supported, size: 18),
      ),
    );
  }
}
