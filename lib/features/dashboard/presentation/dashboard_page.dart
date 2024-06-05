import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    BlocProvider.of<InternetBloc>(context).add(OnConnectedEvent());
    super.initState();
  }

  List<IconData> icons = [
    Icons.picture_in_picture, Icons.receipt
  ];

  List<String> iconText = [
    'Customer Registration Form', 'View and Sync Records'
  ];

  List<Widget> navigatorView = [
    RegistrationFormPage(isUpdate: false, position: 0, localData: null),
    ViewSyncRecordPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarWidget(
              boolLeading: false,
              title: RoutesName.dashboard,
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
          body:  SafeArea(
            child: BlocListener<InternetBloc, InternetState>(
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
            ),
          )
      ),
    );
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
        context: context,
        builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
            message: "Do you want to exit an App?",
            okButtonText: "Exit",
            onPressed: () =>  Navigator.of(context).pop(true)
        ))
    ) ?? false;
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
  Widget _buildCardButton() {
    return Flexible(
      child: ListView.builder(
        itemCount: icons.length,
        itemBuilder: (BuildContext context, int index) {
          return CardBtnWidget(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => navigatorView[index]));
              },
              text: iconText[index],
              icon:icons[index]);
        },
      ),
    );
  }
}
