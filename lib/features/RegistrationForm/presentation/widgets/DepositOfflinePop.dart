import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/message_box_one_button_pop.dart';
import 'package:pbg_app/features/Dashboard/domain/model/get_all_deposit_offline_model.dart';

class DepositPop extends StatelessWidget {
 final GetAllDepositOfflineModel schemeTypeValue;
  const DepositPop({super.key, required this.schemeTypeValue});

  @override
  Widget build(BuildContext context) {
    return MessageBoxOneButtonPopWidget(
      child: Column(
        children: [
          RowWidget(
            lText: "Deposit Name",
            rText: schemeTypeValue.depositName.toString(),
          ),
          RowWidget(
            lText: "Deposit Amount",
            rText: schemeTypeValue.depositAmount ?? ""
          ),
          RowWidget(
            lText: "Scheme Month",
            rText: schemeTypeValue.schemeMonth.toString()
          ),
          RowWidget(
            lText: "Equipment Deposit Amount",
            rText: schemeTypeValue.equipmentDepositAmount.toString()
          ),
          RowWidget(
            lText: "GAS Amount",
            rText: schemeTypeValue.equipmentDepositAmount.toString()
          ),
          RowWidget(
            lText: "First Deposit Amount",
            rText: schemeTypeValue.firstDepositAmountWith.toString(),
          ),
        ],
      ),
    );
  }
}
