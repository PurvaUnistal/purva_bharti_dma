import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_decoration_style.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final GestureTapCallback? onTap;
  final String labelText;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final int? maxLength;
  final int maxLine;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isRequired;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  /// Key attached to the inner TextFormField. Lets the page inspect
  /// FormFieldState.hasError, scroll to the first invalid field, and
  /// lets this widget clear its own error while the user types.
  final GlobalKey<FormFieldState>? fieldKey;

  const TextFieldWidget({
    super.key,
    required this.labelText,
    this.fieldKey,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.controller,
    this.initialValue,
    this.onTap,
    this.onChanged,
    this.textInputType,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLine = 1,
    this.isRequired = false,
    this.fontSize,
    this.fontWeight,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).colorScheme.onSurface;

    final enabledFill = isDark
        ? Theme.of(context).colorScheme.surfaceContainerHighest
        : Colors.white;
    final disabledFill = isDark
        ? Theme.of(context)
        .colorScheme
        .surfaceContainerHighest
        .withOpacity(0.4)
        : Colors.grey.shade100;

    return TextFormField(
      key: fieldKey,
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      onTap: onTap,
      enabled: enabled,
      readOnly: readOnly,
      onChanged: (value) {
        // If this field is currently showing an error (set by the
        // Preview button's validate()), re-run ONLY this field's
        // validator as the user types, so the error clears the moment
        // the input becomes valid. Fields without errors stay quiet —
        // no premature red text while filling the form top-to-bottom.
        final state = fieldKey?.currentState;
        if (state != null && state.hasError) {
          state.validate();
        }
        onChanged?.call(value);
      },
      maxLength: maxLength,
      maxLines: maxLine,
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: 14,
        color: textColor,
      ),
      decoration: InputDecorationStyle.inputDecoration(
        context,
        labelText: labelText,
        isRequired: isRequired,
      ).copyWith(
        fillColor: enabled ? enabledFill : disabledFill,
        counterText: "",
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
