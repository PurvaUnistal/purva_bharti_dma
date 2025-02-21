import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/HiveDatabase/app_update_message_widget.dart';
import 'package:pbg_app/Utils/common_widgets/Loader/CircleLoader.dart';
import 'package:pbg_app/Utils/common_widgets/background_widget.dart';
import 'package:pbg_app/features/internet/bloc/internet_bloc.dart';
import 'package:pbg_app/features/internet/bloc/internet_event.dart';
import 'package:pbg_app/features/internet/bloc/internet_state.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    _checkForUpdate();
    BlocProvider.of<InternetBloc>(context).add(OnConnectedEvent());
    BlocProvider.of<DashboardBloc>(context).add(DashboardPageLoadingEvent(context: context));
    super.initState();
  }

  List<IconData> icons = [
    Icons.picture_in_picture, Icons.receipt
  ];

  List<String> iconText = [
    'Customer Registration Form', 'View and Sync Records'
  ];

  List<Widget> navigatorView = [
    RegistrationFormPage(index: 0,localData: SaveRegistrationFormModel(),isUpdate: false,),
    ViewSyncRecordPage(),
  ];


  Future<void> _checkForUpdate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String oldVersion = await SharedPref.getString(key: PrefsValue.appVersion);
    String currentVersion = packageInfo.version;
    print("oldVersion-->${oldVersion}");
    print("currentVersion-->${currentVersion}");
    if (_isVersionOutdated(oldVersion,currentVersion)) {
     return showDialog(
       context: context,
       barrierDismissible: false,
       builder: (context) {
         return  AppUpdateMessage.showAlertDialog(context: context,onPressed: _openAppStoreLink,);
       },
     );
    }
  }

  bool _isVersionOutdated(String currentVersion, String latestVersion) {
    List<int> current = currentVersion.split('.').map(int.parse).toList();
    List<int> latest = latestVersion.split('.').map(int.parse).toList();

    for (int i = 0; i < latest.length; i++) {
      if (current.length <= i || current[i] < latest[i]) {
        return true;
      } else if (current[i] > latest[i]) {
        return false;
      }
    }
    return false;
  }



  void _openAppStoreLink() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String applicationId = packageInfo.packageName.toString();
    print("applicationId-->${applicationId}");
    String androidPlayStoreUrl =
        "https://play.google.com/store/apps/details?id=${applicationId}&hl=en&gl=US";
    String url =androidPlayStoreUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          body: BackgroundWidget(
            child: BlocListener<InternetBloc, InternetState>(
              listener: (context, state) {
                if (state is ConnectedState) {
                  if (state.isConnected) {
                    Utils.successSnackBar(msg: state.msg, context: context);
                  } else {
                    SizedBox.shrink();
                  }
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
    return Row(
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
        BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if( state is DashboardGetAllDataState){
              return state.isLoader ==  false ? RowBtnWidget(
                color: stateData.isConnected ? Colors.green : Colors.red,
                icon: Icons.refresh,
                text: AppString.refresh,
                onTap: () {
                  BlocProvider.of<DashboardBloc>(context).add(SelectSyncFetchAllDataEvent(
                    context: context,
                  ));
                },
              ) : DotsLoaderWidget();
            } else {
              return const Center(child: SpinLoader());
            }
          },
        ) ,
      ],
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
