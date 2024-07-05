import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/message_box_one_button_pop.dart';
import 'package:pbg_app/features/Dashboard/domain/model/get_all_deposit_offline_model.dart';

class DepositPop extends StatelessWidget {
 final GetAllDepositOfflineModel depositTypeValue;
  const DepositPop({super.key, required this.depositTypeValue});

  @override
  Widget build(BuildContext context) {
    return MessageBoxOneButtonPopWidget(
      child: Column(
        children: [
          RowWidget(
            lText: "Deposit Name",
            rText: depositTypeValue.depositName ?? ""
          ),
          RowWidget(
            lText: "Deposit Amount",
            rText: depositTypeValue.depositAmount ?? ""
          ),
          RowWidget(
            lText: "Scheme Month",
            rText: depositTypeValue.schemeMonth.toString()
          ),
          RowWidget(
            lText: "Equipment Deposit Amount",
            rText: depositTypeValue.equipmentDepositAmount.toString()
          ),
          RowWidget(
            lText: "GAS Amount",
            rText: depositTypeValue.gasDepositAmount.toString()
          ),
          RowWidget(
            lText: "First Deposit Amount",
            rText: depositTypeValue.firstDepositAmount.toString(),
          ),
        ],
      ),
    );
  }
}
