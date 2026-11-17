import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';

/// Visual style of the popup. Controls the icon and accent color.
enum PopType { warning, danger, info, success, exit }

/// Modern two-button confirmation popup.
///
/// Drop-in replacement: existing calls keep working unchanged, e.g.
///
///   showDialog(
///     context: context,
///     builder: (_) => MessageBoxTwoButtonPopWidget(
///       message: "Do you want to exit?",
///       okButtonText: "Exit",
///       onPressed: () => Navigator.of(context).pop(true),
///     ),
///   );
///
/// Or use the helper, which adds a blurred, animated entrance:
///
///   final ok = await MessageBoxTwoButtonPopWidget.show(
///     context: context,
///     type: PopType.danger,
///     alertText: "Delete record?",
///     message: "This record will be removed permanently.",
///     okButtonText: "Delete",
///     onPressed: () => Navigator.of(context).pop(true),
///   );
class MessageBoxTwoButtonPopWidget extends StatelessWidget {
  final String? alertText;
  final String message;
  final String? subMessage;
  final String okButtonText;
  final String cancelButtonText;
  final VoidCallback onPressed;
  final VoidCallback? onCancel;
  final PopType type;
  final IconData? icon;

  const MessageBoxTwoButtonPopWidget({
    Key? key,
    this.alertText,
    required this.message,
    this.subMessage,
    required this.onPressed,
    required this.okButtonText,
    this.cancelButtonText = "Cancel",
    this.onCancel,
    this.type = PopType.warning,
    this.icon,
  }) : super(key: key);

  /// Shows the popup with a fade + scale animation and a dimmed background.
  /// Returns whatever the buttons pop with (e.g. true / null).
  static Future<T?> show<T>({
    required BuildContext context,
    required String message,
    required String okButtonText,
    required VoidCallback onPressed,
    String? alertText,
    String? subMessage,
    String cancelButtonText = "Cancel",
    VoidCallback? onCancel,
    PopType type = PopType.warning,
    IconData? icon,
    bool barrierDismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: "popup",
      barrierColor: Colors.black.withOpacity(0.45),
      transitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (_, __, ___) => MessageBoxTwoButtonPopWidget(
        alertText: alertText,
        message: message,
        subMessage: subMessage,
        okButtonText: okButtonText,
        cancelButtonText: cancelButtonText,
        onPressed: onPressed,
        onCancel: onCancel,
        type: type,
        icon: icon,
      ),
      transitionBuilder: (_, anim, __, child) {
        final curved =
        CurvedAnimation(parent: anim, curve: Curves.easeOutBack);
        return FadeTransition(
          opacity: anim,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.85, end: 1).animate(curved),
            child: child,
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Style per type
  // ---------------------------------------------------------------------------

  Color _accent(BuildContext context) {
    switch (type) {
      case PopType.danger:
        return const Color(0xFFE53935);
      case PopType.success:
        return const Color(0xFF2E7D32);
      case PopType.info:
        return const Color(0xFF1E88E5);
      case PopType.exit:
        return EnvironmentConfig.of(context)?.primaryTheme ??
            Theme.of(context).primaryColor;
      case PopType.warning:
        return const Color(0xFFF59E0B);
    }
  }

  IconData get _icon {
    if (icon != null) return icon!;
    switch (type) {
      case PopType.danger:
        return Icons.delete_outline_rounded;
      case PopType.success:
        return Icons.check_circle_outline_rounded;
      case PopType.info:
        return Icons.info_outline_rounded;
      case PopType.exit:
        return Icons.logout_rounded;
      case PopType.warning:
        return Icons.warning_amber_rounded;
    }
  }

  String get _defaultTitle {
    switch (type) {
      case PopType.danger:
        return "Are you sure?";
      case PopType.success:
        return "Success";
      case PopType.info:
        return "Information";
      case PopType.exit:
        return "Leave this page?";
      case PopType.warning:
        return "Alert!";
    }
  }

  // ---------------------------------------------------------------------------
  // UI
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final accent = _accent(context);
    final width = MediaQuery.of(context).size.width;
    final hasSub = (subMessage ?? "").trim().isNotEmpty;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width * 0.86 > 400 ? 400 : width * 0.86,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // ---------------- Card ----------------
              Container(
                margin: const EdgeInsets.only(top: 36),
                padding: const EdgeInsets.fromLTRB(22, 52, 22, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: accent.withOpacity(0.18),
                      blurRadius: 30,
                      offset: const Offset(0, 14),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      alertText ?? _defaultTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2937),
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Message
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.45,
                        color: Color(0xFF4B5563),
                      ),
                    ),

                    // Sub message (highlighted chip)
                    if (hasSub) ...[
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: accent.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: accent.withOpacity(0.25)),
                        ),
                        child: Text(
                          subMessage!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                            color: accent,
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: _PopButton(
                            text: cancelButtonText,
                            filled: false,
                            color: accent,
                            onTap: onCancel ?? () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _PopButton(
                            text: okButtonText.isEmpty ? "OK" : okButtonText,
                            filled: true,
                            color: accent,
                            onTap: onPressed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ---------------- Floating icon badge ----------------
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: accent.withOpacity(0.30),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(6),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [accent.withOpacity(0.75), accent],
                    ),
                  ),
                  child: Icon(_icon, color: Colors.white, size: 34),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Rounded button with a press-down scale effect.
class _PopButton extends StatefulWidget {
  final String text;
  final bool filled;
  final Color color;
  final VoidCallback onTap;

  const _PopButton({
    required this.text,
    required this.filled,
    required this.color,
    required this.onTap,
  });

  @override
  State<_PopButton> createState() => _PopButtonState();
}

class _PopButtonState extends State<_PopButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.color;
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.96 : 1,
        duration: const Duration(milliseconds: 110),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: widget.filled
                ? LinearGradient(colors: [c.withOpacity(0.85), c])
                : null,
            color: widget.filled ? null : Colors.white,
            border: widget.filled
                ? null
                : Border.all(color: const Color(0xFFD1D5DB), width: 1.2),
            boxShadow: widget.filled
                ? [
              BoxShadow(
                color: c.withOpacity(_pressed ? 0.15 : 0.35),
                blurRadius: _pressed ? 6 : 12,
                offset: const Offset(0, 5),
              ),
            ]
                : null,
          ),
          child: Text(
            widget.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: widget.filled ? Colors.white : const Color(0xFF374151),
            ),
          ),
        ),
      ),
    );
  }
}