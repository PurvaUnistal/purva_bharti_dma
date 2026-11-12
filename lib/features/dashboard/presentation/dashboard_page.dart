
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/app_update_message_widget.dart';
import 'package:pbg_app/Utils/common_widgets/Loader/CircleLoader.dart';
import 'package:pbg_app/Utils/common_widgets/background_widget.dart';
import 'package:pbg_app/features/internet/bloc/internet_bloc.dart';
import 'package:pbg_app/features/internet/bloc/internet_event.dart';
import 'package:pbg_app/features/internet/bloc/internet_state.dart';
import 'widget/AppUpdateCleaner.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static const MethodChannel platform = MethodChannel('pbgpl/dma');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startup());
  }

  /// Pehle update check, phir dashboard ka data load
  Future<void> _startup() async {
    final cleared = await AppUpdateCleaner.run();
    if (!mounted) return;

    if (cleared) {
      // App update hua -> data clear ho gaya -> dobara login
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginView()),
            (route) => false,
      );
      return;
    }

    // Normal flow
    BlocProvider.of<InternetBloc>(context).add(OnConnectedEvent());
    BlocProvider.of<DashboardBloc>(context)
        .add(DashboardPageLoadingEvent(context: context));
    callMethodeChannel();
  }

  Future<void> callMethodeChannel() async {
    if (!Platform.isAndroid) return;
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final androidPlayStoreUrl =
          "https://play.google.com/store/apps/details?id=${packageInfo.packageName}&hl=en&gl=US";
      final dynamic result = await platform.invokeMethod('getAppUpdate');
      if (kDebugMode) {
        print("Upgrade Message ============== $result");
      }
      if (!mounted) return;
      if (result.toString() == "success") {
        AppUpdateMessage.showAlertDialog(
            context: context, url: androidPlayStoreUrl, isLater: false);
      }
    } on PlatformException catch (e) {
      debugPrint("getAppUpdate failed: $e");
    }
  }

  final List<IconData> icons = [Icons.picture_in_picture, Icons.receipt];

  final List<String> iconText = [
    'Customer Registration Form',
    'View and Sync Records'
  ];

  // Har baar naya page banana — purana data reuse na ho
  Widget _pageFor(int index) {
    switch (index) {
      case 0:
        return RegistrationFormPage(
          index: 0,
          localData: SaveRegistrationFormModel(),
          isUpdate: false,
        );
      default:
        return ViewSyncRecordPage();
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
            title: "Dashboard",
            actions: [
              IconButton(
                onPressed: () => LogoutWidget.show(context),
                icon: Icon(Icons.logout, color: AppColor.white),
              ),
            ],
          ),
        ),
       body: BackgroundWidget(
        child: BlocListener<InternetBloc, InternetState>(
      listenWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
      listener: (context, state) {
        if (state is ConnectedState) {
          Utils.successSnackBar(msg: state.msg, context: context);
        } else if (state is NotConnectedState) {
          Utils.errorSnackBar(msg: state.msg, context: context);
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
              }
              if (state is NotConnectedState) {
                return _noInternetWidget(msg: state.msg);
              }
              return const Center(child: SpinLoader()); // sirf startup par
            },
          ),
          _buildCardButton(),
        ],
      ),
      ),
      ),
      ),
    );
  }

  Widget _noInternetWidget({required String msg}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RowBtnWidget(
              color: Colors.red,
              icon: Icons.signal_cellular_connected_no_internet_0_bar,
              text: AppString.mobile,
            ),
            RowBtnWidget(
              color: Colors.red,
              icon: Icons.wifi_off,
              text: AppString.wifi,
            ),
            RowBtnWidget(
              color: Colors.red,
              icon: Icons.refresh,
              text: AppString.refresh,
              onTap: () => BlocProvider.of<InternetBloc>(context)
                  .add(OnConnectedEvent()), // dobara check karo
            ),
          ],
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.shade200),
          ),
          child: Row(
            children: [
              Icon(Icons.cloud_off, color: Colors.red.shade700, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  msg,
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog<bool>(
      context: context,
      builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
        message: "Do you want to exit an App?",
        okButtonText: "Exit",
        onPressed: () => Navigator.of(mContext).pop(true),
      ),
    )) ??
        false;
  }

  Widget _checkNetBtnWidget({required ConnectedState stateData}) {
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
                      .add(SelectSyncFetchAllDataEvent(context: context));
                },
              )
                  : DotsLoaderWidget();
            }
            return const Center(child: SpinLoader());
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
                MaterialPageRoute(builder: (_) => _pageFor(index)),
              );
            },
            text: iconText[index],
            icon: icons[index],
          );
        },
      ),
    );
  }
}