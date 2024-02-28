import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class ViewSyncRecordPage extends StatefulWidget {
  const ViewSyncRecordPage({Key? key}) : super(key: key);

  @override
  State<ViewSyncRecordPage> createState() => _ViewSyncRecordPageState();
}

class _ViewSyncRecordPageState extends State<ViewSyncRecordPage> {
  late List<SaveCustomerRegistrationOfflineModel> offlineDataList;
  late Box<SaveCustomerRegistrationOfflineModel> offlineBox;

  @override
  void initState() {
    BlocProvider.of<InternetBloc>(context).add(OnConnectedEvent());
    BlocProvider.of<ViewSyncRecordBloc>(context).add(
        ViewSyncRecordLoadPageEvent(context: context));
    HiveDataBase.customerRegistrationBox!;
    offlineBox =  HiveDataBase.leadBoxCustomerRegistration!;
    offlineDataList = offlineBox.values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            titleAppBar: AppString.viewSyncRecord,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RoutesName.dashboardView);
              },
            ),
          ),
        ),
        body: BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            // TODO: implement listener}
            if (state is ConnectedState) {
              state.isConnected ? Utils.successSnackBar(state.msg, context) : Utils
                  .errorSnackBar(state.msg, context);
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

  _checkNetBtnWidget({required ConnectedState stateData}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBox(color: stateData.isMobile ? Colors.green : Colors.red,
              icon: Icons.signal_cellular_connected_no_internet_0_bar,
              textTitle: AppString.mobile),
          _buildBox(color: stateData.isWifi ? Colors.green : Colors.red,
              icon: Icons.wifi,
              textTitle: AppString.wifi),
          _buildBox(
            color: stateData.isConnected ? Colors.green : Colors.red,
            icon: Icons.sync,
            textTitle: AppString.upload,
            onTap: () {
              BlocProvider.of<ViewSyncRecordBloc>(context)
                  .add(ViewSyncRecordLoadSaveServerDataEvent(context: context));
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
              Text(textTitle!, textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white,
                      fontSize: 12.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
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
                  side: BorderSide(width: 0.8, color: AppColor.appBlueColor)),
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
                                  color: AppColor.appBlueColor,
                                )),

                            IconButton(
                                onPressed: () {
                                  BlocProvider.of<ViewSyncRecordBloc>(context)
                                      .add(ViewSyncRecordDeleteLocalEvent(
                                      index: index,
                                      context: context,
                                      mobileNo: data.mobileNumber!,
                                    offlineDataList: offlineDataList,
                                    offlineBox: offlineBox,
                                  ));
                                },
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: AppColor.appBlueColor,
                                )),
                            IconButton(
                                onPressed: () {
                                  BlocProvider.of<ViewSyncRecordBloc>(context).add(ViewSyncRecordUpdateLocalDataEvent(
                                    context: context,index: index,localData: data
                                  ));
                                  /*Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                      CustomerRegistrationFormPage(isUpdate: true, position: index, localData: data)));*/
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: AppColor.appBlueColor,
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