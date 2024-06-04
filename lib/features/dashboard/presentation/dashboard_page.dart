import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/Loader/SpinLoader.dart';
import 'package:pbg_app/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:pbg_app/features/dashboard/domain/bloc/dashboard_event.dart';
import 'package:pbg_app/features/dashboard/presentation/widget/logout_widget.dart';
import 'package:pbg_app/features/dashboard/presentation/widget/row_btn_widget.dart';
import 'package:pbg_app/features/internet/bloc/internet_bloc.dart';
import 'package:pbg_app/features/internet/bloc/internet_event.dart';
import 'package:pbg_app/features/internet/bloc/internet_state.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    BlocProvider.of<InternetBloc>(context).add(OnConnectedEvent());
    /*BlocProvider.of<DashboardBloc>(context).add(SelectSyncFetchAllDataEvent(
      context: context,
    ));*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            titleAppBar: AppString.appName,
            actions: [
              IconButton(
                  onPressed: () async {
                    showModalBottomSheet(context: context, builder: (context) => const LogoutWidget());
                  },
                  icon: Icon(
                    Icons.logout,
                    color: AppColor.white,
                  ))
            ],
          ),
        ),
        body:  BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            // TODO: implement listener}
            if (state is ConnectedState) {
              state.isConnected
                  ? Utils.successSnackBar(msg: state.msg,context: context)
                  : Utils.errorSnackBar(msg:state.msg,context: context);
            }
          },
          child: Column(
            children: [
              BlocBuilder<InternetBloc, InternetState>(
                builder: (context, state) {
                  if (state is ConnectedState) {
                    return _checkNetBtnWidget(stateData: state);
                  } else {
                    return const Center(child: SpinLoader());
                  }
                },
              ),
              _buildCardButton()
            ],
          ),
        )
    );
  }


  Widget _buildCardButton() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        shape: Border(left: BorderSide(color: AppColor.prime, width: 15)),
        elevation: 5,
        shadowColor: AppColor.prime,
        color: Colors.white,
        child: Column(
          children: [
            CardBtnWidget(
                onTap: () async {
                  if(await ConnectivityHelper.checkGPSPermission(context: context) == true){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        CustomerRegistrationFormPage(isUpdate: false, position: 0, localData: null)));
                  }
                },
                text: AppString.titleList[0],
                icon: AppString.iconList[0]),
            CardBtnWidget(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutesName.viewSyncRecord);
                },
                text: AppString.titleList[1],
                icon: AppString.iconList[1]),
          ],
        ),
      ),
    );
  }



  _checkNetBtnWidget({required ConnectedState stateData}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowBtnWidget(
              color: stateData.isMobile ? Colors.green : Colors.red,
              icon: Icons.signal_cellular_connected_no_internet_0_bar,
              text: AppString.mobile),
          RowBtnWidget(
              color: stateData.isWifi ? Colors.green : Colors.red,
              icon: Icons.wifi,
              text: AppString.wifi),
          RowBtnWidget(
            color: stateData.isConnected ? Colors.green : Colors.red,
            icon: Icons.sync,
            text: AppString.update,
            onTap: () {
              BlocProvider.of<DashboardBloc>(context).add(SelectSyncFetchAllDataEvent(
                context: context,
              ));
            },
          ),
        ],
      ),
    );
  }

}
