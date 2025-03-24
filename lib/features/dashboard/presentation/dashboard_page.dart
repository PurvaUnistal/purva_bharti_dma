import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/HiveDatabase/app_update_message_widget.dart';
import 'package:pbg_app/Utils/common_widgets/Loader/CircleLoader.dart';
import 'package:pbg_app/Utils/common_widgets/background_widget.dart';
import 'package:pbg_app/features/internet/bloc/internet_bloc.dart';
import 'package:pbg_app/features/internet/bloc/internet_event.dart';
import 'package:pbg_app/features/internet/bloc/internet_state.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  static const MethodChannel platform = MethodChannel('pbgpl/dma');
  @override
  void initState() {
    BlocProvider.of<InternetBloc>(context).add(OnConnectedEvent());
    BlocProvider.of<DashboardBloc>(context)
        .add(DashboardPageLoadingEvent(context: context));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callMethodeChannel();
    });
  }

  callMethodeChannel()  async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String applicationId = packageInfo.packageName;
      String androidPlayStoreUrl =
          "https://play.google.com/store/apps/details?id=$applicationId&hl=en&gl=US";
      final dynamic result = await platform.invokeMethod('getAppUpdate');
      if (Platform.isAndroid) {
        if (kDebugMode) {
          print("Upgrade Message ============== $result");
        }
        if (result.toString() == "success") {
          try {
            AppUpdateMessage.showAlertDialog(
                context: context, url: androidPlayStoreUrl, isLater: false);
          } catch (e) {
            AppUpdateMessage.showAlertDialog(
                context: context, url: androidPlayStoreUrl);
          }
        }
      }
    } on PlatformException catch (e) {
      return false;
    }
  }

  List<IconData> icons = [Icons.picture_in_picture, Icons.receipt];

  List<String> iconText = [
    'Customer Registration Form',
    'View and Sync Records'
  ];

  List<Widget> navigatorView = [
    RegistrationFormPage(
      index: 0,
      localData: SaveRegistrationFormModel(),
      isUpdate: false,
    ),
    ViewSyncRecordPage(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            boolLeading: false,
            title: "Dashboard",
            actions: [
              IconButton(
                  onPressed: () async {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const LogoutWidget());
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
        ));
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
                message: "Do you want to exit an App?",
                okButtonText: "Exit",
                onPressed: () => Navigator.of(context).pop(true)))) ??
        false;
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
            if (state is DashboardGetAllDataState) {
              return state.isLoader == false
                  ? RowBtnWidget(
                      color: stateData.isConnected ? Colors.green : Colors.red,
                      icon: Icons.refresh,
                      text: AppString.refresh,
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(SelectSyncFetchAllDataEvent(
                          context: context,
                        ));
                      },
                    )
                  : DotsLoaderWidget();
            } else {
              return const Center(child: SpinLoader());
            }
          },
        ),
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
              icon: icons[index]);
        },
      ),
    );
  }
}
