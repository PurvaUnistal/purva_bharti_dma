import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class ViewSyncRecordPage extends StatefulWidget {
  const ViewSyncRecordPage({Key? key}) : super(key: key);

  @override
  State<ViewSyncRecordPage> createState() => _ViewSyncRecordPageState();
}

class _ViewSyncRecordPageState extends State<ViewSyncRecordPage> {
  late List<SaveRegistrationFormModel> offlineDataList;
  late Box<SaveRegistrationFormModel> offlineBox;

  @override
  void initState() {
    BlocProvider.of<InternetBloc>(context).add(OnConnectedEvent());
    BlocProvider.of<ViewSyncRecordBloc>(context).add(
        ViewSyncRecordLoadPageEvent(context: context));
    HiveDataBase.registrationFormBox!;
    offlineBox = HiveDataBase.registrationFormBox!;
    offlineDataList = offlineBox.values.toList();
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
        body: BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            // TODO: implement listener}
            if (state is ConnectedState) {
              state.isConnected
                  ? Utils.successSnackBar(msg : state.msg,context: context)
                  : Utils.errorSnackBar(msg :state.msg,context: context);
            }
          },
          child: Column(children: [
            BlocBuilder<InternetBloc, InternetState>(
              builder: (context, state) {
                if (state is ConnectedState) {
                  return _checkNetBtnWidget(stateData: state);
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
                  return const Center(child: SpinLoader());
                }
              },
            ),
          ]),
        ));
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
        context: context,
        builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
            message: "Do you want to exit an View Sync Record Page?",
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
          RowBtnWidget(color: stateData.isMobile ? Colors.green : Colors.red,
              icon: Icons.signal_cellular_connected_no_internet_0_bar,
              text: AppString.mobile),
          RowBtnWidget(color: stateData.isWifi ? Colors.green : Colors.red,
              icon: Icons.wifi,
              text: AppString.wifi),
          RowBtnWidget(
            color: stateData.isConnected ? Colors.green : Colors.red,
            icon: Icons.sync,
            text: AppString.upload,
            onTap: () {
              BlocProvider.of<ViewSyncRecordBloc>(context)
                  .add(ViewSyncRecordLoadSaveServerDataEvent(context: context));
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
    return Expanded(
      child: ListView.builder(
          itemCount: offlineDataList.length,
          itemBuilder: (BuildContext context, int index) {
            var data = offlineDataList[index];
            return Card(
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
                        Text("Record : $index"),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.sync,
                                  color: AppColor.prime,
                                )),
                            IconButton(
                                icon: Icon(Icons.delete_forever, color: AppColor.prime,),
                                onPressed: () {
                                  BlocProvider.of<ViewSyncRecordBloc>(context).add(ViewSyncRecordDeleteLocalDataEvent(
                                      index: index, context: context, mobileNo: data.mobileNumber!,
                                  ));
                                },
                            ),
                            IconButton(
                                onPressed: () {
                                  BlocProvider.of<RegistrationFormBloc>(context).
                                  add(RegistrationFormLoadUpdateLocalDataEvent(context: context,index: index
                                  ));
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
                    _row(leading: "Mobile Number : ",
                        training: data.mobileNumber ?? ""),
                    Divider(),
                    _row(leading: "Name : ",
                        training: "${data.firstName} ${data.lastName}"),
                  ],
                ),
              ),
            );
          }),
    );
  }
}