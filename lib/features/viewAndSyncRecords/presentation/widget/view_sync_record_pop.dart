import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/customRegistrationForm/domain/model/save_customer_registration_model.dart';

class ViewSyncRecordPop extends StatelessWidget {
  final SaveCusRegData cusRegData;
  const ViewSyncRecordPop({Key? key, required this.cusRegData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(cusRegData.mobileNumber!.toString()),
      actions: [TextButton(onPressed: () {}, child: Text("Yes"))],
    );
  }
}
