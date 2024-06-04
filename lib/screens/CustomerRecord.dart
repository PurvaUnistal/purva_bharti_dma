import 'package:flutter/material.dart';
import 'package:pbg_app/models/save_customer_registration_model.dart';
import 'package:pbg_app/screens/custom_input_form/presentation/page/custom_input_form_screen.dart';
import 'package:pbg_app/utils/common_widgets/dotted_loader_widget.dart';
import '../ExportFile/export_file.dart';
import '../HiveDataStore/customer_reg_data_store.dart';

class SaveCustomerRegistrationPage extends StatefulWidget {
  const SaveCustomerRegistrationPage({Key key}) : super(key: key);

  @override
  State<SaveCustomerRegistrationPage> createState() =>
      _SaveCustomerRegistrationPageState();
}

class _SaveCustomerRegistrationPageState
    extends State<SaveCustomerRegistrationPage> {

  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    apiIntegration = ApiIntegration();
    customerRegistrationBox = Hive.box<SaveCustomerRegistrationOfflineModel>(
        SaveCusRegHiveDataStore.saveCustRegDataBoxName);
    customerRegistrationList = customerRegistrationBox.values.toList();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _connectivitySubscription.cancel();

    super.dispose();
  }
  bool _mobileData = false;
  bool _wifiData = false;
  bool _bothTypeData = false;
  bool canProceed = true;
  bool isOffline = false;
  bool dialogIsVisible = false;
  final Connectivity _connectivity = Connectivity();
  var syncColors = Colors.red;

  Box<SaveCustomerRegistrationOfflineModel> customerRegistrationBox;
  List<SaveCustomerRegistrationOfflineModel> customerRegistrationList;
  ApiIntegration apiIntegration;
  SaveCustRegReqModel saveCustRegReqModel;

  bool isLoading = false;
  final SaveCusRegHiveDataStore dataStore = SaveCusRegHiveDataStore();
  ValueNotifier<bool> isUpdate = ValueNotifier<bool>(false);

  Future fetchCustomerDataList() async {
    if(await ApiIntegration.isInternetConnected() == true){
      List<SaveCustomerRegistrationOfflineModel> data =   customerRegistrationBox.values.toList();
      int count = 0;
      for (int i = 0; i < data.length; i++) {
        log("data.length-->${customerRegistrationList.length}");
        setState(() {
          isLoading = true;
        });
        saveCustRegReqModel = SaveCustRegReqModel(
          schema: data[i].schema.toString(),
          interested: data[i].interested.toString(),
          societyAllowedMdpe: data[i].societyAllowedMdpe.toString(),
          areaId: data[i].areaId.toString(),
          firstName: data[i].firstName.toString(),
          middleName: data[i].middleName.toString(),
          lastName: data[i].lastName.toString(),
          mobileNumber: data[i].mobileNumber.toString(),
          alternateNumber: data[i].alternateMobileNo.toString(),
          emailId: data[i].emailId.toString(),
          guardianType: data[i].guardianType.toString(),
          guardianName: data[i].guardianName.toString(),
          propertyCategoryId: data[i].propertyCategoryId.toString(),
          propertyClassId: data[i].propertyClassId.toString(),
          reasonForHold: data[i].reasonForHold.toString(),
          dmaUserId: data[i].dmaUserId.toString(),
          dmaUserName: data[i].dmaUserName.toString(),
          houseNumber: data[i].houseNumber.toString(),
          colonySocietyApartment:
          data[i].colonySocietyApartment.toString(),
          streetName: data[i].streetName.toString(),
          town: data[i].town.toString(),
          districtId: data[i].districtId.toString(),
          pinCode: data[i].pinCode.toString(),
          residentStatus: data[i].residentStatus.toString(),
          noOfKitchen: data[i].noOfKitchen.toString(),
          noOfBathroom: data[i].noOfBathroom.toString(),
          existingCookingFuel:
          data[i].existingCookingFuel.toString(),
          noOfFamilyMembers: data[i].noOfFamilyMembers.toString(),
          latitude: data[i].latitude.toString(),
          longitude: data[i].longitude.toString(),
          remarks: data[i].remarks.toString(),
          kycDocument1: data[i].kycDocument1.toString(),
          kycDocument1Number: data[i].kycDocument1Number.toString(),
          kycDocument2: data[i].kycDocument2.toString(),
          kycDocument2Number: data[i].kycDocument2Number.toString(),
          kycDocument3: data[i].kycDocument3.toString(),
          kycDocument3Number: data[i].kycDocument3Number.toString(),
          initialAmount: data[i].initialAmount.toString(),
          bankAccountNumber: data[i].bankAccountNumber.toString(),
          bankAddress: data[i].bankAddress.toString(),
          bankIfscCode: data[i].bankIfscCode.toString(),
          chequeBankAccount: data[i].chequeBankAccount.toString(),
          chequeNumber: data[i].chequeNumber.toString(),
          depositeType: data[i].depositeType.toString(),
          initialDepositeDate:
          data[i].initialDepositeDate.toString(),
          initialDepositeStatus:
          data[i].initialDepositeStatus.toString(),
          modeOfDeposite: data[i].modeOfDeposite.toString(),
          nameOfBank: data[i].nameOfBank.toString().toString(),
          payementBankName: data[i].payementBankName.toString(),
          backSideImg1: data[i].backSidePhoto1.toString(),
          backSideImg2: data[i].backSidePhoto2.toString(),
          backSideImg3: data[i].backSidePhoto3.toString(),
          canceledCheque: data[i].canceledChequePhoto.toString(),
          chequePhoto: data[i].chequePhoto.toString(),
          uploadCustomerPhoto:
          data[i].uploadCustomerPhoto.toString(),
          uploadHousePhoto: data[i].uploadHousePhoto.toString(),
          docUploadsImg1: data[i].documentUploadsPhoto1.toString(),
          docUploadsImg2: data[i].documentUploadsPhoto2.toString(),
          docUploadsImg3: data[i].documentUploadsPhoto3.toString(),
          customerConsent: data[i].customerConsentPhoto,
          ownerConsent: data[i].ownerConsent.toString(),
          acceptConversionPolicy:
          data[i].acceptConversionPolicy.toString(),
          acceptExtraFittingCost:
          data[i].acceptExtraFittingCost.toString(),
          micr: data[i].micr.toString(),
          buildingNumber: data[i].buildingNumber.toString(),
        );
        try {
          var response = await apiIntegration.saveCustRegApi(context, saveCustRegReqModel);
          if (response != null) {
            setState(()  {
              isLoading = false;
              count++;
              log("deleteAt.length-->${customerRegistrationList.length}");
            });
            await customerRegistrationBox.deleteAt(i);
            await CustomToast.showToast(response.message[i].message.toString());
          } else {
            setState(() {
              isLoading = false;
            });
          }
        } catch (e) {
          if (mounted) {
            setState (() => isLoading = false);
          }

        }
        if (count == customerRegistrationList.length) {
          await clearCache();
          await customerRegistrationBox.clear();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => RegistrationForm()),
                (Route<dynamic> route) => false,
          );
        }
      }
    }
  }

  Future<void> clearCache() async {
    Directory path = Directory("/data/user/0/com.unistal.pbg_app/cache/");

    if(await path.exists()) {
      List<FileSystemEntity> files = path.listSync();
      for(FileSystemEntity f in files) {
        if(f is File) {
          await f.delete();
        }
      }
    }

    Directory path2 = Directory("/data/user/0/com.unistal.pbg_app/cache/file_picker/");

    if(await path2.exists()) {
      path2.deleteSync(recursive: true);
    }
  }

  Future fetchCustomerDataSingle({int index}) async {
    if(await ApiIntegration.isInternetConnected() == true){
      setState(() {
        isLoading = true;
      });
      List<SaveCustomerRegistrationOfflineModel> data =   customerRegistrationBox.values.toList();
      saveCustRegReqModel = SaveCustRegReqModel(
        schema: data[index].schema.toString(),
        interested: data[index].interested.toString(),
        societyAllowedMdpe: data[index].societyAllowedMdpe.toString(),
        areaId: data[index].areaId.toString(),
        firstName: data[index].firstName.toString(),
        middleName: data[index].middleName.toString(),
        lastName: data[index].lastName.toString(),
        mobileNumber: data[index].mobileNumber.toString(),
        alternateNumber: data[index].alternateMobileNo.toString(),
        emailId: data[index].emailId.toString(),
        guardianType: data[index].guardianType.toString(),
        guardianName: data[index].guardianName.toString(),
        propertyCategoryId: data[index].propertyCategoryId.toString(),
        propertyClassId: data[index].propertyClassId.toString(),
        reasonForHold: data[index].reasonForHold.toString(),
        dmaUserId: data[index].dmaUserId.toString(),
        dmaUserName: data[index].dmaUserName.toString(),
        houseNumber: data[index].houseNumber.toString(),
        colonySocietyApartment:
        data[index].colonySocietyApartment.toString(),
        streetName: data[index].streetName.toString(),
        town: data[index].town.toString(),
        districtId: data[index].districtId.toString(),
        pinCode: data[index].pinCode.toString(),
        residentStatus: data[index].residentStatus.toString(),
        noOfKitchen: data[index].noOfKitchen.toString(),
        noOfBathroom: data[index].noOfBathroom.toString(),
        existingCookingFuel: data[index].existingCookingFuel.toString(),
        noOfFamilyMembers: data[index].noOfFamilyMembers.toString(),
        latitude: data[index].latitude.toString(),
        longitude: data[index].longitude.toString(),
        remarks: data[index].remarks.toString(),
        kycDocument1: data[index].kycDocument1.toString(),
        kycDocument1Number: data[index].kycDocument1Number.toString(),
        kycDocument2: data[index].kycDocument2.toString(),
        kycDocument2Number: data[index].kycDocument2Number.toString(),
        kycDocument3: data[index].kycDocument3.toString(),
        kycDocument3Number: data[index].kycDocument3Number.toString(),
        initialAmount: data[index].initialAmount.toString(),
        bankAccountNumber: data[index].bankAccountNumber.toString(),
        bankAddress: data[index].bankAddress.toString(),
        bankIfscCode: data[index].bankIfscCode.toString(),
        chequeBankAccount: data[index].chequeBankAccount.toString(),
        chequeNumber: data[index].chequeNumber.toString(),
        depositeType: data[index].depositeType.toString(),
        initialDepositeDate: data[index].initialDepositeDate.toString(),
        initialDepositeStatus:
        data[index].initialDepositeStatus.toString(),
        modeOfDeposite: data[index].modeOfDeposite.toString(),
        nameOfBank: data[index].nameOfBank.toString().toString(),
        payementBankName: data[index].payementBankName.toString(),
        backSideImg1: data[index].backSidePhoto1.toString(),
        backSideImg2: data[index].backSidePhoto2.toString(),
        backSideImg3: data[index].backSidePhoto3.toString(),
        canceledCheque: data[index].canceledChequePhoto.toString(),
        chequePhoto: data[index].chequePhoto.toString(),
        uploadCustomerPhoto: data[index].uploadCustomerPhoto.toString(),
        uploadHousePhoto: data[index].uploadHousePhoto.toString(),
        docUploadsImg1: data[index].documentUploadsPhoto1.toString(),
        docUploadsImg2: data[index].documentUploadsPhoto2.toString(),
        docUploadsImg3: data[index].documentUploadsPhoto3.toString(),
        customerConsent: data[index].customerConsentPhoto,
        ownerConsent: data[index].ownerConsent.toString(),
        acceptConversionPolicy:
        data[index].acceptConversionPolicy.toString(),
        acceptExtraFittingCost:
        data[index].acceptExtraFittingCost.toString(),
        micr: data[index].micr.toString(),
        buildingNumber: data[index].buildingNumber.toString(),
      );
      var response = await apiIntegration.saveCustRegApi(context, saveCustRegReqModel);
      try {
        if (response != null) {
          setState(()  {
            isLoading = false;
            customerRegistrationBox.deleteAt(index);
            customerRegistrationList.removeAt(index);
            //  clearCache();
          });
          await  CustomToast.showToast(response.message[index].message);
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        log("catch${e.toString()}");
        CustomToast.showToast(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationForm()));
              },
            ),
            titleAppBar: "Customer Records",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildBox(
                      color: _mobileData ? Colors.green : Colors.red,
                      textTitle: "MOBILE DATA"),
                  _buildBox(
                      color: _wifiData ? Colors.green : Colors.red,
                      textTitle: "WI-FI"),
                  isLoading == false
                      ? _buildBox(
                    color: _bothTypeData ? Colors.green : Colors.red,
                    textTitle:  "Submit",
                    onTap: () async {
                      fetchCustomerDataList();
                    },
                  )
                      : _buildBox(
                    color: _bothTypeData ? Colors.green : Colors.red,
                    textTitle:  "Loading",
                    onTap: ()  {
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
             Flexible(
                child: Stack(
                  children: [
                    ValueListenableBuilder(
                        valueListenable: customerRegistrationBox.listenable(),
                        builder: (context, box, _) {
                          return customerRegistrationList.length == 0
                              ? SizedBox(height: MediaQuery.of(context).size.height * 0.7,child: const Center(child: Text("No Data Found")))
                              : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: customerRegistrationList.length,
                              itemBuilder: (context, position) {
                                SaveCustomerRegistrationOfflineModel
                                getStudent =
                                customerRegistrationList[position];
                                return Visibility(
                                  visible: true,
                                  child: Card(
                                    elevation: 5,
                                    shadowColor: Colors.red,
                                    color: Colors.white,
                                    shape: Border(
                                      left: BorderSide(
                                          color: Colors.red.withOpacity(.7),
                                          width: 3),
                                      right: BorderSide(
                                          color: Colors.green.shade800
                                              .withOpacity(.7),
                                          width: 3),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Records : ${position + 1}",
                                                    style:
                                                    appbarHeadingStyle,
                                                  ),
                                                  Spacer(),
                                                  isLoading == false ? IconButton(
                                                      icon: Icon(
                                                        Icons.sync, color: Colors.blue.shade900,),
                                                      onPressed: () async {
                                                        fetchCustomerDataSingle(index: position);
                                                      }
                                                  ) :Icon(
                                                    Icons.sync, color: Colors.blue.shade900,),
                                                  InkWell(
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                              Dialog(
                                                                child: Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      18.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                    children: [
                                                                      Text(
                                                                        "PBG DMA",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight.bold),
                                                                      ),
                                                                      Text(
                                                                          'Are you sure you want to delete :- ${getStudent.mobileNumber}?'),
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.center,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                            ButtonWidget(
                                                                              textButton: "Yes",
                                                                              onPressed: () async {
                                                                                Navigator.pop(context, false);
                                                                                customerRegistrationList.removeAt(position);
                                                                                customerRegistrationBox.deleteAt(position);
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                            ButtonWidget(
                                                                              textButton: "No",
                                                                              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.delete,
                                                        size: 30,
                                                        color: Colors
                                                            .blue.shade900,
                                                      )),
                                                  IconButton(
                                                      icon: Icon(Icons.edit,
                                                          color: Colors.blue
                                                              .shade900),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                    CustomInputForm(
                                                                      isUpdate: true,
                                                                      position: position,
                                                                      studentModel: getStudent,
                                                                    )));
                                                      })
                                                ],
                                              ),
                                              Divider(),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Mobile No",
                                                      style:
                                                      appbarHeadingStyle,
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      getStudent
                                                          .mobileNumber,
                                                      style:
                                                      appbarHeadingStyle,
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Divider(),
                                              Row(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Name",
                                                      style:
                                                      appbarHeadingStyle,
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      getStudent.firstName +
                                                          " " +
                                                          getStudent
                                                              .middleName +
                                                          " " +
                                                          getStudent
                                                              .lastName,
                                                      style:
                                                      appbarHeadingStyle,
                                                    ),
                                                  ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }),
                    isLoading == true ? Positioned(
                      child: AlertDialog(
                        title: Padding(
                          padding:
                          const EdgeInsets
                              .all(
                              18.0),
                          child: Column(
                            mainAxisSize:
                            MainAxisSize
                                .min,
                            mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .center,
                            children: [
                              Text('Please Wait',style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 12,
                              ),
                              DottedLoaderWidget()
                            ],
                          ),
                        ),
                      ),
                    ) :Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log(e.toString());
    }

    if (!mounted) {
      return;
    }
    _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    EasyLoading.dismiss();
    switch (result) {
      case ConnectivityResult.wifi:
        if (!mounted) return;
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
          _wifiData = true;
          _bothTypeData = true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _mobileData = true;
          _bothTypeData = true;
        });
        break;
      case ConnectivityResult.wifi:
        if (!mounted) return;
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
          _wifiData = true;
          _bothTypeData = true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _mobileData = true;
          _bothTypeData = true;
        });
        break;
      case ConnectivityResult.none:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          _mobileData = false;
          _wifiData = false;
          _bothTypeData = false;
          CustomToast.showToast("ERROR!!!!!\n INTERNET DISCONNECTED");
        });
        break;
      default:
        if (!mounted) return;
        setState(() => isOffline = true);
        break;
    }
  }

  void buildAlertDialog(String message, BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
      if (isOffline && !dialogIsVisible) {
        dialogIsVisible = true;
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.portable_wifi_off,
                      color: Colors.redAccent,
                      size: 36.0,
                    ),
                    canProceed
                        ? Text(
                      "Check your internet connection before proceeding.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0),
                    )
                        : Text(
                      "Please! proceed by connecting to a internet connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.0, color: Colors.red),
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                    ),
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                    child: Text(
                      "CLOSE THE APP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                    ),
                    onPressed: () {
                      if (isOffline) {
                        setState(() {
                          canProceed = false;
                        });
                      } else {
                        Navigator.pop(context);
                        //your code
                      }
                    },
                    child: Text(
                      "PROCEED",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            });
      }
    }));
  }

  Widget _buildBox({Color color, String textTitle, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 10,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(textTitle,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
