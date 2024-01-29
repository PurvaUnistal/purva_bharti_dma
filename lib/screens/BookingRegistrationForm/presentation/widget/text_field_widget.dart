import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final String labelText;
  final bool enabled;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final Widget suffixIcon;
  const TextFieldWidget({
     this.labelText,
    this.enabled,
    this.controller,
    this.maxLength,
    this.onChanged,
    this.textInputType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enabled ?? true,
        controller: controller,
        maxLength: maxLength,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8,),
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 14.0, color: Colors.green.shade800),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
        ),
        onChanged: onChanged);
  }
}
