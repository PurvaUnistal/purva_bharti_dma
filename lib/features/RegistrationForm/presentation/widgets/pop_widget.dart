import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';

class PopWidget{
  static Widget header({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Customer Detail",
            textAlign: TextAlign.center,
            style: Styles.table,
          ),
        ],
      ),
    );
  }

  static Widget itemBuilder({bool isRequired = false, String? textName, required String textValue}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: textName ?? '',
                    style:Styles.labels,
                  ),
                  if (isRequired)
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
            Flexible(child: Text(textValue ?? "-",style: Styles.label1,
            )),
          ],
        ),
        divider(),

      ],
    );
  }

  static Widget divider(){
    return Divider(
    color: AppColor.black,
    );
  }

  static Widget actionButton({required BuildContext context, required RegistrationFormGetAllDataState dataState}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        dataState.isSaveLoader == false
            ? Flexible(
          child: ButtonWidget(
              text: AppString.save,
              onPressed: () {
                BlocProvider.of<RegistrationFormBloc>(context)
                    .add(RegistrationFormSaveLocalDataEvent(context: context));
              }),
        )
            : DottedLoaderWidget(),
        Flexible(
          child: ButtonWidget(
              text: AppString.edit,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ],
    );
  }



}