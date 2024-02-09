import 'package:flutter/material.dart';
import 'package:pbg_app/models/save_customer_registration_model.dart';
import 'package:pbg_app/screens/custom_input_form/presentation/page/custom_input_form_screen.dart';
import 'package:pbg_app/utils/common_widgets/loading_widget.dart';
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
  @override
  void initState() {
    initConnectivity();
    apiIntegration = ApiIntegration();
    customerRegistrationBox = Hive.box<SaveCustomerRegistrationOfflineModel>(
        SaveCusRegHiveDataStore.saveCustRegDataBoxName);
    customerRegistrationList = customerRegistrationBox.values.toList();
    // TODO: implement initState
    super.initState();
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
    if (_bothTypeData) {
      int count = 0;
      for (int i = 0; i < customerRegistrationList.length; i++) {
        SaveCustomerRegistrationOfflineModel saveCustRegOffModel =
        customerRegistrationList[i];
        setState(() {
          isLoading = true;
        });
        saveCustRegReqModel = SaveCustRegReqModel(
          schema: saveCustRegOffModel.schema.toString(),
          interested: saveCustRegOffModel.interested.toString(),
          societyAllowedMdpe: saveCustRegOffModel.societyAllowedMdpe.toString(),
          areaId: saveCustRegOffModel.areaId.toString(),
          firstName: saveCustRegOffModel.firstName.toString(),
          middleName: saveCustRegOffModel.middleName.toString(),
          lastName: saveCustRegOffModel.lastName.toString(),
          mobileNumber: saveCustRegOffModel.mobileNumber.toString(),
          alternateNumber: saveCustRegOffModel.alternateMobileNo.toString(),
          emailId: saveCustRegOffModel.emailId.toString(),
          guardianType: saveCustRegOffModel.guardianType.toString(),
          guardianName: saveCustRegOffModel.guardianName.toString(),
          propertyCategoryId: saveCustRegOffModel.propertyCategoryId.toString(),
          propertyClassId: saveCustRegOffModel.propertyClassId.toString(),
          reasonForHold: saveCustRegOffModel.reasonForHold.toString(),
          dmaUserId: saveCustRegOffModel.dmaUserId.toString(),
          dmaUserName: saveCustRegOffModel.dmaUserName.toString(),
          houseNumber: saveCustRegOffModel.houseNumber.toString(),
          colonySocietyApartment:
          saveCustRegOffModel.colonySocietyApartment.toString(),
          streetName: saveCustRegOffModel.streetName.toString(),
          town: saveCustRegOffModel.town.toString(),
          districtId: saveCustRegOffModel.districtId.toString(),
          pinCode: saveCustRegOffModel.pinCode.toString(),
          residentStatus: saveCustRegOffModel.residentStatus.toString(),
          noOfKitchen: saveCustRegOffModel.noOfKitchen.toString(),
          noOfBathroom: saveCustRegOffModel.noOfBathroom.toString(),
          existingCookingFuel:
          saveCustRegOffModel.existingCookingFuel.toString(),
          noOfFamilyMembers: saveCustRegOffModel.noOfFamilyMembers.toString(),
          latitude: saveCustRegOffModel.latitude.toString(),
          longitude: saveCustRegOffModel.longitude.toString(),
          remarks: saveCustRegOffModel.remarks.toString(),
          kycDocument1: saveCustRegOffModel.kycDocument1.toString(),
          kycDocument1Number: saveCustRegOffModel.kycDocument1Number.toString(),
          kycDocument2: saveCustRegOffModel.kycDocument2.toString(),
          kycDocument2Number: saveCustRegOffModel.kycDocument2Number.toString(),
          kycDocument3: saveCustRegOffModel.kycDocument3.toString(),
          kycDocument3Number: saveCustRegOffModel.kycDocument3Number.toString(),
          initialAmount: saveCustRegOffModel.initialAmount.toString(),
          bankAccountNumber: saveCustRegOffModel.bankAccountNumber.toString(),
          bankAddress: saveCustRegOffModel.bankAddress.toString(),
          bankIfscCode: saveCustRegOffModel.bankIfscCode.toString(),
          chequeBankAccount: saveCustRegOffModel.chequeBankAccount.toString(),
          chequeNumber: saveCustRegOffModel.chequeNumber.toString(),
          depositeType: saveCustRegOffModel.depositeType.toString(),
          initialDepositeDate:
          saveCustRegOffModel.initialDepositeDate.toString(),
          initialDepositeStatus:
          saveCustRegOffModel.initialDepositeStatus.toString(),
          modeOfDeposite: saveCustRegOffModel.modeOfDeposite.toString(),
          nameOfBank: saveCustRegOffModel.nameOfBank.toString().toString(),
          payementBankName: saveCustRegOffModel.payementBankName.toString(),
          backSideImg1: saveCustRegOffModel.backSidePhoto1.toString(),
          backSideImg2: saveCustRegOffModel.backSidePhoto2.toString(),
          backSideImg3: saveCustRegOffModel.backSidePhoto3.toString(),
          canceledCheque: saveCustRegOffModel.canceledChequePhoto.toString(),
          chequePhoto: saveCustRegOffModel.chequePhoto.toString(),
          uploadCustomerPhoto:
          saveCustRegOffModel.uploadCustomerPhoto.toString(),
          uploadHousePhoto: saveCustRegOffModel.uploadHousePhoto.toString(),
          docUploadsImg1: saveCustRegOffModel.documentUploadsPhoto1.toString(),
          docUploadsImg2: saveCustRegOffModel.documentUploadsPhoto2.toString(),
          docUploadsImg3: saveCustRegOffModel.documentUploadsPhoto3.toString(),
          customerConsent: saveCustRegOffModel.customerConsentPhoto,
          ownerConsent: saveCustRegOffModel.ownerConsent.toString(),
          acceptConversionPolicy:
          saveCustRegOffModel.acceptConversionPolicy.toString(),
          acceptExtraFittingCost:
          saveCustRegOffModel.acceptExtraFittingCost.toString(),
          micr: saveCustRegOffModel.micr.toString(),
          buildingNumber: saveCustRegOffModel.buildingNumber.toString(),
        );
        log("saveCustRegReqModel--->" +
            saveCustRegReqModel.toJson().toString());
        try {
          var response =
          await apiIntegration.saveCustRegApi(saveCustRegReqModel);
          log(response.toString());
          if (response != null) {
            setState(() {
              isLoading = false;
              count++;
            });
            CustomToast.showToast(response.message[0].message.toString());
          } else {
            setState(() {
              isLoading = false;
            });
            //  CustomToast.showToast(response.message[0].message.toString());
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
      }
      log("ASDFGHNJGFDS-->${customerRegistrationList.length}");
      customerRegistrationList.removeRange(0, count);
      //   CustomToast.showToast("Data saved successfully");
    }
  }

  Future fetchCustomerDataGrpList() async {
    if (_bothTypeData) {
      for (int i = 0; i < customerRegistrationList.length; i++) {
        SaveCustomerRegistrationOfflineModel saveCustRegOffModel =
        customerRegistrationList[i];
        setState(() {
          isLoading = true;
        });
        saveCustRegReqModel = SaveCustRegReqModel(
          schema: saveCustRegOffModel.schema.toString(),
          interested: saveCustRegOffModel.interested.toString(),
          societyAllowedMdpe: saveCustRegOffModel.societyAllowedMdpe.toString(),
          areaId: saveCustRegOffModel.areaId.toString(),
          firstName: saveCustRegOffModel.firstName.toString(),
          middleName: saveCustRegOffModel.middleName.toString(),
          lastName: saveCustRegOffModel.lastName.toString(),
          mobileNumber: saveCustRegOffModel.mobileNumber.toString(),
          alternateNumber: saveCustRegOffModel.alternateMobileNo.toString(),
          emailId: saveCustRegOffModel.emailId.toString(),
          guardianType: saveCustRegOffModel.guardianType.toString(),
          guardianName: saveCustRegOffModel.guardianName.toString(),
          propertyCategoryId: saveCustRegOffModel.propertyCategoryId.toString(),
          propertyClassId: saveCustRegOffModel.propertyClassId.toString(),
          reasonForHold: saveCustRegOffModel.reasonForHold.toString(),
          dmaUserId: saveCustRegOffModel.dmaUserId.toString(),
          dmaUserName: saveCustRegOffModel.dmaUserName.toString(),
          houseNumber: saveCustRegOffModel.houseNumber.toString(),
          colonySocietyApartment:
          saveCustRegOffModel.colonySocietyApartment.toString(),
          streetName: saveCustRegOffModel.streetName.toString(),
          town: saveCustRegOffModel.town.toString(),
          districtId: saveCustRegOffModel.districtId.toString(),
          pinCode: saveCustRegOffModel.pinCode.toString(),
          residentStatus: saveCustRegOffModel.residentStatus.toString(),
          noOfKitchen: saveCustRegOffModel.noOfKitchen.toString(),
          noOfBathroom: saveCustRegOffModel.noOfBathroom.toString(),
          existingCookingFuel:
          saveCustRegOffModel.existingCookingFuel.toString(),
          noOfFamilyMembers: saveCustRegOffModel.noOfFamilyMembers.toString(),
          latitude: saveCustRegOffModel.latitude.toString(),
          longitude: saveCustRegOffModel.longitude.toString(),
          remarks: saveCustRegOffModel.remarks.toString(),
          kycDocument1: saveCustRegOffModel.kycDocument1.toString(),
          kycDocument1Number: saveCustRegOffModel.kycDocument1Number.toString(),
          kycDocument2: saveCustRegOffModel.kycDocument2.toString(),
          kycDocument2Number: saveCustRegOffModel.kycDocument2Number.toString(),
          kycDocument3: saveCustRegOffModel.kycDocument3.toString(),
          kycDocument3Number: saveCustRegOffModel.kycDocument3Number.toString(),
          initialAmount: saveCustRegOffModel.initialAmount.toString(),
          bankAccountNumber: saveCustRegOffModel.bankAccountNumber.toString(),
          bankAddress: saveCustRegOffModel.bankAddress.toString(),
          bankIfscCode: saveCustRegOffModel.bankIfscCode.toString(),
          chequeBankAccount: saveCustRegOffModel.chequeBankAccount.toString(),
          chequeNumber: saveCustRegOffModel.chequeNumber.toString(),
          depositeType: saveCustRegOffModel.depositeType.toString(),
          initialDepositeDate:
          saveCustRegOffModel.initialDepositeDate.toString(),
          initialDepositeStatus:
          saveCustRegOffModel.initialDepositeStatus.toString(),
          modeOfDeposite: saveCustRegOffModel.modeOfDeposite.toString(),
          nameOfBank: saveCustRegOffModel.nameOfBank.toString().toString(),
          payementBankName: saveCustRegOffModel.payementBankName.toString(),
          backSideImg1: saveCustRegOffModel.backSidePhoto1.toString(),
          backSideImg2: saveCustRegOffModel.backSidePhoto2.toString(),
          backSideImg3: saveCustRegOffModel.backSidePhoto3.toString(),
          canceledCheque: saveCustRegOffModel.canceledChequePhoto.toString(),
          chequePhoto: saveCustRegOffModel.chequePhoto.toString(),
          uploadCustomerPhoto:
          saveCustRegOffModel.uploadCustomerPhoto.toString(),
          uploadHousePhoto: saveCustRegOffModel.uploadHousePhoto.toString(),
          docUploadsImg1: saveCustRegOffModel.documentUploadsPhoto1.toString(),
          docUploadsImg2: saveCustRegOffModel.documentUploadsPhoto2.toString(),
          docUploadsImg3: saveCustRegOffModel.documentUploadsPhoto3.toString(),
          customerConsent: saveCustRegOffModel.customerConsentPhoto,
          ownerConsent: saveCustRegOffModel.ownerConsent.toString(),
          acceptConversionPolicy:
          saveCustRegOffModel.acceptConversionPolicy.toString(),
          acceptExtraFittingCost:
          saveCustRegOffModel.acceptExtraFittingCost.toString(),
          micr: saveCustRegOffModel.micr.toString(),
          buildingNumber: saveCustRegOffModel.buildingNumber.toString(),
        );
        log("saveCustRegReqModel--->" +
            saveCustRegReqModel.toJson().toString());
        try {
          var response =
          await apiIntegration.saveCustRegApi(saveCustRegReqModel);
          log("response-->${response.toString()}");
          if (response != null) {
            setState(() {
              isLoading = false;
            });
            CustomToast.showToast(response.message[i].message.toString());
          } else {
            setState(() {
              isLoading = false;
            });
            //  CustomToast.showToast(response.message[0].message.toString());
          }
        } catch (e) {
          setState(() {
            isLoading = false;
          });
          CustomToast.showToast(e.toString());
        }
      }
    }
  }

  Future fetchCustomerDataSingle({int index}) async {
    if(await ApiIntegration.isInternetConnected() == true){
      setState(() {
        isLoading = true;
      });
      SaveCustomerRegistrationOfflineModel saveCustRegOffModel =
      customerRegistrationList[index];
      saveCustRegReqModel = SaveCustRegReqModel(
        schema: saveCustRegOffModel.schema.toString(),
        interested: saveCustRegOffModel.interested.toString(),
        societyAllowedMdpe: saveCustRegOffModel.societyAllowedMdpe.toString(),
        areaId: saveCustRegOffModel.areaId.toString(),
        firstName: saveCustRegOffModel.firstName.toString(),
        middleName: saveCustRegOffModel.middleName.toString(),
        lastName: saveCustRegOffModel.lastName.toString(),
        mobileNumber: saveCustRegOffModel.mobileNumber.toString(),
        alternateNumber: saveCustRegOffModel.alternateMobileNo.toString(),
        emailId: saveCustRegOffModel.emailId.toString(),
        guardianType: saveCustRegOffModel.guardianType.toString(),
        guardianName: saveCustRegOffModel.guardianName.toString(),
        propertyCategoryId: saveCustRegOffModel.propertyCategoryId.toString(),
        propertyClassId: saveCustRegOffModel.propertyClassId.toString(),
        reasonForHold: saveCustRegOffModel.reasonForHold.toString(),
        dmaUserId: saveCustRegOffModel.dmaUserId.toString(),
        dmaUserName: saveCustRegOffModel.dmaUserName.toString(),
        houseNumber: saveCustRegOffModel.houseNumber.toString(),
        colonySocietyApartment:
        saveCustRegOffModel.colonySocietyApartment.toString(),
        streetName: saveCustRegOffModel.streetName.toString(),
        town: saveCustRegOffModel.town.toString(),
        districtId: saveCustRegOffModel.districtId.toString(),
        pinCode: saveCustRegOffModel.pinCode.toString(),
        residentStatus: saveCustRegOffModel.residentStatus.toString(),
        noOfKitchen: saveCustRegOffModel.noOfKitchen.toString(),
        noOfBathroom: saveCustRegOffModel.noOfBathroom.toString(),
        existingCookingFuel: saveCustRegOffModel.existingCookingFuel.toString(),
        noOfFamilyMembers: saveCustRegOffModel.noOfFamilyMembers.toString(),
        latitude: saveCustRegOffModel.latitude.toString(),
        longitude: saveCustRegOffModel.longitude.toString(),
        remarks: saveCustRegOffModel.remarks.toString(),
        kycDocument1: saveCustRegOffModel.kycDocument1.toString(),
        kycDocument1Number: saveCustRegOffModel.kycDocument1Number.toString(),
        kycDocument2: saveCustRegOffModel.kycDocument2.toString(),
        kycDocument2Number: saveCustRegOffModel.kycDocument2Number.toString(),
        kycDocument3: saveCustRegOffModel.kycDocument3.toString(),
        kycDocument3Number: saveCustRegOffModel.kycDocument3Number.toString(),
        initialAmount: saveCustRegOffModel.initialAmount.toString(),
        bankAccountNumber: saveCustRegOffModel.bankAccountNumber.toString(),
        bankAddress: saveCustRegOffModel.bankAddress.toString(),
        bankIfscCode: saveCustRegOffModel.bankIfscCode.toString(),
        chequeBankAccount: saveCustRegOffModel.chequeBankAccount.toString(),
        chequeNumber: saveCustRegOffModel.chequeNumber.toString(),
        depositeType: saveCustRegOffModel.depositeType.toString(),
        initialDepositeDate: saveCustRegOffModel.initialDepositeDate.toString(),
        initialDepositeStatus:
        saveCustRegOffModel.initialDepositeStatus.toString(),
        modeOfDeposite: saveCustRegOffModel.modeOfDeposite.toString(),
        nameOfBank: saveCustRegOffModel.nameOfBank.toString().toString(),
        payementBankName: saveCustRegOffModel.payementBankName.toString(),
        backSideImg1: saveCustRegOffModel.backSidePhoto1.toString(),
        backSideImg2: saveCustRegOffModel.backSidePhoto2.toString(),
        backSideImg3: saveCustRegOffModel.backSidePhoto3.toString(),
        canceledCheque: saveCustRegOffModel.canceledChequePhoto.toString(),
        chequePhoto: saveCustRegOffModel.chequePhoto.toString(),
        uploadCustomerPhoto: saveCustRegOffModel.uploadCustomerPhoto.toString(),
        uploadHousePhoto: saveCustRegOffModel.uploadHousePhoto.toString(),
        docUploadsImg1: saveCustRegOffModel.documentUploadsPhoto1.toString(),
        docUploadsImg2: saveCustRegOffModel.documentUploadsPhoto2.toString(),
        docUploadsImg3: saveCustRegOffModel.documentUploadsPhoto3.toString(),
        customerConsent: saveCustRegOffModel.customerConsentPhoto,
        ownerConsent: saveCustRegOffModel.ownerConsent.toString(),
        acceptConversionPolicy:
        saveCustRegOffModel.acceptConversionPolicy.toString(),
        acceptExtraFittingCost:
        saveCustRegOffModel.acceptExtraFittingCost.toString(),
        micr: saveCustRegOffModel.micr.toString(),
        buildingNumber: saveCustRegOffModel.buildingNumber.toString(),
      );
      var response = await apiIntegration.saveCustRegApi(saveCustRegReqModel);
      try {
        if (response != null) {
          setState(() {
            isLoading = false;
          });
          customerRegistrationList.removeAt(index);
          customerRegistrationBox.deleteAt(index);
          CustomToast.showToast(response.message[0].message);
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
          child: ListView(
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
                  _buildBox(
                    color: _bothTypeData ? Colors.green : Colors.red,
                    textTitle: isLoading ? "Loading" : "Submit",
                    onTap: () async {
                      fetchCustomerDataList();
                      //  fetchCustomerDataGrpList();
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
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.sync,
                                                      color: Colors
                                                          .blue.shade900,
                                                    ),
                                                    onPressed: () =>
                                                        fetchCustomerDataSingle(
                                                            index:
                                                            position),
                                                  ),
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
                  ),
                  isLoading ? Center(child: LoadingWidget()) : Container()
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
