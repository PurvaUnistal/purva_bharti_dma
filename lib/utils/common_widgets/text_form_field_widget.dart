import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbg_app/utils/common_widgets/app_color.dart';
import 'package:pbg_app/utils/common_widgets/app_style.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String star;
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
    this.star,
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
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text(star ?? "", style: AppStyle.styleAlter(),),
              Text(headingLabel ?? "", style: AppStyle.styleB(),),
            ],
          ),
        ),
        _vertical(context),
        TextFormField(
          autofillHints: autofillHints,
          enabled: enabled ?? true,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: AppStyle.styleN(),
          readOnly : readOnly ?? false,
          keyboardType: textInputType ?? TextInputType.text,
          maxLength: maxLength,
          validator: validator,
          textCapitalization:textCapitalization?? TextCapitalization.words,
          textInputAction: TextInputAction.next,
          inputFormatters : inputFormatters,
          cursorColor: AppColor.black,
          decoration: InputDecoration(
            counterText: '',
            suffix: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            label: Text(labelText ?? "",style: AppStyle.styleN(),),
            fillColor: Colors.white,
            hintStyle: AppStyle.styleN(),
            labelStyle: AppStyle.styleN(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            focusedBorder: AppStyle.border(color: AppColor.black),
            disabledBorder: AppStyle.border(color: AppColor.grey),
            enabledBorder: AppStyle.border(color: AppColor.black),
            border:AppStyle.border(color: AppColor.black),
            errorBorder:AppStyle.border(color: AppColor.red),
          ),
          onChanged: onChanged,
          onTap: onTap,
        ),
      ],
    );
  }

  _vertical(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height *0.002,
    );
  }


}

