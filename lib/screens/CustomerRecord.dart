import 'package:flutter/material.dart';
import 'package:hpcl_app/models/save_customer_registration_model.dart';
import 'package:hpcl_app/models/save_customer_registration_offline_model.dart';
import 'package:hpcl_app/utils/common_widgets/custom_app_bar.dart';
import '../ExportFile/export_file.dart';
import '../HiveDataStore/customer_reg_data_store.dart';

class CustomerRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {return CustomerRecordState();
  }
}


class CustomerRecordState extends BaseState<CustomerRecord> {

  bool _checkInBtnStatus = false;
  bool _checkOutBtnStatus = false;
  bool _checkOutBtnboth = false;
  bool canProceed = true;
  bool isOffline = false;
  var checkLoading = true;
  bool dialogIsVisible = false;
  final Connectivity _connectivity = Connectivity();
  var syncColors = Colors.red;


  GlobalKey<FormState> _keyLoader = GlobalKey<FormState>();



  List<SaveCustomerRegistrationOfflineModel> customerRegistrationList;
  ApiIntegration apiIntegration;
  SaveCustRegReqModel saveCustRegReqModel;

  final SaveCusRegHiveDataStore dataStore = SaveCusRegHiveDataStore();
  ValueNotifier<bool> isUpdate = ValueNotifier<bool>(false);

  @override
  void initState() {
    apiIntegration = ApiIntegration();
    initConnectivity();
    customerRegistrationList = SaveCusRegHiveDataStore.box.values.toList();
    super.initState();
  }

  Future fetchCustomerData() async {
    if(_checkOutBtnboth){
      int count = 0;
      for(int i = 0; i < customerRegistrationList.length; i++){
        SaveCustomerRegistrationOfflineModel saveCustRegOffModel = customerRegistrationList[i];
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
          locality: saveCustRegOffModel.locality,
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
          remarks:saveCustRegOffModel.remarks ,
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
          customerConsent: saveCustRegOffModel.customerConsent,
          depositeType: saveCustRegOffModel.depositeType,
          initialDepositeDate: saveCustRegOffModel.initialDepositeDate,
          initialDepositeStatus: saveCustRegOffModel.initialDepositeStatus,
          modeOfDeposite: saveCustRegOffModel.modeOfDeposite,
          nameOfBank: saveCustRegOffModel.nameOfBank,
          ownerConsent: saveCustRegOffModel.ownerConsent,
          payementBankName: saveCustRegOffModel.payementBankName,
          backSide1: saveCustRegOffModel.backSide1,
          backSide2: saveCustRegOffModel.backSide2,
          backSide3: saveCustRegOffModel.backSide3,
          canceledCheque: saveCustRegOffModel.canceledCheque,
          chequePhoto: saveCustRegOffModel.chequePhoto,
          uploadCustomerPhoto: saveCustRegOffModel.uploadCustomerPhoto,
          uploadHousePhoto: saveCustRegOffModel.uploadHousePhoto,
          documentUploads1: saveCustRegOffModel.documentUploads1,
          documentUploads2: saveCustRegOffModel.documentUploads2,
          documentUploads3: saveCustRegOffModel.documentUploads3,
        );
        print("saveCustRegReqModel--->"+saveCustRegReqModel.toJson().toString());
        var response = await apiIntegration.saveCustRegApi(saveCustRegReqModel);
        print(response.toString());
        try {
          if(response != null){
            setState(() {
              print("response---->"+response.message[0].message);
              checkLoading=true;
              count++;
            });
          } else {
            print("response---->"+response.message[0].message);
            EasyLoading.showError('Failed to save');
          }
        } catch(e){
          print("EasyLoading---?"+e.toString());
          EasyLoading.showError(e.toString());
        }
      }
      for(int i = count-1; i >= 0; i--) {
        await dataStore.deleteUser(index: i);
      }
      if(count == customerRegistrationList.length) {
        EasyLoading.showSuccess('Great Success! \n Record Save');
        await SaveCusRegHiveDataStore.box.clear();
      }
      customerRegistrationList.removeRange(0, count);
      await Future.delayed(Duration(seconds: 2));
   //   Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      EasyLoading.dismiss();

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
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => RegistrationForm()));
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
                      color: _checkInBtnStatus ? Colors.green : Colors.red,
                      textTitle: "MOBILE DATA"
                  ),
                  _buildBox(
                      color: _checkOutBtnStatus ? Colors.green : Colors.red,
                      textTitle: "WI-FI"
                  ),
                  _buildBox(
                    color: _checkOutBtnboth ? Colors.green : Colors.red,
                    textTitle: checkLoading == false ? CircularProgressIndicator() : "Submit",
                    onTap: () async {
                      fetchCustomerData();
                    },
                  ),
                ],
              ),
              SizedBox(height: 15,),
              SingleChildScrollView(
                child: ValueListenableBuilder(
                    valueListenable: SaveCusRegHiveDataStore.box.listenable(),
                    builder: (context, Box box, widget) {
                      return box.length > 0 ?
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: customerRegistrationList.length,
                          itemBuilder: (context, position) {
                            SaveCustomerRegistrationOfflineModel getStudent = customerRegistrationList[position];
                            return Visibility(
                              visible: true,
                              child: Card(
                                elevation: 5,
                                shadowColor: Colors.lightBlueAccent,
                                color: Colors.white,
                                shape: Border(left: BorderSide(color: Colors.blue.withOpacity(.7),width: 3)),
                                child: Padding(padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(0.0),
                                                //  child: Text("RECORDS : ${position + 1}",style: appbarHeadingStyle,),
                                                  child: Text("Records : ${position + 1}",style: appbarHeadingStyle,),
                                                ),
                                                Spacer(),
                                                checkLoading == false
                                                    ? Icon(Icons.sync, color: syncColors,)
                                                    : IconButton(icon: Icon(Icons.sync,color: syncColors, ),
                                                  onPressed: (){},
                                                ),
                                                InkWell(
                                                    onTap: ()async{
                                                      await showDialog(
                                                        context: context,
                                                        builder: (context) => AlertDialog(
                                                            title: Text("HPCL DMA"),
                                                            content: Text('Are you sure you want to delete ${getStudent.mobileNumber}?'),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              style: ButtonStyle(
                                                                backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
                                                                elevation: MaterialStateProperty.all(3),
                                                                shadowColor: MaterialStateProperty.all(Colors.blue.shade900), //Defines shadowColor
                                                              ),
                                                              onPressed: () {dataStore.deleteUser(index: position);},
                                                              child: const Text('Yes', style: TextStyle(color: Colors.white),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
                                                                elevation: MaterialStateProperty.all(3),
                                                                shadowColor: MaterialStateProperty.all(Colors.blue.shade900), //Defines shadowColor
                                                              ),
                                                              onPressed: () {Navigator.of(context, rootNavigator: true).pop(); },
                                                              child: const Text('No',
                                                                style: TextStyle(color: Colors.white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    child: Icon(Icons.delete,size:30,color: Colors.blue.shade900,)),
                                                IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.blue.shade900,))
                                              ],
                                            ),
                                            Divider(),
                                            SizedBox(height: 10,),
                                            Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text( "Mobile No",style: appbarHeadingStyle,),
                                                  Spacer(),
                                                  Text("${getStudent.mobileNumber}",style: appbarHeadingStyle,),
                                                ]),
                                            SizedBox(height: 10,),
                                            Divider(),
                                            Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:MainAxisAlignment.end,
                                                children: [
                                                  Text("STATUS",style: appbarHeadingStyle,),
                                                  Spacer(),
                                                  getStudent.complete == null
                                                      ? Padding( padding: const EdgeInsets.all(8.0),
                                                    child: Icon(Icons.close,color: Colors.red),)
                                                      :   Padding(padding: const EdgeInsets.all(8.0),
                                                    child: Icon(Icons.check_circle_sharp,color: Colors.green,),
                                                  ),
                                                  Divider(),
                                                ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                          :const Center(child: Text("No Data Found"));
                    }
                ),
              ),
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
          checkLoading=true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _checkInBtnStatus = true;
          _checkOutBtnboth = true;
          checkLoading=true;
        });
        break;
      case ConnectivityResult.wifi:
        if (!mounted) return;
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
          _checkOutBtnStatus = true;
          _checkOutBtnboth = true;
          checkLoading=true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _checkInBtnStatus = true;
          _checkOutBtnboth = true;
          checkLoading=true;
        });
        break;
      case ConnectivityResult.none:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          _checkInBtnStatus = false;
          _checkOutBtnStatus = false;
          _checkOutBtnboth = false;
          checkLoading=true;
          EasyLoading.dismiss();
          EasyLoading.showError("ERROR!!!!!\n INTERNET DISCONNECTED");
          checkLoading = true;
        });
        break;
      default: if (!mounted) return;
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
                title: Text(message,textAlign: TextAlign.center,style: TextStyle(fontSize: 14.0),),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.portable_wifi_off,color: Colors.redAccent,size: 36.0,),
                    canProceed
                        ? Text("Check your internet connection before proceeding.",textAlign: TextAlign.center,style: TextStyle(fontSize: 12.0),)
                        : Text("Please! proceed by connecting to a internet connection",textAlign: TextAlign.center,style: TextStyle(fontSize: 12.0, color: Colors.red),),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                    ),
                    onPressed: () {
                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    },
                    child: Text("CLOSE THE APP", style: TextStyle(color: Colors.white),),
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
                    child: Text("PROCEED",style: TextStyle(color: Colors.white),),
                  ),
                ],
              );
            });
      }
    }));
  }

  Widget _buildBox({Color color, String textTitle, Function onTap}){
    return InkWell(
      onTap:onTap ,
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
                  fontWeight: FontWeight.bold
              )
          ),
        ),
      ),
    );
  }

}


