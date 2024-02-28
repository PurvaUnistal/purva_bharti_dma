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
    PreferenceUtils.init();
    BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormPageLoadEvent(
      context: context,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            titleAppBar: AppString.appName,
          ),
        ),
        body:  BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            // TODO: implement listener}
            if (state is ConnectedState) {
              state.isConnected
                  ? Utils.successSnackBar(state.msg, context)
                  : Utils.errorSnackBar(state.msg, context);
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
              _buildLayoutWidget()
            ],
          ),
        )
    );


  }

  Widget _buildLayoutWidget() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: _buildCardButton(),
    );
  }

  Widget _buildCardButton() {
    return Card(
      shape: Border(left: BorderSide(color: AppColor.appBlueColor, width: 15)),
      elevation: 5,
      shadowColor: Colors.lightBlueAccent,
      color: Colors.white,
      child: Column(
        children: [
          _cardWidget(
              onTap: () async {
                if(await ConnectivityHelper.checkGPSPermission(context: context) == true){
                  /*Navigator.pushReplacementNamed(
                      context, RoutesName.customerRegistrationFormPage);*/
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      CustomerRegistrationFormPage(isUpdate: false, position: 0, localData: null)));
                }
              },
              title: AppString.titleList[0],
              icon: AppString.iconList[0]),
          _cardWidget(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, RoutesName.viewSyncRecordPage);

                },
              title: AppString.titleList[1],
              icon: AppString.iconList[1]),
        ],
      ),
    );
  }

  Widget _cardWidget(
      {required Function()? onTap,
        required IconData icon,
        required String title}) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(18),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColor.appRedColor,
              child: CircleAvatar(
                radius: 21,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
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
          _buildBox(
              color: stateData.isMobile ? Colors.green : Colors.red,
              icon: Icons.signal_cellular_connected_no_internet_0_bar,
              textTitle: AppString.mobile),
          _buildBox(
              color: stateData.isWifi ? Colors.green : Colors.red,
              icon: Icons.wifi,
              textTitle: AppString.wifi),
          _buildBox(
            color: stateData.isConnected ? Colors.green : Colors.red,
            icon: Icons.sync,
            textTitle: AppString.update,
            onTap: () {
              stateData.isConnected
                  ?  BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormPageLoadEvent(
                context: context,
              ))
                  : Utils.errorSnackBar("No Internet Connection", context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBox(
      {Color? color, IconData? icon, String? textTitle, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 10,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                width: 2,
              ),
              Text(textTitle!,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
