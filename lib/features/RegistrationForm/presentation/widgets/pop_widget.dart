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

  static Widget itemBuilder({String? star, String? textName, String? textValue, required BuildContext context}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: Text(star??"",  style:Styles.stars)),
                  Flexible(flex: 6,child: Text(textName  ?? "", style:Styles.labels),
                  ),
                ],
              ),
              ),
              Flexible(child: Text(textValue ?? "-",style: Styles.label1,
              )),
            ],
          ),
        ),
        divider(context: context),

      ],
    );
  }

  static Widget divider({required BuildContext context}){
    return Divider(
      color: EnvironmentConfig.of(context)!.primaryTheme,
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