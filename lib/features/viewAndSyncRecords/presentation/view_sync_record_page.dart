import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/background_widget.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';
import 'package:pbg_app/features/RegistrationForm/helper/registration_sync_service.dart';
import 'package:pbg_app/features/internet/bloc/internet_bloc.dart';
import 'package:pbg_app/features/internet/bloc/internet_event.dart';
import 'package:pbg_app/features/internet/bloc/internet_state.dart';

class ViewSyncRecordPage extends StatefulWidget {
  const ViewSyncRecordPage({Key? key}) : super(key: key);

  @override
  State<ViewSyncRecordPage> createState() => _ViewSyncRecordPageState();
}

class _ViewSyncRecordPageState extends State<ViewSyncRecordPage> {
  static const String _noInternetMsg =
      "No internet available. Please check your connection and try again.";

  /// True while the internet check is running, so a second tap is ignored.
  bool _isCheckingInternet = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<InternetBloc>(context).add(OnConnectedEvent());
    // ViewSyncRecordBloc refreshes itself (Hive box watch + syncState) and
    // starts a sync on load when online, so nothing else is needed here.
    _loadList();
  }

  void _loadList() {
    BlocProvider.of<ViewSyncRecordBloc>(context)
        .add(ViewSyncRecordLoadPageEvent(context: context));
  }

  /// Checks for a REAL internet connection before any upload starts.
  /// Wi-Fi/mobile being "on" does not mean the internet works, so this uses
  /// the same check as the auto-sync service.
  /// Returns true when online; otherwise shows the message and returns false,
  /// so the loader is never started.
  Future<bool> _ensureInternet() async {
    if (_isCheckingInternet) return false;
    _isCheckingInternet = true;
    try {
      final online = await RegistrationSyncService.instance.hasInternet();
      if (!online && mounted) {
        Utils.errorSnackBar(msg: _noInternetMsg, context: context);
      }
      return online;
    } catch (_) {
      if (mounted) Utils.errorSnackBar(msg: _noInternetMsg, context: context);
      return false;
    } finally {
      _isCheckingInternet = false;
    }
  }

  Future<void> _uploadAll() async {
    if (RegistrationSyncService.instance.isSyncing) {
      Utils.successSnackBar(
        msg: "Records are already syncing automatically. Please wait.",
        context: context,
      );
      return;
    }
    if (!await _ensureInternet() || !mounted) return;
    BlocProvider.of<ViewSyncRecordBloc>(context)
        .add(SyncRecordListServerDataEvent(context: context));
  }

  Future<void> _uploadSingle(int index) async {
    if (!await _ensureInternet() || !mounted) return;
    BlocProvider.of<ViewSyncRecordBloc>(context)
        .add(SyncRecordSingleServerDataEvent(context: context, index: index));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(boolLeading: true, title: "View Sync Record"),
        ),
        body: BackgroundWidget(
          child: BlocListener<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is ConnectedState) {
                if (state.isConnected) {
                  Utils.successSnackBar(msg: state.msg, context: context);
                } else {
                  Utils.errorSnackBar(msg: state.msg, context: context);
                }
              }
            },
            child: Column(
              children: [
                // FIX: any state other than ConnectedState (initial state or
                // the "no internet" state) used to show an endless SpinLoader.
                // Now the status row is always shown; offline = all red plus
                // a "No internet available" message.
                BlocBuilder<InternetBloc, InternetState>(
                  builder: (context, state) {
                    final connected = state is ConnectedState;
                    return _checkNetBtnWidget(
                      isMobile: connected ? state.isMobile : false,
                      isWifi: connected ? state.isWifi : false,
                      isConnected: connected ? state.isConnected : false,
                    );
                  },
                ),
                BlocBuilder<ViewSyncRecordBloc, ViewSyncRecordState>(
                  builder: (context, state) {
                    if (state is ViewSyncRecordDataState) {
                      return _listData(dataState: state);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
        message: "Do you want to exit an View Sync Record Page?",
        okButtonText: "Exit",
        onPressed: () => Navigator.of(context).pop(true),
      ),
    )) ??
        false;
  }

  Widget _checkNetBtnWidget({
    required bool isMobile,
    required bool isWifi,
    required bool isConnected,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RowBtnWidget(
                color: isMobile ? Colors.green : Colors.red,
                icon: Icons.signal_cellular_connected_no_internet_0_bar,
                text: AppString.mobile,
              ),
              RowBtnWidget(
                color: isWifi ? Colors.green : Colors.red,
                icon: Icons.wifi,
                text: AppString.wifi,
              ),
              BlocBuilder<ViewSyncRecordBloc, ViewSyncRecordState>(
                builder: (context, state) {
                  // Loader ONLY while an upload is really running.
                  final uploading = state is ViewSyncRecordDataState &&
                      state.isGrpServerLoader == true;
                  if (uploading) return const SpinLoader();
                  return RowBtnWidget(
                    color: isConnected ? Colors.green : Colors.red,
                    icon: Icons.sync,
                    text: AppString.upload,
                    // Offline: _uploadAll shows "No internet available"
                    // instead of starting the loader.
                    onTap: _uploadAll,
                  );
                },
              ),
            ],
          ),
          if (!isConnected) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.wifi_off, color: Colors.red, size: 18),
                SizedBox(width: 6),
                Flexible(
                  child: Text(
                    "No internet available",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _row({required String leading, required String training}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(leading), Text(training)],
    );
  }

  Widget _listData({required ViewSyncRecordDataState dataState}) {
    final primary = EnvironmentConfig.of(context)!.primaryTheme;

    return Flexible(
      child: Stack(
        children: [
          dataState.listOfRegistrationForm.isEmpty
              ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Center(
              child: Text("No Data Found", style: Styles.labels),
            ),
          )
              : ListView.builder(
            itemCount: dataState.listOfRegistrationForm.length,
            itemBuilder: (BuildContext context, int index) {
              final data = dataState.listOfRegistrationForm[index];
              return Card(
                color: AppColor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(width: 0.8, color: primary),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Record : ${index + 1}"),
                          Row(
                            children: [
                              if (data.isSingleServerLoader == true)
                                DottedLoaderWidget()
                              else if (dataState.isGrpServerLoader !=
                                  true)
                                IconButton(
                                  icon: Icon(Icons.sync, color: primary),
                                  onPressed: () => _uploadSingle(index),
                                ),
                              _deleteButton(data: data, index: index),
                              _editButton(data: data, index: index),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      _row(
                        leading: "Mobile Number : ",
                        training: data.mobileNumber ?? "",
                      ),
                      const Divider(),
                      _row(
                        leading: "Name : ",
                        training:
                        "${data.firstName ?? ""} ${data.lastName ?? ""}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          if (dataState.isGrpServerLoader == true)
            Center(
              child: PhysicalModel(
                elevation: 21,
                borderRadius: BorderRadius.circular(20),
                color: AppColor.white,
                shadowColor: primary,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 21),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SpinLoader(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text("Please wait", style: Styles.labels),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _deleteButton({
    required SaveRegistrationFormModel data,
    required int index,
  }) {
    return IconButton(
      icon: Icon(
        Icons.delete_forever,
        color: EnvironmentConfig.of(context)!.primaryTheme,
      ),
      onPressed: () {
        BlocProvider.of<ViewSyncRecordBloc>(context).add(
          DeleteLocalDataEvent(
            index: index,
            context: context,
            mobileNo: data.mobileNumber ?? "",
          ),
        );
      },
    );
  }

  Widget _editButton({
    required SaveRegistrationFormModel data,
    required int index,
  }) {
    return IconButton(
      icon: Icon(Icons.edit, color: EnvironmentConfig.of(context)!.primaryTheme),
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RegistrationFormPage(
              isUpdate: true,
              index: index,
              localData: data,
            ),
          ),
        );
        // Refresh the list when coming back (if the user didn't save, the
        // record is unchanged; if they did, the app goes to the dashboard).
        if (mounted) _loadList();
      },
    );
  }
}