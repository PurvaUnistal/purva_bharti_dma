import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final int maxLength;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String labelText;
  final String hintText;
  final ValueChanged<String> onChanged;
  final GestureTapCallback onTap;
  final Function(String) validator;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatters;
  final Iterable<String> autofillHints;
  final bool readOnly;

  const TextFieldWidget({Key key,
    this.controller,
    this.textInputType,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.validator,
    this.enabled,
    this.textCapitalization,
    this.inputFormatters,
    this.autofillHints,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TextFormField(
        autofillHints: autofillHints,
        enabled: enabled ?? true,
        controller: controller,
        readOnly : readOnly ?? false,
       // autofocus: true,
        keyboardType: textInputType ?? TextInputType.text,
        maxLength: maxLength,
        validator: validator,
        textCapitalization:textCapitalization?? TextCapitalization.words,
        textInputAction: TextInputAction.next,
        inputFormatters : inputFormatters,
        decoration: InputDecoration(
          suffix: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelText: labelText ?? "",
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15.0),
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            hintTextDirection: TextDirection.ltr,
          labelStyle: TextStyle(fontSize: 14.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1, style: BorderStyle.none,),
          ),
        ),
          onChanged: onChanged,
          onTap: onTap,

      ),
    );
  }
}

