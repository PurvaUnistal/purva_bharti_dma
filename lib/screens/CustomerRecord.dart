import 'package:flutter/material.dart';
import 'package:hpcl_app/models/save_customer_registration_model.dart';
import 'package:hpcl_app/screens/custom_input_form_screen.dart';
import 'package:hpcl_app/utils/common_widgets/loading_widget.dart';
import '../ExportFile/export_file.dart';
import '../HiveDataStore/customer_reg_data_store.dart';

class CustomerRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomerRecordState();
  }
}

class CustomerRecordState extends BaseState<CustomerRecord> {
  bool _checkInBtnStatus = false;
  bool _checkOutBtnStatus = false;
  bool _checkOutBtnboth = false;
  bool canProceed = true;
  bool isOffline = false;
  bool dialogIsVisible = false;
  final Connectivity _connectivity = Connectivity();
  var syncColors = Colors.red;

  GlobalKey<FormState> _keyLoader = GlobalKey<FormState>();

  Box<SaveCustomerRegistrationOfflineModel> customerRegistrationBox;
  List<SaveCustomerRegistrationOfflineModel> customerRegistrationList;
  ApiIntegration apiIntegration;
  SaveCustRegReqModel saveCustRegReqModel;

  bool isLoading = false;
  final SaveCusRegHiveDataStore dataStore = SaveCusRegHiveDataStore();
  ValueNotifier<bool> isUpdate = ValueNotifier<bool>(false);

  @override
  void initState() {
    initConnectivity();
    apiIntegration = ApiIntegration();
    customerRegistrationBox = Hive.box<SaveCustomerRegistrationOfflineModel>(
        SaveCusRegHiveDataStore.saveCustRegDataBoxName);
    customerRegistrationList = customerRegistrationBox.values.toList();
    super.initState();
  }

  Future fetchCustomerDataList() async {
    if (_checkOutBtnboth) {
      int count = 0;
      for (int i = 0; i < customerRegistrationList.length; i++) {
        SaveCustomerRegistrationOfflineModel saveCustRegOffModel =
        customerRegistrationList[i];
        setState(() {
          isLoading = true;
        });
        saveCustRegReqModel = SaveCustRegReqModel(
          schema: saveCustRegOffModel.schema,
          interested: saveCustRegOffModel.interested,
          societyAllowedMdpe: saveCustRegOffModel.societyAllowedMdpe,
          areaId: saveCustRegOffModel.areaId,
          firstName: saveCustRegOffModel.firstName,
          middleName: saveCustRegOffModel.middleName,
          lastName: saveCustRegOffModel.lastName,
          mobileNumber: saveCustRegOffModel.mobileNumber,
          emailId: saveCustRegOffModel.emailId,
          guardianType: saveCustRegOffModel.guardianType,
          guardianName: saveCustRegOffModel.guardianName,
          propertyCategoryId: saveCustRegOffModel.propertyCategoryId,
          propertyClassId: saveCustRegOffModel.propertyClassId,
          reasonForHold: saveCustRegOffModel.reasonForHold,
          dmaUserId: saveCustRegOffModel.dmaUserId,
          dmaUserName: saveCustRegOffModel.dmaUserName,
          houseNumber: saveCustRegOffModel.houseNumber,
          colonySocietyApartment: saveCustRegOffModel.colonySocietyApartment,
          streetName: saveCustRegOffModel.streetName,
          town: saveCustRegOffModel.town,
          districtId: saveCustRegOffModel.districtId,
          pinCode: saveCustRegOffModel.pinCode,
          residentStatus: saveCustRegOffModel.residentStatus,
          noOfKitchen: saveCustRegOffModel.noOfKitchen,
          noOfBathroom: saveCustRegOffModel.noOfBathroom,
          existingCookingFuel: saveCustRegOffModel.existingCookingFuel,
          noOfFamilyMembers: saveCustRegOffModel.noOfFamilyMembers,
          latitude: saveCustRegOffModel.latitude,
          longitude: saveCustRegOffModel.longitude,
          remarks: saveCustRegOffModel.remarks,
          kycDocument1: saveCustRegOffModel.kycDocument1,
          kycDocument1Number: saveCustRegOffModel.kycDocument1Number,
          kycDocument2: saveCustRegOffModel.kycDocument2,
          kycDocument2Number: saveCustRegOffModel.kycDocument2Number,
          kycDocument3: saveCustRegOffModel.kycDocument3,
          initialAmount: saveCustRegOffModel.initialAmount,
          bankAccountNumber: saveCustRegOffModel.bankAccountNumber,
          bankAddress: saveCustRegOffModel.bankAddress,
          bankIfscCode: saveCustRegOffModel.bankIfscCode,
          chequeBankAccount: saveCustRegOffModel.chequeBankAccount,
          chequeNumber: saveCustRegOffModel.chequeNumber,
          customerConsent: saveCustRegOffModel.customerConsentPhoto,
          depositeType: saveCustRegOffModel.depositeType,
          initialDepositeDate: saveCustRegOffModel.initialDepositeDate,
          initialDepositeStatus: saveCustRegOffModel.initialDepositeStatus,
          modeOfDeposite: saveCustRegOffModel.modeOfDeposite,
          nameOfBank: saveCustRegOffModel.nameOfBank,
          ownerConsent: saveCustRegOffModel.ownerConsent,
          payementBankName: saveCustRegOffModel.payementBankName,
          backSideImg1: saveCustRegOffModel.backSidePhoto1,
          backSideImg2: saveCustRegOffModel.backSidePhoto2,
          backSideImg3: saveCustRegOffModel.backSidePhoto3,
          canceledCheque: saveCustRegOffModel.canceledChequePhoto,
          chequePhoto: saveCustRegOffModel.chequePhoto,
          uploadCustomerPhoto: saveCustRegOffModel.uploadCustomerPhoto,
          uploadHousePhoto: saveCustRegOffModel.uploadHousePhoto,
          frontSideImg1: saveCustRegOffModel.documentUploadsPhoto1,
          frontSideImg2: saveCustRegOffModel.documentUploadsPhoto2,
          frontSideImg3: saveCustRegOffModel.documentUploadsPhoto3,
          acceptConversionPolicy: saveCustRegOffModel.acceptConversionPolicy,
          acceptExtraFittingCost: saveCustRegOffModel.acceptExtraFittingCost,
          micr: saveCustRegOffModel.micr,
          buildingNumber: saveCustRegOffModel.buildingNumber,
        );
        print("saveCustRegReqModel--->" + saveCustRegReqModel.toJson().toString());
        var response = await apiIntegration.saveCustRegApi(saveCustRegReqModel);
        print(response.toString());
        try {
          if (response != null) {
            setState(() {
              isLoading = false;
            });
            setState(() {
              count++;
            });
            CustomToast.showToast(response.message[0].message.toString());

          } else {
            setState(() {
              isLoading = false;
            });
            CustomToast.showToast(response.message[0].message.toString());
          }
        } catch (e) {
          setState(() {
            isLoading = false;
          });
          CustomToast.showToast(e.toString());
        }
      }
      for (int i = count - 1; i >= 0; i--) {
        customerRegistrationList.removeAt(i);
        await customerRegistrationBox.deleteAt(i);
      }
      if (count == customerRegistrationList.length) {
        await SaveCusRegHiveDataStore.box.clear();
        CustomToast.showToast('Great Success! \n Record Save');
      }
      customerRegistrationList.removeRange(0, count);

  //    CustomToast.showToast("Data saved successfully");
    }
  }


  Future fetchCustomerDataSingle({int index}) async {
    if (_checkOutBtnboth) {
      setState(() {
        isLoading = true;
      });
      SaveCustomerRegistrationOfflineModel saveCustRegOffModel =
      customerRegistrationList[index];
      saveCustRegReqModel = SaveCustRegReqModel(
        schema: saveCustRegOffModel.schema,
        interested: saveCustRegOffModel.interested,
        societyAllowedMdpe: saveCustRegOffModel.societyAllowedMdpe,
        areaId: saveCustRegOffModel.areaId,
        firstName: saveCustRegOffModel.firstName,
        middleName: saveCustRegOffModel.middleName,
        lastName: saveCustRegOffModel.lastName,
        mobileNumber: saveCustRegOffModel.mobileNumber,
        emailId: saveCustRegOffModel.emailId,
        guardianType: saveCustRegOffModel.guardianType,
        guardianName: saveCustRegOffModel.guardianName,
        propertyCategoryId: saveCustRegOffModel.propertyCategoryId,
        propertyClassId: saveCustRegOffModel.propertyClassId,
        reasonForHold: saveCustRegOffModel.reasonForHold,
        dmaUserId: saveCustRegOffModel.dmaUserId,
        dmaUserName: saveCustRegOffModel.dmaUserName,
        houseNumber: saveCustRegOffModel.houseNumber,
        colonySocietyApartment: saveCustRegOffModel.colonySocietyApartment,
        streetName: saveCustRegOffModel.streetName,
        town: saveCustRegOffModel.town,
        districtId: saveCustRegOffModel.districtId,
        pinCode: saveCustRegOffModel.pinCode,
        residentStatus: saveCustRegOffModel.residentStatus,
        noOfKitchen: saveCustRegOffModel.noOfKitchen,
        noOfBathroom: saveCustRegOffModel.noOfBathroom,
        existingCookingFuel: saveCustRegOffModel.existingCookingFuel,
        noOfFamilyMembers: saveCustRegOffModel.noOfFamilyMembers,
        latitude: saveCustRegOffModel.latitude,
        longitude: saveCustRegOffModel.longitude,
        remarks: saveCustRegOffModel.remarks,
        kycDocument1: saveCustRegOffModel.kycDocument1,
        kycDocument1Number: saveCustRegOffModel.kycDocument1Number,
        kycDocument2: saveCustRegOffModel.kycDocument2,
        kycDocument2Number: saveCustRegOffModel.kycDocument2Number,
        kycDocument3: saveCustRegOffModel.kycDocument3,
        initialAmount: saveCustRegOffModel.initialAmount,
        bankAccountNumber: saveCustRegOffModel.bankAccountNumber,
        bankAddress: saveCustRegOffModel.bankAddress,
        bankIfscCode: saveCustRegOffModel.bankIfscCode,
        chequeBankAccount: saveCustRegOffModel.chequeBankAccount,
        chequeNumber: saveCustRegOffModel.chequeNumber,
        customerConsent: saveCustRegOffModel.customerConsentPhoto,
        depositeType: saveCustRegOffModel.depositeType,
        initialDepositeDate: saveCustRegOffModel.initialDepositeDate,
        initialDepositeStatus: saveCustRegOffModel.initialDepositeStatus,
        modeOfDeposite: saveCustRegOffModel.modeOfDeposite,
        nameOfBank: saveCustRegOffModel.nameOfBank,
        ownerConsent: saveCustRegOffModel.ownerConsent,
        payementBankName: saveCustRegOffModel.payementBankName,
        backSideImg1: saveCustRegOffModel.backSidePhoto1,
        backSideImg2: saveCustRegOffModel.backSidePhoto2,
        backSideImg3: saveCustRegOffModel.backSidePhoto3,
        canceledCheque: saveCustRegOffModel.canceledChequePhoto,
        chequePhoto: saveCustRegOffModel.chequePhoto,
        uploadCustomerPhoto: saveCustRegOffModel.uploadCustomerPhoto,
        uploadHousePhoto: saveCustRegOffModel.uploadHousePhoto,
        frontSideImg1: saveCustRegOffModel.documentUploadsPhoto1,
        frontSideImg2: saveCustRegOffModel.documentUploadsPhoto2,
        frontSideImg3: saveCustRegOffModel.documentUploadsPhoto3,
        acceptConversionPolicy: saveCustRegOffModel.acceptConversionPolicy,
        acceptExtraFittingCost: saveCustRegOffModel.acceptExtraFittingCost,
        micr: saveCustRegOffModel.micr,
        buildingNumber: saveCustRegOffModel.buildingNumber,

      );
      print(
          "saveCustRegReqModel--->" + saveCustRegReqModel.toJson().toString());
      var response = await apiIntegration.saveCustRegApi(saveCustRegReqModel);
      print(response.toString());
      try {
         if(response.message != null){
           setState(() {
             isLoading = false;
           });
          customerRegistrationList.removeAt(index);
          customerRegistrationBox.deleteAt(index);
          CustomToast.showToast(response.message[0].message);
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        CustomToast.showToast(e.toString());
      }
    }
  }

  @override
  Widget buildView(BuildContext context) {
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
          child: ListView(
            children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildBox(
                      color: _checkInBtnStatus ? Colors.green : Colors.red,
                      textTitle: "MOBILE DATA"),
                  _buildBox(
                      color: _checkOutBtnStatus ? Colors.green : Colors.red,
                      textTitle: "WI-FI"),
                  _buildBox(
                    color: _checkOutBtnboth ? Colors.green : Colors.red,
                    textTitle:isLoading ? "Loading" : "Submit",
                    onTap: () async {
                      fetchCustomerDataList();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ValueListenableBuilder(
                        valueListenable: customerRegistrationBox.listenable(),
                        builder: (context, box, _) {
                          return customerRegistrationList.length == 0
                              ? const Center(child: Text("No Data Found"))
                              : ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
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
                                        left: BorderSide(color: Colors.red.withOpacity(.7), width: 3),
                                        right: BorderSide(color: Colors.blue.shade900.withOpacity(.7), width: 3),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Records : ${position + 1}",
                                                    style: appbarHeadingStyle,
                                                  ),
                                                  Spacer(),
                                                   IconButton(
                                                    icon: Icon(
                                                      Icons.sync,
                                                      color: Colors.blue.shade900,
                                                    ),
                                                    onPressed: () =>
                                                        fetchCustomerDataSingle(
                                                            index: position),
                                                  ),
                                                  InkWell(
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder: (context) => Dialog(
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(18.0),
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      Text("HPCL DMA",style: TextStyle(fontWeight: FontWeight.bold),),
                                                                      Text('Are you sure you want to delete :- ${getStudent.mobileNumber}?'),
                                                                      Row(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          Flexible(
                                                                            child: ButtonWidget(
                                                                              textButton: "Yes",
                                                                              onPressed: () async {
                                                                                Navigator.pop(context, false);
                                                                                customerRegistrationList.removeAt(position);
                                                                                customerRegistrationBox.deleteAt(position);
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child: ButtonWidget(
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
                                                          color: Colors
                                                              .blue.shade900),
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
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text("Mobile No", style: appbarHeadingStyle,),
                                                    Spacer(),
                                                    Text(getStudent.mobileNumber, style: appbarHeadingStyle,),
                                                  ]),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Divider(),
                                              Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text("Name", style: appbarHeadingStyle,),
                                                    Spacer(),
                                                    Text(getStudent.firstName+" "+getStudent.middleName+" "+getStudent.lastName, style: appbarHeadingStyle,
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
                  ),
                  isLoading ? Center(child: LoadingWidget()) :Container()
                ],
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
      print(e.toString());
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
          _checkOutBtnStatus = true;
          _checkOutBtnboth = true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _checkInBtnStatus = true;
          _checkOutBtnboth = true;
        });
        break;
      case ConnectivityResult.wifi:
        if (!mounted) return;
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
          _checkOutBtnStatus = true;
          _checkOutBtnboth = true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _checkInBtnStatus = true;
          _checkOutBtnboth = true;
        });
        break;
      case ConnectivityResult.none:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          _checkInBtnStatus = false;
          _checkOutBtnStatus = false;
          _checkOutBtnboth = false;
          EasyLoading.dismiss();
          EasyLoading.showError("ERROR!!!!!\n INTERNET DISCONNECTED");
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
