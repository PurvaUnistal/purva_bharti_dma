import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final TextInputType? inputType;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final bool? enabled;
  final bool? autofocus;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextFieldWidget({
    Key? key,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.autofillHints,
    this.controller,
    this.obscureText,
    this.onChanged,
    this.inputType,
    this.maxLength,
    this.onTap,
    this.onFieldSubmitted,
    this.enabled,
    this.autofocus,
    this.textCapitalization,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.appBlueColor,
      focusNode: focusNode,
      autofillHints: autofillHints,
      onTap: onTap,
      autofocus: autofocus?? false ,
      onFieldSubmitted: onFieldSubmitted,
      enabled: enabled ?? true,
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      textInputAction: textInputAction ?? TextInputAction.done,
      inputFormatters: inputFormatters,
      style: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 12, color:AppColor.black),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 12, color:AppColor.black),
        labelText: labelText,
        labelStyle: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 12, color: AppColor.black,),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
              color: AppColor.green,
              style: BorderStyle.solid,
              width: 0.80),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
              color: AppColor.green,
              style: BorderStyle.solid,
              width: 0.80),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
              color: AppColor.green,
              style: BorderStyle.solid,
              width: 0.80),
        ),
      ),
    );
  }
}
