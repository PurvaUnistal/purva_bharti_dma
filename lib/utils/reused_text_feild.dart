import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class ReusedTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? enabled, autofocus, readOnly;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText, labelText, hintText;
  final Widget? child, suffixIcon;
  final Function(String)? onChanged;
  const ReusedTextField(
      {Key? key,
      this.keyboardType,
      this.controller,
      this.inputFormatters,
      this.errorText,
      this.labelText,
      this.hintText,
      this.child,
      this.suffixIcon,
      this.onChanged,
      this.enabled,
      this.autofocus,
      this.readOnly,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      child: TextFormField(
        enabled: true,
        autofocus: true,
        readOnly: readOnly!,
        maxLength: maxLength,
        onChanged: onChanged,
        keyboardType: keyboardType,
        controller: controller,
        inputFormatters: inputFormatters!,
        decoration: new InputDecoration(
            border: OutlineInputBorder(),
            errorText: errorText,
            errorStyle: TextStyle(
              color: Colors.red,
              wordSpacing: 5.0,
            ),
            labelStyle: TextStyle(color: Colors.green, letterSpacing: 0.1),
            hintStyle: TextStyle(letterSpacing: 1.3),
            contentPadding: EdgeInsets.all(15.0),
            suffixIcon: suffixIcon,
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}

class ReusedTextFieldError extends StatelessWidget {
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? enabled, autofocus, readOnly;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText, labelText, hintText;
  final Widget? child, suffixIcon;
  final Function(String)? onChanged;
  const ReusedTextFieldError(
      {Key? key,
      this.keyboardType,
      this.controller,
      this.inputFormatters,
      this.errorText,
      this.labelText,
      this.hintText,
      this.child,
      this.suffixIcon,
      this.onChanged,
      this.enabled,
      this.autofocus,
      this.readOnly,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      child: TextFormField(
        enabled: true,
        autofocus: true,
        readOnly: readOnly!,
        maxLength: maxLength,
        onChanged: onChanged,
        keyboardType: keyboardType,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: new InputDecoration(
            border: OutlineInputBorder(),
            //  errorText: errorText,
            //  errorStyle: TextStyle(color: Colors.red, wordSpacing: 5.0,),
            labelStyle: TextStyle(color: Colors.green, letterSpacing: 0.1),
            hintStyle: TextStyle(letterSpacing: 1.3),
            contentPadding: EdgeInsets.all(15.0),
            suffixIcon: suffixIcon,
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}

class SimpleTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChanged, onTap;
  final bool? readOnly, enabled;
  final TextInputType? keyboardType;
  final String? hintText, labelText;
  final int? maxLength;
  const SimpleTextField(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onTap,
      this.hintText,
      this.labelText,
      this.keyboardType,
      this.readOnly,
      this.enabled,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      child: TextFormField(
        maxLength: maxLength,
        enabled: enabled,
        keyboardType: keyboardType,
        controller: controller,
        autofocus: true,
        readOnly: readOnly!,
        decoration: new InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText),
        onChanged: (value) {
          if (onChanged != null) onChanged!(value);
        },
      ),
    );
  }
}

class LocationTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? hintText, labelText;
  const LocationTextField(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onTap,
      this.hintText,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      child: TextFormField(
        autofocus: true,
        //  enableSuggestions: false,
        keyboardType: TextInputType.number,
        controller: controller,
        enabled: false,
        decoration: new InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText),
        onChanged: onChanged!,
        onTap: onTap!,
      ),
    );
  }
}
