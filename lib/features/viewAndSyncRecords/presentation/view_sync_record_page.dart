import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/background_widget.dart';
import 'package:pbg_app/features/internet/bloc/internet_bloc.dart';
import 'package:pbg_app/features/internet/bloc/internet_event.dart';
import 'package:pbg_app/features/internet/bloc/internet_state.dart';

class ViewSyncRecordPage extends StatefulWidget {
  const ViewSyncRecordPage({Key? key}) : super(key: key);

  @override
  State<ViewSyncRecordPage> createState() => _ViewSyncRecordPageState();
}

class _ViewSyncRecordPageState extends State<ViewSyncRecordPage> {
  @override
  void initState() {
    BlocProvider.of<InternetBloc>(context).add(OnConnectedEvent());
    BlocProvider.of<ViewSyncRecordBloc>(context)
        .add(ViewSyncRecordLoadPageEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          boolLeading: true,
          title: RoutesName.viewSyncRecord,
        ),
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
              BlocBuilder<InternetBloc, InternetState>(
                builder: (context, state) {
                  if (state is ConnectedState) {
                    return _checkNetBtnWidget(dataState: state);
                  } else {
                    return const Center(child: SpinLoader());
                  }
                },
              ),
              BlocBuilder<ViewSyncRecordBloc, ViewSyncRecordState>(
                builder: (context, state) {
                  if (state is ViewSyncRecordDataState) {
                    return _listData(dataState: state);
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
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
                onPressed: () => Navigator.of(context).pop(true)))) ??
        false;
  }

  _checkNetBtnWidget({required ConnectedState dataState}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowBtnWidget(
            color: dataState.isMobile ? Colors.green : Colors.red,
            icon: Icons.signal_cellular_connected_no_internet_0_bar,
            text: AppString.mobile,
          ),
          RowBtnWidget(
            color: dataState.isWifi ? Colors.green : Colors.red,
            icon: Icons.wifi,
            text: AppString.wifi,
          ),
          BlocBuilder<ViewSyncRecordBloc, ViewSyncRecordState>(
            builder: (context, state) {
              if (state is ViewSyncRecordDataState) {
                return !state.isGrpServerLoader
                    ? RowBtnWidget(
                        color:
                            dataState.isConnected ? Colors.green : Colors.red,
                        icon: Icons.sync,
                        text: AppString.upload,
                        onTap: () {
                          BlocProvider.of<ViewSyncRecordBloc>(context).add(
                            SyncRecordListServerDataEvent(context: context),
                          );
                        },
                      )
                    : const SpinLoader();
              }
              // Default return to avoid errors
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _row({required String leading, required String training}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading),
        Text(training),
      ],
    );
  }

  Widget _listData({required ViewSyncRecordDataState dataState}) {
    return Flexible(
      child: Stack(
        children: [
          dataState.listOfRegistrationForm?.length == 0
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                      child: Text("No Data Found", style: Styles.labels)))
              : ListView.builder(
                  itemCount: dataState.listOfRegistrationForm?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    var data = dataState.listOfRegistrationForm![index];
                    return Card(
                      color: AppColor.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(width: 0.8, color: AppColor.prime)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Record : ${index+1}"),
                                Row(
                                  children: [
                                    dataState.isSingleServerLoader == false
                                        ? IconButton(
                                            icon: Icon(
                                              Icons.sync,
                                              color: AppColor.prime,
                                            ),
                                            onPressed: () {
                                              BlocProvider.of<
                                                          ViewSyncRecordBloc>(
                                                      context)
                                                  .add(
                                                      SyncRecordSingleServerDataEvent(
                                                          context: context,
                                                          index: index));
                                              print(
                                                  "SyncRecordSingleServerDataEvent-->${index}");
                                            },
                                          )
                                        : DottedLoaderWidget(),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete_forever,
                                        color: AppColor.prime,
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<ViewSyncRecordBloc>(
                                                context)
                                            .add(DeleteLocalDataEvent(
                                          index: index,
                                          context: context,
                                          mobileNo: data.mobileNumber!,
                                        ));
                                      },
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RegistrationFormPage(
                                                      isUpdate: true,
                                                      localData: data,
                                                      index: index),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: AppColor.prime,
                                        )),
                                  ],
                                )
                              ],
                            ),
                            Divider(),
                            _row(
                                leading: "Mobile Number : ",
                                training: data.mobileNumber ?? ""),
                            Divider(),
                            _row(
                                leading: "Name : ",
                                training: "${data.firstName} ${data.lastName}"),
                          ],
                        ),
                      ),
                    );
                  }),
          dataState.isGrpServerLoader == false
              ? Container()
              : Center(
                  child: PhysicalModel(
                    elevation: 21,
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.white,
                    shadowColor: AppColor.prime,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 21),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SpinLoader(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "Please wait",
                            style: Styles.labels,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
