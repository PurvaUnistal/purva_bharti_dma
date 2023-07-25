import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String headingLabel;
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
    this.headingLabel,
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
      padding: const EdgeInsets.only(top: 8, left: 12, bottom: 0,right: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(headingLabel??"",style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          TextFormField(
            autofillHints: autofillHints,
            enabled: enabled ?? true,
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal, fontSize: 12),
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
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal, fontSize: 12),
              labelStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal, fontSize: 12),
           //   isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            //  border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.green),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1,color: Colors.green),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1,)
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1,color: Colors.red)
              ),

            ),

              onChanged: onChanged,
              onTap: onTap,

          ),
        ],
      ),
    );
  }
}

