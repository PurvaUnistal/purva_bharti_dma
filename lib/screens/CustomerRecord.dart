import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ExportFile/export_file.dart';



BuildContext mContext;
class CustomerRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomerRecordState();
  }
}
enum DataFilter {ALL,COMPLETED, PROGRESS }
class CustomerRecordState extends BaseState<CustomerRecord> {
  Box<DataModel> dataBox;
  DataFilter filter = DataFilter.ALL;
  ProgressDialog pr;
  List locallist;
  List locallist2;
  bool _checkInBtnStatus = false;
  bool _checkOutBtnStatus = false;
  bool _checkOutBtnboth = false;
  BuildContext ctx;
  bool canProceed = true;
  bool isOffline = false;
  bool dialogIsVisible = false;
  final Connectivity _connectivity = Connectivity();
  var syncColors = Colors.red;
  String cchk;
  String cp;
  var dbHelper;
  var p8;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  Future<List<IDStatus>> employees;
  List<IDStatus> _tasks = List<IDStatus>.empty(growable: true);
  final box = GetStorage(); // list of maps gets stored here
  LinkedHashMap<String, Object> localmap = new LinkedHashMap();
  LinkedHashMap<String, Object> localmap2 = new LinkedHashMap();
  LinkedHashMap<String, Object> test = new LinkedHashMap();
  List storageList = [];
  var checkLoading = true;
  var uploadText="UPLOAD";
  Map<dynamic, dynamic> raw;

  var checkback=true;

  var checkComplte=true;

  String responseString;


  @override
  void initState() {
    super.initState();
    callInit();
    dbHelper = DBHelperStatus();
    refreshList();
    initConnectivity();
    dataBox = Hive.box<DataModel>(dataBoxName);
    //   _getAllCustomers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context) {
    mContext = context;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              callInit();
              Navigator.push(context,MaterialPageRoute(builder: (context) => RegistrationForm()));
              //  Navigator.of(context).pop(false);
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 24, color: Colors.white),
                Text('Customer Records')
              ],
            ),
          ),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Card(
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.white,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //0xFF0077bd
                  InkWell(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                        height: 60,
                        width: 100,
                        color: Colors.white70,
                        child: Card(
                          elevation: 10,
                          color: _checkInBtnStatus ? Colors.green : Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("MOBILE DATA",textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () => {
                        //  showAlertDialog(context),
                        // autoPress();
                      }),
                  InkWell(
                    child: Container(
                      height: 60,
                      width: 100,
                      //color: Color(0xFFc9c9c9),
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: Card(
                        elevation: 10,
                        color: _checkOutBtnStatus ? Colors.green : Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("WI-FI",textAlign: TextAlign.center,
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                  checkLoading == false
                      ? Expanded(
                    child: Container(height: 60,width: 100,
                      //color: Color(0xFFc9c9c9),
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: Card(
                        elevation: 10,
                        color: _checkOutBtnboth? Colors.green: Colors.red,
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("UPLOAD", textAlign: TextAlign.center,
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  )
                      : Expanded(
                    child: InkWell(
                      child: Container(height: 60,width: 100,
                        margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Card(
                          elevation: 10,
                          color: _checkOutBtnboth ? Colors.green: Colors.red,
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("$uploadText",textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      onTap: () async {
                        dataBox = Hive.box<DataModel>(dataBoxName);
                        Map<dynamic, dynamic> raw = dataBox.toMap();
                        dynamic desiredKey;
                        raw.forEach((key, value) {
                          if (value.idkey == '1')
                            desiredKey = key;
                            dataBox.delete(desiredKey);
                        });
                        if (_checkOutBtnboth.toString().contains("true")) {
                          print("_checkInBtnStatus$_checkInBtnStatus");
                          Map<dynamic, dynamic> raw = dataBox.toMap();
                          locallist = raw.values.toList();
                          setState(() {
                            checkLoading = false;
                          });
                          int count = 0;
                          int i = 0;
                          var size = locallist.length;
                          for (i = 0; i <= size - 1; i++) {
                            count++;
                            DataModel cardModel = locallist[i];
                            if (cardModel.complete == true) {
                              uploadText="UPLOAD";
                              EasyLoading.dismiss();
                              setState(() {
                                locallist;
                              });
                              break ;
                            }
                            var datecheck = cardModel.IDcheckDate;
                            LoaderDialog.showLoadingDialog(context, _keyLoader);
                            var dateandtime;
                            if (datecheck.isEmpty) {
                              dateandtime = cardModel.DateandTime;
                            } else {
                              dateandtime = datecheck.toString();
                            }
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            var token = prefs.getString(GlobalConstants.token);
                            var schema = prefs.getString(GlobalConstants.schema);
                            var dma_user_id = prefs.getString(GlobalConstants.id);
                            var dma_user_name = prefs.getString(GlobalConstants.name);
                            String path1 = cardModel.KycImageForSide.replaceAll("File: 'File: ", "");
                            String path2 = path1.replaceAll("File:", "");
                            String M1 = path2.replaceAll("'", "");
                            String pathback1 = cardModel.KycImageBackSide.replaceAll("File: 'File: ", "");
                            String path12 = pathback1.replaceAll("File:", "");
                            String M2 = path12.replaceAll("'", "");
                            String imgConsentPhoto = cardModel.imgConsentPhoto.replaceAll("File: 'File: ", "");
                            String cancelCheckPhotoFile = cardModel.cancelCheckPhoto.replaceAll("File: 'File: ", "");
                            if (cardModel.imgCheckPhoto != null) {
                              cchk = cardModel.imgCheckPhoto.replaceAll("File: 'File: ", "");
                              cp = cchk.replaceAll("File: ", "");
                              p8 = cp.replaceAll("File: ", "");
                            }

                            String imgdoc3 = cardModel.imgdoc3.replaceAll("File: 'File: ", "");
                            String pdoc3 = imgdoc3.replaceAll("'", "");
                            String pathimgdoc3 = pdoc3.replaceAll("File: ", "");
                            String cancelCheckPhoto = cancelCheckPhotoFile.replaceAll("File: ", "");
                            String IMGElectricbillF = cardModel.IMGElectricbillF.replaceAll("File: 'File: ", "");
                            String ImgOwnerBack = cardModel.ImgOwnerElectricbillE.replaceAll("File: 'File: ", "");
                            var p2 = IMGElectricbillF.replaceAll("File: ", "");
                            var p3 = ImgOwnerBack.replaceAll("File: ", "");
                            var p4 = pathimgdoc3.replaceAll("File: ", "");
                            String imgdocback = cardModel.imgdocback3.replaceAll("File: 'File: ", "");
                            String imgdocback3 = imgdocback.replaceAll("File: ", "");
                            var NOCBACK = imgdocback3.replaceAll("File: ", "");
                            var p6 = imgConsentPhoto.replaceAll("File: ", "");
                            var p7 = cancelCheckPhoto.replaceAll("File: ", "");
                            var property_category_id = cardModel.crPropertyCategory;
                            var property_class_id = cardModel.crPropertyClass;
                            Map<String, String> requestBody = <String, String>{
                              "dma_user_name": dma_user_name,
                              "dma_user_id": dma_user_id,
                              "schema": schema,
                              "interested": cardModel.crteresterd,
                              "area_id": cardModel.crarea_id,
                              "mobile_number": cardModel.crmobile,
                              "first_name": cardModel.crfirstname,
                              "middle_name": cardModel.crmiddlename,
                              "last_name": cardModel.crLastName,
                              "guardian_name": cardModel.crGuardian,
                              "email_id": cardModel.crEmail,
                              "property_category_id": property_category_id,
                              "property_class_id": property_class_id,
                              "district": cardModel.crDistrict,
                              "house_number": cardModel.crHouseNumber,
                              "locality": cardModel.crLocality,
                              "town": cardModel.crTown,
                              "pin_code": cardModel.crPincode,
                              "society_allowed_mdpe": cardModel.crMDPE,
                              "resident_status":cardModel.crResidentStatus,
                              "no_of_kitchen": cardModel.crNOOFKitcen,
                              "no_of_bathroom": cardModel.crNoBathroom,
                              "existing_cooking_fuel":cardModel.crExitingCookingFuel,
                              "no_of_family_members": cardModel.crFamilyMember,
                              // "longitude": cardModel.crLat == null ? '0.00': cardModel.crLat,
                              // "latitude": cardModel.crLog == null ? '0.00': cardModel.crLog,
                              "longitude": cardModel.crLat != null?  cardModel.crLat :'0.00',
                              "latitude": cardModel.crLog != null ? cardModel.crLog :'0.00',
                              "remarks": cardModel.crRemarks,
                              //    "guardian_type": cardModel.crFather,
                              "guardian_type": cardModel.crFather,
                              "kyc_document_1": cardModel.KYCDocument1,
                              "kyc_document_1_number": cardModel.KYCDocument1NumberText,
                              "kyc_document_2": cardModel.KycBill,
                              "kyc_document_2_number": cardModel.KYCID,
                              "kyc_document_3": cardModel.KYCNOCFSide ?? "",
                              "kyc_document_3_number": cardModel.KYCNOCEndSide ?? "",
                              "name_of_bank": cardModel.cusBankName == null ? "" :cardModel.cusBankName,
                              "bank_account_number":cardModel.cusAccountNumber ?? "",
                              "bank_ifsc_code": cardModel.cusIFSCCode ?? "",
                              "bank_address": cardModel.cusBankAdrress ?? "",
                              "initial_deposite_status":cardModel.IDDeposteStatus ?? "",
                              "reason_for_hold":  cardModel.HoldReasons ?? "",
                              "mode_of_deposite": cardModel.IDMODEofDeposite,
                              "deposite_type": cardModel.IDScheemType ?? "",
                              "cheque_number": cardModel.IDCheckNumber,
                              "initial_amount":cardModel.IDDepositeAmount== null ? "" : cardModel.IDDepositeAmount,
                              "initial_deposite_date": dateandtime,
                              "payement_bank_name":cardModel.IDcheckBankName == null ? " " : cardModel.IDcheckBankName,
                              "accept_conversion_policy":cardModel.conversionPolicy== null ? "" :cardModel.conversionPolicy,
                              "accept_extra_fitting_cost":cardModel.extraFillingCost == null ? " ": cardModel.extraFillingCost,
                              "cheque_bank_account":cardModel.IDcheckBankAccountNumber == null ? " " :cardModel.IDcheckBankAccountNumber,
                              "micr": cardModel.MICR == null ? '': cardModel.MICR,
                            };
                            Map<String, String> headers = {"authorization": token, 'content-type': 'multipart/form-data;boundary=',};
                            // debugPrint("requestBody$requestBody");
                            try {
                              var request = http.MultipartRequest('POST',Uri.parse(GlobalConstants.BaseUrl + GlobalConstants.saveCustomerRegistrationOffline));
                              request.headers.addAll(headers);
                              request.fields.addAll(requestBody);
                              print("requestBody-->$requestBody");
                              if (M1 != null) {
                                print("document_uploads_1-->$M1");
                                var document_uploads_1 =  await http.MultipartFile.fromPath("document_uploads_1", M1.trimLeft());
                                request.files.add(document_uploads_1);
                              }
                              if (M2 != null) {
                                print("backside1-->$M2");
                                var backside1 = await http.MultipartFile.fromPath("backside1", M2.trimLeft());
                                request.files.add(backside1);
                              }
                              if (p2 != 'null') {
                                print("document_uploads_2-->$p2");
                                var document_uploads_2 = await http.MultipartFile.fromPath("document_uploads_2", p2.replaceAll("'", ""));
                                request.files.add(document_uploads_2);
                              }
                              if (p3 != 'null') {
                                print("backside2-->$p3");
                                var document_uploads_2 =  await http.MultipartFile.fromPath("backside2",p3.replaceAll("'", ""));
                                request.files.add(document_uploads_2);
                              }
                              if (p4 != 'null') {
                                print("document_uploads_3-->$p4");
                                var backside2 = await http.MultipartFile.fromPath("document_uploads_3", p4.replaceAll("'", ""));
                                request.files.add(backside2);
                              }
                              if (NOCBACK != 'null') {
                                print("backside3-->$NOCBACK");
                                var backside3 =  await http.MultipartFile.fromPath("backside3",NOCBACK.replaceAll("'", ""));
                                request.files.add(backside3);
                              }
                              if (p6 != 'null') {
                                print("customer_consent-->$p6");
                                var customer_consent =await http.MultipartFile.fromPath("customer_consent",p6.replaceAll("'", ""));
                                request.files.add(customer_consent);
                              }
                              if (p7 != 'null') {
                                print("canceled_cheque-->$p7");
                                var canceled_cheque = await http.MultipartFile.fromPath("canceled_cheque", p7.replaceAll("'", ""));
                                request.files.add(canceled_cheque);
                              }
                              if (p8 != 'null') {
                                print("cheque_photo-->$p8");
                                var ccheque =await http.MultipartFile.fromPath("cheque_photo", p8.replaceAll("'", ""));
                                request.files.add(ccheque);
                              }
                              var response = await request.send().timeout(const Duration(seconds: 60));
                              var responseData = await response.stream.toBytes();
                              responseString = String.fromCharCodes(responseData);
                              final Map<String, dynamic> data = json.decode(String.fromCharCodes(responseData).toString());
                              var code = data['success'];
                              if (code.toString().contains("200")) {
                                var mobiles=cardModel.crmobile;
                                final Map<String, dynamic> MMM = json.decode(String.fromCharCodes(responseData).toString());
                                var userid =MMM['message'][0]['data']['id'];
                                SharedPreferences pref = await SharedPreferences.getInstance();
                                var schema=pref.getString(GlobalConstants.schema);
                                var base=GlobalConstants.BaseUrl+"api/set-dma-response?schema=$schema&id=$userid";
                                var response = await http.get(Uri.parse(base)).timeout(const Duration(seconds:30));
                                print('UPLOAD Set DMA--->$response');
                                try {
                                  if (response.statusCode == 200) {
                                    setState(() {
                                      DataModel mData = DataModel(complete: true, crmobile:mobiles, idkey:"1");
                                      dataBox.putAt(i,mData);
                                      syncColors = Colors.green;
                                      checkLoading=true;
                                      Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                                      EasyLoading.dismiss();
                                    });
                                    EasyLoading.showSuccess('Great Success! \n Record Save');
                                  } else {
                                    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                                    return 'failed';
                                  }
                                } catch (e) {
                                  Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                                  return 'failed';
                                } } else {
                                syncColors = Colors.red;
                                EasyLoading.dismiss();
                                var code = data['errors'];
                                EasyLoading.showError('ERROR!!!!!\n $code');
                                setState(() {
                                  EasyLoading.dismiss();
                                  checkLoading=true;
                                  Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                                });
                              }
                            }
                            catch (Exception) {
                              print(Exception.toString());
                              EasyLoading.showError('NETWORK ERROR');
                              Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                            }
                          }
                        }
                        else {
                          EasyLoading.dismiss();
                          setState(() {
                            checkLoading = true;
                          });
                          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                          EasyLoading.showError("ERROR!!!!!\n INTERNET DISCONNECTED");
                        }

                      },
                    ),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: WatchBoxBuilder(
                box: dataBox,
                builder: (context, box) {
                  raw = box.toMap();
                  locallist = raw.values.toList();
                  if (filter == DataFilter.ALL) {
                  } else if (filter == DataFilter.COMPLETED) {
                  } else {
                  }
                  return dataBox.length == 0 ? Center(child: Text("NO RECORDS FOUNDS")) : ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: locallist.length,
                    itemBuilder: (context, index) {
                      DataModel cardModel = locallist[index];
                      if(cardModel.complete==true) {
                        uploadText="UPLOAD";
                        var id=cardModel.idkey;
                        dataBox.delete(id);
                      } else {
                        uploadText="UPLOAD";
                      }
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
                                            child: Text("RECORDS :${index + 1}",style: appbarHeadingStyle,),
                                          ),
                                          Spacer(),
                                          checkLoading == false
                                              ? Icon(Icons.sync, color: syncColors,)
                                              : IconButton(icon: Icon(Icons.sync,color: syncColors, ),
                                            onPressed: () async {
                                              if(cardModel.idkey=='1') {
                                                checkLoading=true;
                                                EasyLoading.showToast("Record  already Submitted");
                                              } else{
                                                setState(() {
                                                  checkback = false;
                                                  checkLoading = false;
                                                });
                                                if (_checkOutBtnboth.toString().contains("true")) {
                                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                                  var token = prefs.getString(GlobalConstants.token);
                                                  var schema = prefs.getString(GlobalConstants.schema);
                                                  var dma_user_id = prefs.getString(GlobalConstants.id);
                                                  var dma_user_name = prefs.getString(GlobalConstants.name);
                                                  LoaderDialog.showLoadingDialog(context, _keyLoader);
                                                  var datecheck = cardModel.IDcheckDate;
                                                  var DateandTime = cardModel.DateandTime;
                                                  var dateandtime;
                                                  if (datecheck.isEmpty) {
                                                    dateandtime = cardModel.DateandTime;
                                                  } else {
                                                    dateandtime = datecheck.toString();
                                                  }
                                                  String path1 = cardModel.KycImageForSide.replaceAll("File: 'File: ","");
                                                  String path2 = path1.replaceAll("File:","");
                                                  String M1 = path2.replaceAll("'", "");
                                                  String pathback1 = cardModel.KycImageBackSide.replaceAll("File: 'File: ","");
                                                  String path12 = pathback1.replaceAll("File:","");
                                                  String M2 = path12.replaceAll("'", "");
                                                  String imgConsentPhoto = cardModel.imgConsentPhoto.replaceAll("File: 'File: ","");
                                                  String cancelCheckPhotoFile = cardModel.cancelCheckPhoto.replaceAll("File: 'File: ","");
                                                  if (cardModel.imgCheckPhoto != null) {
                                                    cchk = cardModel.imgCheckPhoto.replaceAll("File: 'File: ","");
                                                    cp = cchk.replaceAll("File: ", "");
                                                    p8 = cp.replaceAll("File: ", "");}
                                                  String imgdoc3 = cardModel.imgdoc3.replaceAll("File: 'File: ","");
                                                  String pdoc3 = imgdoc3.replaceAll( "'","");
                                                  String pathimgdoc3 = pdoc3.replaceAll( "File: ","");
                                                  String cancelCheckPhoto = cancelCheckPhotoFile.replaceAll( "File: ","");
                                                  String IMGElectricbillF = cardModel.IMGElectricbillF.replaceAll("File: 'File: ","");
                                                  String ImgOwnerBack = cardModel.ImgOwnerElectricbillE.replaceAll("File: 'File: ","");
                                                  var p2 = IMGElectricbillF.replaceAll("File: ","");
                                                  var p3 = ImgOwnerBack.replaceAll("File: ","");
                                                  var p4 = pathimgdoc3.replaceAll("File: ","");
                                                  String imgdocback = cardModel.imgdocback3.replaceAll("File: 'File: ","");
                                                  String imgdocback3 = imgdocback.replaceAll("File: ","");
                                                  var NOCBACK = imgdocback3.replaceAll("File: ", "");
                                                  var p6 = imgConsentPhoto.replaceAll( "File: ",  "");
                                                  var p7 = cancelCheckPhoto.replaceAll("File: ","");
                                                  var property_category_id = cardModel.crPropertyCategory;
                                                  print("property_category_id$property_category_id");
                                                  print("cardModel.IDcheckBankName--> ,${cardModel.IDcheckBankName}");
                                                  var property_class_id =cardModel.crPropertyClass;
                                                  Map<String, String>requestBody = <String,String>{
                                                    "dma_user_name":dma_user_name,
                                                    "dma_user_id": dma_user_id,
                                                    "schema": schema,
                                                    "interested":cardModel.crteresterd,
                                                    "area_id":cardModel.crarea_id,
                                                    "mobile_number":cardModel.crmobile,
                                                    "first_name": cardModel.crfirstname,
                                                    "middle_name": cardModel.crmiddlename,
                                                    "last_name":cardModel.crLastName,
                                                    "guardian_name": cardModel.crGuardian,
                                                    "email_id":cardModel.crEmail,
                                                    "property_category_id":property_category_id,
                                                    "property_class_id":property_class_id,
                                                    "district":cardModel.crDistrict,
                                                    "house_number":cardModel.crHouseNumber,
                                                    "locality": cardModel.crLocality,
                                                    "town": cardModel.crTown,
                                                    "pin_code":cardModel.crPincode,
                                                    "society_allowed_mdpe":cardModel.crMDPE,
                                                    "resident_status":cardModel.crResidentStatus,
                                                    "no_of_kitchen":cardModel.crNOOFKitcen,
                                                    "no_of_bathroom":cardModel.crNoBathroom,
                                                    "existing_cooking_fuel":cardModel.crExitingCookingFuel,
                                                    "no_of_family_members":cardModel.crFamilyMember,
                                                    "longitude": cardModel.crLat != null?  cardModel.crLat :'0.00',
                                                    "latitude": cardModel.crLog != null ? cardModel.crLog :'0.00',
                                                    "remarks":cardModel.crRemarks,
                                                    //    "guardian_type": cardModel.crFather,
                                                    "guardian_type": cardModel.crFather,
                                                    "kyc_document_1": cardModel.KYCDocument1,
                                                    "kyc_document_1_number":cardModel.KYCDocument1NumberText,
                                                    "kyc_document_2":cardModel.KycBill,
                                                    "kyc_document_2_number" : cardModel.KYCID,
                                                    "kyc_document_3" : cardModel.KYCNOCFSide,
                                                    "kyc_document_3_number":cardModel.KYCNOCEndSide,
                                                    "name_of_bank":cardModel.cusBankName==null? '': cardModel.cusBankName,
                                                    "bank_account_number":cardModel.cusAccountNumber,
                                                    "bank_ifsc_code":cardModel.cusIFSCCode,
                                                    "bank_address":cardModel.cusBankAdrress,
                                                    "initial_deposite_status":cardModel.IDDeposteStatus,
                                                    "reason_for_hold":cardModel.HoldReasons == null? '': cardModel.HoldReasons,
                                                    "mode_of_deposite":cardModel.IDMODEofDeposite,
                                                    "deposite_type":cardModel.IDScheemType,
                                                    "cheque_number":cardModel.IDCheckNumber,
                                                    "initial_amount":cardModel.IDDepositeAmount,
                                                    "initial_deposite_date":dateandtime,
                                                    "payement_bank_name":cardModel.IDcheckBankName,
                                                    "accept_conversion_policy":cardModel.conversionPolicy,
                                                    "accept_extra_fitting_cost":cardModel.extraFillingCost,
                                                    "cheque_bank_account":cardModel.cusAccountNumber,
                                                    "micr": cardModel.MICR ==null? '': cardModel.MICR,
                                                  };
                                                  Map<String, String> headers = {"authorization":token,'content-type':'multipart/form-data;boundary=',};
                                                  debugPrint("requestBody----->$requestBody");
                                                  try {
                                                    var request = http.MultipartRequest('POST',Uri.parse(GlobalConstants.BaseUrl + GlobalConstants.saveCustomerRegistrationOffline));
                                                    request.headers.addAll(headers);
                                                    request.fields.addAll(requestBody);
                                                    if (M1 != null) {
                                                      print("document_uploads_1-->$M1");
                                                      var document_uploads_1 = await http.MultipartFile.fromPath("document_uploads_1",M1.trimLeft());
                                                      request.files.add(document_uploads_1);
                                                    }
                                                    if (M2 != null) {
                                                      print("backside1-->$M2");
                                                      var backside1 = await http.MultipartFile.fromPath("backside1",M2.trimLeft());
                                                      request.files.add(backside1);
                                                    }
                                                    if (p2 !='null') {
                                                      print("document_uploads_2-->$p2");
                                                      var document_uploads_2 = await http.MultipartFile.fromPath( "document_uploads_2", p2.replaceAll( "'",""));
                                                      request.files.add(document_uploads_2);
                                                    }
                                                    if (p3 !='null') {
                                                      print("backside2-->$p2");
                                                      var document_uploads_2 = await http.MultipartFile.fromPath("backside2",p3.replaceAll( "'",""));
                                                      request.files.add(document_uploads_2);
                                                    }
                                                    if (p4 != 'null') {
                                                      print("document_uploads_3-->$p4");
                                                      var backside2 = await http.MultipartFile.fromPath("document_uploads_3",p4.replaceAll("'",""));
                                                      request.files.add(backside2);
                                                    }
                                                    if (NOCBACK != 'null') {
                                                      print("backside3-->$NOCBACK");
                                                      var backside3 = await http.MultipartFile.fromPath("backside3",NOCBACK.replaceAll("'", ""));
                                                      request.files.add(backside3);
                                                    }
                                                    if (p6 !='null') {
                                                      print("customer_consent-->$p6");
                                                      var customer_consent = await http.MultipartFile.fromPath("customer_consent",p6.replaceAll("'",""));
                                                      request.files.add(customer_consent);
                                                    }
                                                    if (p7 != 'null') {
                                                      print("canceled_cheque-->$p7");
                                                      var canceled_cheque = await http.MultipartFile.fromPath("canceled_cheque",p7.replaceAll("'", ""));
                                                      request.files.add(canceled_cheque);
                                                    }
                                                    if (p8 !='null') {
                                                      print("cheque_photo-->$p8");
                                                      var ccheque = await http.MultipartFile.fromPath("cheque_photo", p8.replaceAll("'",""));
                                                      request.files.add(ccheque);
                                                    }
                                                    var response = await request.send().timeout(const Duration(seconds:60));
                                                    var responseData = await response.stream.toBytes();
                                                    var responseString = String.fromCharCodes(responseData);
                                                    final Map<String,dynamic> data = json.decode(String.fromCharCodes(responseData).toString());
                                                    var code = data['success'];
                                                    if (code.toString().contains("200")) {
                                                      if (code.toString().contains("200")) {
                                                        final Map<String, dynamic> MMM =json.decode(String.fromCharCodes(responseData).toString());
                                                        var userid =MMM['message'][0]['data']['id'];
                                                        SharedPreferences pref = await SharedPreferences.getInstance();
                                                        var schema=pref.getString(GlobalConstants.schema);
                                                        String base = GlobalConstants.BaseUrl+"api/set-dma-response?schema=$schema&id=$userid";
                                                        var url = Uri.parse(base);
                                                        var response = await http.get(url).timeout(const Duration(seconds:30));
                                                        print('Sync api/set-dma--->' + response.body);
                                                        try {
                                                          if (response.statusCode == 200) {
                                                            setState(() {
                                                              setState(() {
                                                                checkback=true;
                                                              });
                                                              syncColors = Colors.green;
                                                              checkLoading = true;
                                                              EasyLoading.dismiss();
                                                            });
                                                            dataBox.deleteAt(index);
                                                            Navigator.of(_keyLoader.currentContext).pop();
                                                            Navigator.of(context).push(new MaterialPageRoute<CustomerRecord>(
                                                              builder: (BuildContext context) {
                                                                return new CustomerRecord();
                                                              },
                                                            ));

                                                            EasyLoading.showSuccess('Great Success! \n Record Save');
                                                          } else {
                                                            Navigator.of(_keyLoader.currentContext).pop();
                                                            Navigator.of(context).push(new MaterialPageRoute<CustomerRecord>(
                                                              builder: (BuildContext context) {
                                                                return new CustomerRecord();
                                                              },
                                                            ));
                                                            return 'failed';
                                                          }
                                                        } catch (e) {
                                                          Navigator.of(_keyLoader.currentContext).pop();
                                                          Navigator.of(context).push(new MaterialPageRoute<CustomerRecord>(
                                                            builder: (BuildContext context) {
                                                              return new CustomerRecord();
                                                            },
                                                          ));
                                                          return 'failed';
                                                        }
                                                        // callHandShake(mobiles,i,userid);
                                                      }
                                                      else {
                                                        Navigator.of(_keyLoader.currentContext).pop();
                                                        Navigator.of(context).push(new MaterialPageRoute<CustomerRecord>(
                                                          builder: (BuildContext context) {
                                                            return new CustomerRecord();
                                                          },
                                                        ));
                                                      }
                                                    }
                                                    else {
                                                      setState(() {
                                                        checkback=true;
                                                      });
                                                      syncColors =  Colors.red;
                                                      checkLoading =true;
                                                      debugPrint( "MessageMessage: $responseString");
                                                      EasyLoading.dismiss();
                                                      var code = data['errors'];
                                                      EasyLoading.showError('ERROR!!!!!\n $code');
                                                      setState(() {
                                                        checkback=true;
                                                        checkLoading =true;
                                                        EasyLoading.dismiss();
                                                      });
                                                      Navigator.of(_keyLoader.currentContext).pop();
                                                      Navigator.of(context).push(new MaterialPageRoute<CustomerRecord>(
                                                        builder: (BuildContext context) {
                                                          return new CustomerRecord();
                                                        },
                                                      ));
                                                    }
                                                  }  catch (Exception) {
                                                    print(Exception.toString());
                                                    setState(() {
                                                      checkback=true;
                                                    });
                                                    Navigator.of(_keyLoader.currentContext).pop();
                                                    Navigator.of(context).push(new MaterialPageRoute<CustomerRecord>(
                                                      builder: (BuildContext context) {
                                                        return new CustomerRecord();
                                                      },
                                                    ));
                                                  }
                                                }
                                              }
                                            },
                                          ),
                                          checkLoading==false
                                              ? Icon(Icons.delete)
                                              : IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () async {
                                              {
                                                Widget okButton = TextButton(
                                                  child: Text("OK"),
                                                  onPressed: () {
                                                    Navigator.pop(context, false);
                                                    dataBox.deleteAt(index);
                                                  },
                                                );
                                                Widget noButton = TextButton(
                                                  child: Text("NO"),
                                                  onPressed: () {
                                                    Navigator.pop(context, false);
                                                  },
                                                );
                                                AlertDialog alert = AlertDialog(
                                                  title: Text("HPCL DMA"),
                                                  content: Text("Are you sure delete records ?"),
                                                  actions: [
                                                    noButton,
                                                    okButton,
                                                  ],
                                                );
                                                // show the dialog
                                                showDialog(context: context,builder: (BuildContextcontext) {
                                                  return alert;
                                                },
                                                );
                                              }
                                            },
                                          )
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
                                            Text("${cardModel.crmobile}",style: appbarHeadingStyle,),
                                          ]),
                                      SizedBox(height: 10,),
                                      Divider(),
                                      Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:MainAxisAlignment.end,
                                          children: [
                                            Text("STATUS",style: appbarHeadingStyle,),
                                            Spacer(),
                                            cardModel.complete == null
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
                    },
                  );
                },
              ),
            ),
          ],
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
          callInit();
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
          callInit();
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
          callInit();
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
          callInit();
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
          callInit();
          EasyLoading.dismiss();
          print("TASKID $_tasks");
          EasyLoading.showError("ERROR!!!!!\n INTERNET DISCONNECTED");
          checkLoading = true;
        });
        break;
      default: if (!mounted) return;
      setState(() => isOffline = true);
      break;
    }
  }

  void buildAlertDialog(String message) {
    SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
      if (isOffline && !dialogIsVisible) {
        dialogIsVisible = true;
        showDialog(
            barrierDismissible: false,
            context: ctx,
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
                        Navigator.pop(ctx);
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

  refreshList() {
    setState(() {
      employees = dbHelper.getEmployees();
    });
  }

  void callInit() {
    dataBox = Hive.box<DataModel>(dataBoxName);
    Map<dynamic, dynamic> raw = dataBox.toMap();
    dynamic desiredKey;
    raw.forEach((key, value) {
      if (value.idkey == '1') desiredKey = key;
      dataBox.delete(desiredKey);
    });
    EasyLoading.dismiss();
  }
}


