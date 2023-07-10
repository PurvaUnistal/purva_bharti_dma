import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../ExportFile/export_file.dart';

class MainRegisterPageUpdate extends StatefulWidget {
  final Customer customer;
  MainRegisterPageUpdate({this.customer});

  @override
  State<StatefulWidget> createState() {
    return MainRegisterPageUpdateState();
  }
}

class MainRegisterPageUpdateState extends BaseState<MainRegisterPageUpdate> {
  Customer editedCustomer;
  Position position;
  int gasDepositAmountController, depositTotalAmount = 0, _schemeMonth = 0;

  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool isWifiConnected = false;
  bool isInternetOn = true;

  List<String> _bankDropdownItems = ([]);
  String _bankValue;

  List data =[];

  List<String> _bankDropdownItems2 = ([]);
  String _bankValue2;
  List data2 = [];

  //Area
  List<DropdownMenuItem<OptionItem>> _dropdownItems;
  OptionItem _areaType;
  String _areaTypeId = '0';

  //Charge Area
  List<DropdownMenuItem<OptionItem>> chargeAreaItems;
  OptionItem chargeAreaType;
  String chargeAreaId = '0';

  //getAllDistrict
  List<DropdownMenuItem<OptionItem>> getAllDistrictItems;
  OptionItem getAllDistrictType;
  String getAllDistrictId = '0';

  List<DropdownMenuItem<OptionItem>> dropListModelInterested = ([]);
  OptionItem _isInterestedItem;
  String _isInterestedId = '';
  String schemeTypeLabel = '';

  Box<DataModel> dataBox;

  List localList;
  bool error = false;
  String dateAndTime = '';

  bool checkAuto = false;
  bool fDepositeSiteCheck = false;
  bool fDepositeDate = false;



  PhotoController meterPhotoController = new PhotoController();
  PhotoController meterPhotoController2 = new PhotoController();
  PhotoController meterPhotoController3 = new PhotoController();
  PhotoController meterPhotoController4 = new PhotoController();
  PhotoController meterPhotoController5 = new PhotoController();
  PhotoController meterPhotoController6 = new PhotoController();
  PhotoController meterPhotoController7 = new PhotoController();
  PhotoController meterPhotoController8 = new PhotoController();
  PhotoController meterPhotoController9 = new PhotoController();

  void removeSpace(TextEditingController controller){
    if(controller.text.trim() == ""){
      setState(()=> controller.text = "");
    }
    print("controller==>"+controller.text);
  }

  String schemeId = '0';
  List<ChargeAreaModel> listChargeArea;

  var checkDepositeDate;
  var checkONLine =true;
  String selectedDropDownValue = "";
  ServerApi serverApi;


  @override
  void initState() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    serverApi = ServerApi();
    firstNameController.addListener(()=> removeSpace(firstNameController));
    middleNameController.addListener(()=> removeSpace(middleNameController));
    lastNameController.addListener(()=> removeSpace(lastNameController));
    guardianNameController.addListener(()=> removeSpace(guardianNameController));
    reasonController.addListener(()=> removeSpace(reasonController));
    emailIdController.addListener(()=> removeSpace(emailIdController));
    localityController.addListener(()=> removeSpace(localityController));
    townController.addListener(()=> removeSpace(townController));
    landmarkController.addListener(()=> removeSpace(landmarkController));
    IFSCController.addListener(()=> removeSpace(IFSCController));
    bank_address.addListener(()=> removeSpace(bank_address));
    longitudeController.addListener(()=> removeSpace(longitudeController));
    latitudeController.addListener(()=> removeSpace(latitudeController));
    ownershipController.addListener(()=> removeSpace(ownershipController));
    nocProofNoController.addListener(()=> removeSpace(nocProofNoController));
    reasonNoController.addListener(()=> removeSpace(reasonNoController));
    mICRCodeController.addListener(()=> removeSpace(mICRCodeController));
    initDepDateController.addListener(()=> removeSpace(initDepDateController));
    uploadDoc1PhotoController = PhotoController();
    uploadDoc1BacksidePhotoController = PhotoController();
    uploadDoc2PhotoController = PhotoController();
    uploadDoc2BackSidePhotoController = PhotoController();
    uploadAdd3Photo = PhotoController();
    uploadDoc3BackSidePhoto = PhotoController();
    dataBox = Hive.box<DataModel>(dataBoxName);
    if (widget.customer == null) {
      editedCustomer = Customer();
    } else {
      editedCustomer = Customer.fromMap(widget.customer.toMap());
    }
    fetchLabels();
    fetchDistrict();
    fetchChargeAreaList();
    interestedDorpdownList();
    _getPropertyCategory();
    _getPropertyClass();
    _getSocietyAllow();
    _getResidentStatus();
    _getExistingCookingFuel();
    _getGuardianType();
    _getIdProofArray();
    _getAddressProofArray();
    _getKycProofArray();
    _getBank();
    _getBank2();
    _getBillingModeList();
    _getAcceptConversionPolicyList();
    _getAcceptExtraFittingCostList();
    _getMdeOfDeposite();
    _getInitialDepositeStatusList();
    _getAllDepositScheme();
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          centerTitle:true,
          title: GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => RegistrationForm()));
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios,size: 24, color:Colors.white),
                SizedBox(width: 10,),
                Text('Customer Input')
              ],
            ),
          ),
        ),
        body: _buildLayout()
    );
  }


  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }



  TextEditingController mobileNoController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController kitchenController = TextEditingController(text: '1');
  TextEditingController bathroomController = TextEditingController(text: "1");
  TextEditingController familyMemController = TextEditingController(text: "4");
  TextEditingController landmarkController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController idProofNoController = TextEditingController();
  TextEditingController ownershipController = TextEditingController();
  TextEditingController nocProofNoController = TextEditingController();
  TextEditingController reasonNoController = TextEditingController();
  TextEditingController depositAmountController = TextEditingController();
  TextEditingController chqNOController = TextEditingController();
  TextEditingController bankAccNoController = TextEditingController();
  TextEditingController mICRCodeController = TextEditingController();
  TextEditingController chqDateController = TextEditingController();
  TextEditingController initDepDateController = TextEditingController();
  TextEditingController customerAccountNum = TextEditingController();
  TextEditingController IFSCController = TextEditingController();
  TextEditingController bank_address = TextEditingController();

  PhotoController uploadDoc1PhotoController;
  PhotoController uploadDoc1BacksidePhotoController;
  PhotoController uploadDoc2PhotoController;
  PhotoController uploadDoc2BackSidePhotoController;
  PhotoController chqPhoto = PhotoController();
  PhotoController cancelCheckPhoto = PhotoController();
  PhotoController uploadAdd3Photo;
  PhotoController uploadDoc3BackSidePhoto;

  OptionItem _categoryType;
  OptionItem __depositStatusValue;
  OptionItem __modeDepositValue;
  DepositItem _depositCategoryType;



  List<DropdownMenuItem<OptionItem>> dropListDepositStatusList = ([]);
  List<DropdownMenuItem<OptionItem>> dropListModeOfDepositList = ([]);
  List<DropdownMenuItem<OptionItem>> dropListChoiceStatusList = ([]);
  List<DropdownMenuItem<OptionItem>> _propertyDropdownItems;
  List<DropdownMenuItem<DepositItem>> _propertyDropdownItemsDeposit;
  List<DropdownMenuItem<OptionItem>> _idProofDropdownItems = ([]);
  List<DropdownMenuItem<OptionItem>> _addressProofDropdownItems = ([]);
  List<DropdownMenuItem<OptionItem>> _kycProofDropdownItems = ([]);
  List<DropdownMenuItem<String>> _cookingFuelDropdownItems = ([]);
  List<DropdownMenuItem<OptionItem>> _propertyClassDropdownItems;
  List<DropdownMenuItem<String>> guardianTypeDropdownItems = ([]);

  String _depositStatusId = '';
  String _modeOfDeposit = '';
  String _propertyTypeId = '0';
  String pCategoryId = '0';

  bool isDepositCheq = true;


  OptionItem _idProofDropDownValue;
  String _idProofDropDownValueId = "";
  OptionItem _addressProofDropDownValue;
  String _addressProofDropDownValueId = "";

  OptionItem _kycProofDropDownValue;
  String _kycProofDropDownValueId = "";

  DropListModel dropListModelarea = DropListModel([
    OptionItem(id: "1", title: "A"),
    OptionItem(id: "2", title: "B"),
    OptionItem(id: "3", title: "C"),
    OptionItem(id: "4", title: "D"),
  ]);


  String cookInFuelValue;


  OptionItem _propertyClassType;
  String _propertyClassId = '0';


  OptionItem guardianType;
  String guardianTypeId = '0';

  String guardianTypeValue;

  DropListModel dropListModelpropertyCategory = DropListModel([
    OptionItem(id: "1", title: "Domestic"),
    OptionItem(id: "2", title: "Commercial"),
    OptionItem(id: "3", title: "Industrial"),
    OptionItem(id: "4", title: "SplDomestic"),
  ]);
  DropListModel dropListModelpropertyClass = DropListModel([
    OptionItem(id: "1", title: "General"),
    OptionItem(id: "2", title: "VIP"),
    OptionItem(id: "3", title: "Govt"),
  ]);
  DropListModel dropListModelresidentStatus = DropListModel([
    OptionItem(id: "1", title: "Owner"),
    OptionItem(id: "2", title: "Tenant"),
    OptionItem(id: "3", title: "Unoccupied"),
  ]);
  DropListModel dropListModelExistingCookingFuel = DropListModel([
    OptionItem(id: "1", title: "Gas Cylinder"),
    OptionItem(id: "2", title: "Electric"),
    OptionItem(id: "3", title: "Kerosene"),
    OptionItem(id: "4", title: "Coal"),
    OptionItem(id: "5", title: "Wood"),
  ]);
  DropListModel dropListModelKycDoc = DropListModel([
    OptionItem(id: "1", title: "Aadhaar"),
    OptionItem(id: "2", title: "Voter"),
    OptionItem(id: "3", title: "Ration"),
    OptionItem(id: "4", title: "PAN"),
    OptionItem(id: "5", title: "Passport"),
    OptionItem(id: "5", title: "Owner ID"),
  ]);
  List<DropdownMenuItem<String>> _mdpeDropdownItems = ([]);
  String _mdpeValue = '';

  List<DropdownMenuItem<String>> _residentDropdownItems = ([]);
  String _residentStatusValue = '';
  String dma_id = "";
  String schema = "";



//  castbyphone cbp;

  PhotoController consentPhoto = PhotoController();
  PhotoController chequePhoto = PhotoController();

  List<DropdownMenuItem<OptionItem>> _billingModeList = ([]);
  OptionItem __billingModeValue;
  String __billingModeValueId;

  List<DropdownMenuItem<OptionItem>> _acceptConversionPolicyList = ([]);
  OptionItem __acceptConversionPolicyValue;
  String __acceptConversionPolicyValueId;

  List<DropdownMenuItem<OptionItem>> _acceptExtraFittingCostList = ([]);
  OptionItem __acceptExtraFittingCostValue;
  String __acceptExtraFittingCostValueId;

  List<ImageSource> values = [];
  DateTime currentDate = DateTime.now();
  String userId = "";
  String depositSum = "";
  final formGlobalKey = GlobalKey<FormState>();


  _buildLayout(){
    return Form(
      key: formGlobalKey,
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          _interestedDropDown(),
          _conversionPolicyDropDown(),
          _fittingCostDropDown(),
          _isInterestedId == '1' ? _mdpeDropdown() : Container(),
          _isInterestedId == '0' ? _reasonInterestedWidget() : Container(),
          _chargeAreaDropDown(),
          _areaDropDown(),
          _mobileWidget(),
          _firstNameWidget(),
          _middleWidget(),
          _lastNameWidget(),
          _guardianTypeDropDown(),
          _guardianNameWidget(),
          _emailWidget(),
          _isInterestedId == '1' ? _propertyCategoryDropDown() : Container(),
          _isInterestedId == '1' ? _propertyClassDropDown() : Container(),
          _houseNumberWidget(),
          _localityWidget(),
          _townWidget(),
          _districtWidget(),
          _pinCodeWidget(),
          _isInterestedId == '1' ? _residentStatusDropdownWidget() : Container(),
          _isInterestedId == '1' ? _noKitchenWidget() : Container(),
          _isInterestedId == '1' ? _noBathroomWidget() : Container(),
          _isInterestedId == '1' ? _fuelDropdownWidget() : Container(),
          _isInterestedId == '1' ? _noFamilyWidget(): Container(),
          _locationWidget(),
          _isInterestedId == '1' ? _landmarkWidget() : Container(),
          _buildCardWidget(text:AppStrings.idProofHeading),
          _docTypeDropDown(),
          _idProofNoWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _frontImageWidget(),
              _backImageWidget()
            ],
          ),
          _buildCardWidget(text:AppStrings.ownershipProofHeading),
          getDropDown2(),
          _ownerProofNoWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _electricBillFrontImgWidget(),
              _electricBillBackImgWidget(),
            ],
          ),
          _buildCardWidget(text:AppStrings.nocLabel),
          getDropDown3(),
          _nocProofNoWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _nocFrontImageWidget(),
              _nocBackImageWidget(),
            ],
          ),
          _buildCardWidget(text:AppStrings.customerConsentLabel),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _consentImageWidget(),
              _cancelChqImageWidget(),
            ],
          ),
          _billModeDropDown(),
          _customerBankDropDown(),
          _customerBackNoWidget(),
          _customerIFSCCodeWidget(),
          _customerBankAddWidget(),
          _buildCardWidget(text:AppStrings.securityDepositLabel),
          _depositStatusDropDown(),
          _depositStatusId != "1" ? _reasonDepositStatusWidget() : Container(),
          _modeDepositDropDown(),
          getdepositTypeDropDown(),
          _depositAmountWidget(),
          Visibility(
            visible: true,
            child: Column(
              children: [
                Visibility(
                  visible: isDepositCheq,
                  child: Column(
                    children: [
                      _chqNoWidget(),
                      _depositDateWidget(),
                    ],
                  ),
                ),
                Visibility(
                  visible: isDepositCheq,
                  child: _bankNameDropDown(),
                ),
                Visibility(
                  visible: isDepositCheq,
                  child: Column(
                    children: [
                      _backNameWidget(),
                      _micrCodeWidget(),
                      _chequeImageWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
          TextButton(
            child: Text("Preview"),
            onPressed: () async {
              var textFieldValidationCheck = CustomerFormHelper.textFieldValidationCheck(
                titleLocation : latitudeController.text.trim().toString(),
                acceptConversionPolicyValueId : __acceptConversionPolicyValueId,
                acceptExtraFittingCostValueId : __acceptExtraFittingCostValueId,
                chargeAreaType: chargeAreaId,
                areaTypeId: _areaTypeId,
                mobileNoController: mobileNoController.text.toString(),
                firstNameController: firstNameController.text.toString(),
                lastNameController: lastNameController.text.toString(),
                guardianNameController: guardianNameController.text.toString(),
                propertyTypeId : _propertyTypeId,
                propertyClassId: _propertyClassId,
                houseNumberController: houseNumberController.text.toString(),
                localityController: localityController.text.toString(),
                district:getAllDistrictId,
                pinCodeController: pinCodeController.text.toString(),
                noOfKitchen: kitchenController.text.toString(),
                noOfBathroom: bathroomController.text.toString(),
                cookInFuelValue:cookInFuelValue,
                noOfFamilyMembers:familyMemController.text.toString() ,
                addressProofNo: _idProofDropDownValue.title,
                idProofNo: idProofNoController.text.toString(),
                idFrontImage: AppStrings.frontImage,
                idBackImage: AppStrings.backImage,
                consentImage: AppStrings.profileImage7,
                customerBankName: _bankValue,
                customerAccNo: customerAccountNum.text.trim().toString(),
                customerIfscCode: IFSCController.text.trim().toString(),
                customerBankAdd:"" ,
                modeOfDeposit:_modeOfDeposit,
                chequeNo:_modeOfDeposit == "1" ?chqNOController.text.trim().toString() : "",
                chequeDate: _modeOfDeposit == "1" ? initDepDateController.text.trim().toString() : "",
                bankName:_bankValue2,
                bankAccNo: bankAccNoController.text.trim().toString(),
                depositAmount:AppStrings.depositAmount,
                micrCode: _modeOfDeposit == "1" ? mICRCodeController.text.trim().toString() : "",
                chequePhoto: _modeOfDeposit == "1"? AppStrings.profileImage9 :null,
                mdpeValue: _mdpeValue,
                residentStatusValue: _residentStatusValue,
              );
              if(textFieldValidationCheck == true){
                showDialog(
                    context: context, builder :(context){
                  return  Container(
                    color:Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildRow(
                            leading: AppStrings.interestedLabel,
                            trailing: _isInterestedItem.title,
                          ),
                          _buildRow(
                            leading: AppStrings.reasonLabel,
                            trailing: reasonController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.chargeAreaLabel,
                            trailing:chargeAreaType.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.areaLabel,
                            trailing:_areaType.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.mobileNoLabel,
                            trailing:mobileNoController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.firstNameLabel,
                            trailing:firstNameController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.middleNameLabel,
                            trailing:middleNameController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.lastNameLabel,
                            trailing:lastNameController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.guardianTypeLabel,
                            trailing:guardianTypeValue ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.guardianNameLabel,
                            trailing:guardianNameController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.emailAddressLabel,
                            trailing:emailIdController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.propertyCategoryLabel,
                            trailing:_categoryType.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.propertyClassLabel,
                            trailing:_propertyClassType.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.houseNumberLabel,
                            trailing:houseNumberController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.localityLabel,
                            trailing:localityController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.townLabel,
                            trailing:townController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.pinCodeLabel,
                            trailing:pinCodeController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.districtLabel,
                            trailing:getAllDistrictType.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.mdpeAllowLabel,
                            trailing:_mdpeValue ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.residentStatusLabel,
                            trailing:_residentStatusValue ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.noOfKitchenLabel,
                            trailing:kitchenController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.noOfBathroomLabel,
                            trailing:bathroomController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.existingCookingFuelLabel,
                            trailing: cookInFuelValue ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.noOfFamilyMembersLabel,
                            trailing: familyMemController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.latitudeLabel,
                            trailing: latitudeController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.longitudeLabel,
                            trailing: longitudeController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.landmarkLabel,
                            trailing: landmarkController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.idProofHeading,
                            trailing: _idProofDropDownValue.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.idProofNo,
                            trailing:idProofNoController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.billingModeLabel,
                            trailing:__billingModeValue.title.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.customerAccountNoLabel,
                            trailing: customerAccountNum.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.customerIfscCodeLabel,
                            trailing: IFSCController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.conversionPolicyLabel,
                            trailing: __acceptConversionPolicyValue.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.fittingCostLabel,
                            trailing: __acceptExtraFittingCostValue.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.depositStatusLabel,
                            trailing: __depositStatusValue.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.modeOfDepositLabel,
                            trailing: __modeDepositValue.title ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.depositTypeLabel,
                            trailing: AppStrings.depositName.toString()?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.depositAmountControllerLabel,
                            trailing: depositAmountController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.chqNoLabel,
                            trailing: chqNOController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.depositDateLabel,
                            trailing: initDepDateController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.customerBankNameLabel,
                            trailing: _bankValue.toString() ?? "-",
                          ),
                          Visibility(
                            visible: checkONLine,
                            child: Column(
                              children: [
                                Divider(),
                                _buildRow(
                                  leading: AppStrings.accountNoLabel,
                                  trailing: bankAccNoController.text.toString() ?? "-",
                                ),
                                _buildRow(
                                  leading: AppStrings.bankNameLabel,
                                  trailing: _bankValue2.toString() ?? "-",
                                ),
                                _buildRow(
                                  leading: AppStrings.mICRCodeLabel,
                                  trailing:mICRCodeController.text.toString() ?? "-",
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    _imageNameWidget(imageName: AppStrings.idFrontImgSide),
                                    Padding(
                                        padding: const EdgeInsets .symmetric(horizontal: 20, vertical: 10),
                                        child: AppStrings.frontImage == null? AppStrings.frontImagePath.isEmpty
                                            ? _dottedBorder(
                                            onTap: () {
                                              _showPicker(context,meterPhotoController);
                                            }
                                        ) : _preNetworkImage(
                                          networkImage: AppStrings.frontImagePath,
                                          imageFile: AppStrings.frontImage,
                                        )
                                        : _preFileImage(
                                          fileImage: AppStrings.frontImage,
                                          imageFilePath: AppStrings.frontImage
                                        )
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _imageNameWidget(imageName: AppStrings.idBackImgSide),
                                    Padding(
                                        padding: const EdgeInsets .symmetric(horizontal: 20, vertical: 10),
                                        child: AppStrings.backImage == null? AppStrings.backImagePath.isEmpty
                                            ? _dottedBorder(
                                            onTap: () {
                                              _showPicker2(context,meterPhotoController2);
                                            }
                                        )
                                            : _preNetworkImage(
                                                networkImage: AppStrings.backImagePath,
                                                imageFile: AppStrings.backImage,
                                             )
                                            : _preFileImage(
                                                fileImage: AppStrings.backImage,
                                                imageFilePath: AppStrings.backImage
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    _imageNameWidget(imageName: AppStrings.electricBillFrontImg),
                                    Padding(
                                        padding: const EdgeInsets .symmetric(horizontal: 20, vertical: 10),
                                        child: AppStrings.profileImage3 == null? AppStrings.profileImagePath3 .isEmpty
                                            ? _dottedBorder(
                                                 onTap: () {
                                                   _showPicker3( context, meterPhotoController3);
                                                        }
                                               )
                                            : _preNetworkImage(
                                                 networkImage:AppStrings.profileImagePath3,
                                                 imageFile: AppStrings.profileImage3,
                                               )
                                            : _preFileImage(
                                                 fileImage: AppStrings.profileImage3,
                                                 imageFilePath: AppStrings.profileImage3
                                               )
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _imageNameWidget(imageName: AppStrings.electricBillBackImgLabel),
                                    Padding(
                                        padding: const EdgeInsets .symmetric(horizontal: 20, vertical: 10),
                                        child: AppStrings.electricBillBackImg == null ? AppStrings.electricBillBackImgPath.isEmpty
                                            ? _dottedBorder(
                                            onTap: () {
                                              _showPicker4(context,meterPhotoController4);
                                            }
                                        )
                                            : _preNetworkImage(
                                          networkImage: AppStrings.electricBillBackImgPath,
                                          imageFile: AppStrings.electricBillBackImg,
                                        )
                                            : _preFileImage(
                                            fileImage: AppStrings.electricBillBackImg,
                                            imageFilePath: AppStrings.electricBillBackImg
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    _imageNameWidget(imageName: AppStrings.doc3FrontImgSide),
                                    Padding(
                                        padding: const EdgeInsets .symmetric(horizontal: 20, vertical: 10),
                                        child: AppStrings.profileImage5 == null? AppStrings.profileImagePath5.isEmpty
                                            ? _dottedBorder(
                                            onTap: () {
                                              _showPicker5(context, meterPhotoController5);
                                            }
                                        )
                                            : _preNetworkImage(
                                          networkImage: AppStrings.profileImagePath5,
                                          imageFile: AppStrings.profileImage5,
                                        )
                                            : _preFileImage(
                                            fileImage: AppStrings.profileImage5,
                                            imageFilePath: AppStrings.profileImage5
                                        )
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _imageNameWidget(imageName: AppStrings.doc3BackImgSide),
                                    Padding(
                                        padding: const EdgeInsets .symmetric(horizontal: 20, vertical: 10),
                                        child: AppStrings.profileImage6 == null? AppStrings.profileImagePath6.isEmpty
                                            ? _dottedBorder(
                                            onTap: () {
                                              _showPicker6(context, meterPhotoController6);
                                            }
                                        )
                                            : _preNetworkImage(
                                          networkImage: AppStrings.profileImagePath6,
                                          imageFile: AppStrings.profileImage6,
                                        )
                                            : _preFileImage(
                                            fileImage: AppStrings.profileImage6,
                                            imageFilePath: AppStrings.profileImage6
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    _imageNameWidget(imageName: AppStrings.consentPhotoLabel),
                                    Padding(
                                        padding: const EdgeInsets .symmetric(horizontal: 20, vertical: 10),
                                        child: AppStrings.profileImage7 == null? AppStrings.profileImagePath7.isEmpty
                                            ? _dottedBorder(
                                            onTap: () {
                                              _showPicker7(context,meterPhotoController7);
                                            }
                                        )
                                            : _preNetworkImage(
                                          networkImage: AppStrings.profileImagePath7,
                                          imageFile: AppStrings.profileImage7,
                                        )
                                            : _preFileImage(
                                            fileImage: AppStrings.profileImage7,
                                            imageFilePath: AppStrings.profileImage7
                                        )
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _imageNameWidget(imageName: AppStrings.chqCancelledPhotoLabel),
                                    Padding(
                                        padding: const EdgeInsets .symmetric(horizontal: 20, vertical: 10),
                                        child: AppStrings.profileImage8 == null? AppStrings.profileImagePath8.isEmpty
                                            ? _dottedBorder(
                                            onTap: () {
                                              _showPicker8(context, meterPhotoController8);
                                            }
                                        )
                                            : _preNetworkImage(
                                          networkImage: AppStrings.profileImagePath8,
                                          imageFile: AppStrings.profileImage8,
                                        )
                                            : _preFileImage(
                                            fileImage: AppStrings.profileImage8,
                                            imageFilePath: AppStrings.profileImage8
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    _imageNameWidget(imageName: AppStrings.chqPhotoLabel),
                                    Padding(
                                        padding: const EdgeInsets .symmetric(horizontal: 20, vertical: 10),
                                        child: AppStrings.profileImage9 == null? AppStrings.profileImagePath9.isEmpty
                                            ? _dottedBorder(
                                            onTap: () {
                                              _showPicker9(context,meterPhotoController9);
                                            }
                                        )
                                            : _preNetworkImage(
                                          networkImage:AppStrings.profileImagePath9,
                                          imageFile:AppStrings.profileImage9,
                                        )
                                            : _preFileImage(
                                            fileImage: AppStrings.profileImage9,
                                            imageFilePath: AppStrings.profileImage9
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                child: Text("SAVE ",style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
                                  dateAndTime = dateFormat.format(DateTime.now());
                                  log("dateAndTime --> $dateAndTime");
                                  var now = new DateTime.now();
                                  var formatter = new DateFormat('yyyy-MM-dd');
                                  AppStrings.formattedTime = DateFormat('kk:mm:a').format(now);
                                  AppStrings.formattedDate = formatter.format(now);
                                  File path1,path2,path3,path4,path5, path6,path7,path8,path9;
                                  if (AppStrings.frontImage != null) {
                                    path1 = File(AppStrings.frontImage.path.toString());
                                  }
                                  if (AppStrings.backImage != null) {
                                    path2 = File(AppStrings.backImage.path.toString());
                                  }
                                  if (AppStrings.profileImage3 != null) {
                                    path3 = File(AppStrings.profileImage3.path.toString());
                                  }
                                  if (AppStrings.electricBillBackImg != null) {
                                    path4 = File(AppStrings.electricBillBackImg.path.toString());
                                  }

                                  if (AppStrings.profileImage5 != null) {
                                    path5 = File(AppStrings.profileImage5.path.toString());
                                  }
                                  if (AppStrings.profileImage6 != null) {
                                    path6 = File( AppStrings.profileImage6.path.toString());
                                  }
                                  if (AppStrings.profileImage7 != null) {
                                    path7 = File(AppStrings.profileImage7.path.toString());
                                  }

                                  if (AppStrings.profileImage8 != null) {
                                    path8 = File(AppStrings.profileImage8.path.toString());
                                  }
                                  if (AppStrings.profileImage9 != null) {
                                    path9 = File(AppStrings.profileImage9.path.toString());
                                  }

                                  DataModel data = DataModel(
                                    crteresterd: _isInterestedId,
                                    crarea_id: _areaTypeId,
                                    crmobile: mobileNoController.text.toString(),
                                    crfirstname:firstNameController.text.toString(),
                                    crmiddlename:middleNameController.text.toString(),
                                    crLastName: lastNameController.text,
                                    crFather: guardianTypeValue,
                                    crGuardian:guardianNameController.text.toString(),
                                    crEmail: emailIdController.text.toString(),
                                    crPropertyCategory: _propertyTypeId,
                                    crPropertyClass: _propertyClassId,
                                    crHouseNumber:houseNumberController.text.toString(),
                                    crLocality:localityController.text.toString(),
                                    crTown: townController.text.toString(),
                                    crPincode: pinCodeController.text.toString(),
                                    crDistrict:getAllDistrictId,
                                    crMDPE:_mdpeValue == 'Yes' ? '1' : '0',
                                    crResidentStatus:_residentStatusValue,
                                    crNOOFKitcen:kitchenController.text.toString(),
                                    crNoBathroom: bathroomController.text,
                                    crExitingCookingFuel:cookInFuelValue,
                                    crFamilyMember: familyMemController.text.toString(),
                                    crLat: latitudeController.text.toString(),
                                    crLog: longitudeController.text.toString(),
                                    crRemarks: landmarkController.text.toString(),
                                    KYCDocument1:_idProofDropDownValueId,
                                    KYCDocument1NumberText:idProofNoController.text.toString(),
                                    KycImageForSide: path1.toString(),
                                    KycImageBackSide: path2.toString(),
                                    IMGElectricbillF: path3.toString(),
                                    ImgOwnerElectricbillE: path4.toString(),
                                    imgdoc3: path5.toString(),
                                    imgdocback3: path6.toString(),
                                    imgConsentPhoto: path7.toString(),
                                    cancelCheckPhoto: path8.toString(),
                                    imgCheckPhoto: path9.toString(),
                                    KYCNOCFSide:_kycProofDropDownValueId,
                                    KYCNOCEndSide:nocProofNoController.text.toString(),
                                    KycBill:_addressProofDropDownValueId,
                                    KYCID:ownershipController.text.toString(),
                                    cusBillingMode:__billingModeValueId,cusAccountNumber:customerAccountNum.text,
                                    cusIFSCCode: IFSCController.text.toString(),
                                    cusBankAdrress:bank_address.text.toString(),
                                    conversionPolicy:__acceptConversionPolicyValueId,
                                    extraFillingCost:__acceptExtraFittingCostValueId,
                                    IDDeposteStatus:_depositStatusId.toString(),
                                    IDMODEofDeposite: _modeOfDeposit,
                                    IDScheemType: schemeId,
                                    IDDepositeAmount:depositAmountController.text.toString(),
                                    IDCheckNumber:chqNOController.text.toString(),
                                    IDcheckDate: initDepDateController.text.toString(),
                                    cusBankName: _bankValue==null ? '': _bankValue,
                                    IDcheckBankName: _bankValue2 == null ? "" : _bankValue2,
                                    IDcheckBankAccountNumber:bankAccNoController.text.toString(),
                                    dt: initDepDateController.text.toString(),
                                    DateandTime: dateAndTime.toString(),
                                    MICR: mICRCodeController.text.toString(),
                                  );
                                  var mmm = dataBox.length;
                                  if(mmm<=50) {
                                    dataBox.add(data);
                                    EasyLoading.showSuccess('Great Success! \n Record Save');
                                    Navigator.push(context,MaterialPageRoute(builder:(context) => RegistrationForm()),);
                                  }
                                  else {
                                    EasyLoading.showError('Error !!!! \n Please Uploade Previous record');
                                  }
                                },
                              ),
                              ElevatedButton(
                                child: Text("EDIT",style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
                );
              }


            },
          ),
        ],
      ),
    );
  }

 Widget _interestedDropDown(){
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.interestedLabel,
      hint: AppStrings.interestedLabel,
      items: dropListModelInterested,
      value: _isInterestedItem,
      onChanged: (OptionItem value) {
        setState(() {
          _isInterestedId = value.id;
          _isInterestedItem = value;
          if (_isInterestedId == '0') {
            familyMemController.text = '1';
            bathroomController.text = '1';
            kitchenController.text = '1';
          } else {
            familyMemController.text = '1';
            bathroomController.text = '1';
            kitchenController.text = '1';
          }
        });
      },
    );
  }

  Widget _conversionPolicyDropDown(){
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.conversionPolicyLabel,
      hint: AppStrings.conversionPolicyLabel,
      items: _acceptConversionPolicyList,
      value: __acceptConversionPolicyValue,
      onChanged: (value) {
        setState(() {
          __acceptConversionPolicyValueId = value.id;
          __acceptConversionPolicyValue = value;
          log(__acceptConversionPolicyValueId);
        });
      },
    );
  }

  Widget  _fittingCostDropDown(){
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.fittingCostLabel,
      hint: AppStrings.fittingCostLabel,
      items: _acceptExtraFittingCostList,
      value: __acceptExtraFittingCostValue,
      onChanged: (value) {
        setState(() {
          __acceptExtraFittingCostValueId = value.id;
          __acceptExtraFittingCostValue = value;
          log(__acceptExtraFittingCostValueId);
        });
      },
    );
  }

  Widget _mdpeDropdown(){
    return ReusedDropDownString(
      textLabel: AppStrings.mdpeAllowLabel,
      hint: AppStrings.mdpeAllowLabel,
      items: _mdpeDropdownItems,
      value: _mdpeValue,
      onChanged: (String value) {
        setState(() => _mdpeValue = value);
      },
    );
  }

  Widget _reasonInterestedWidget(){
    return TextFieldWidget(
      enabled: true,
      textInputType : TextInputType.text,
      controller: reasonController,
      hintText:AppStrings.reasonLabel,
      labelText: AppStrings.reasonLabel,
    );
  }

  Widget _chargeAreaDropDown(){
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.chargeAreaLabel,
      hint: AppStrings.chargeAreaLabel,
      items: chargeAreaItems,
      value: chargeAreaType,
      onChanged: (OptionItem value) {
        setState(() {
          chargeAreaId = value.id;
          chargeAreaType = value;
          print("chargeAreaType-->"+chargeAreaType.title);
          _dropdownItems.clear();
          _areaType = null;
          fetchArea(value.id);
        });

      },
    );
  }

  Widget _areaDropDown(){
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.areaLabel,
      hint: AppStrings.areaLabel,
      items: _dropdownItems,
      value: _areaType,
      onChanged: (OptionItem value) {
        setState(() {
          _areaTypeId = value.id;
          _areaType = value;
          print("_areaTypeId--------->"+_areaTypeId);
        });
      },
    );
  }

  Widget _mobileWidget(){
    return TextFieldWidget(
        labelText: AppStrings.mobileNoLabel,
        hintText: AppStrings.mobileNoLabel,
        controller:mobileNoController,
        textInputType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        maxLength: 10,
        suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
        validator: (value){
          if(value.isEmpty){
            return "Please enter Mobile Number";
          }
          else if(value.length <= 9){
            return 'Mobile Number must be of 10 digit';
          }
          return null;
        },
        onChanged:(v){
          formGlobalKey.currentState.validate();
          setState(()=> v.length <= 9 ? checkAuto = false : checkAuto = true);
        }
    );
  }

  Widget _firstNameWidget(){
    return  TextFieldWidget(
      labelText: AppStrings.firstNameLabel,
      hintText:AppStrings.firstNameLabel,
      controller:firstNameController,
      textInputType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
      ],
      suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
      validator: (value){
        if(value.isEmpty|| !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
          return "Enter First Name";
        } else if(value.length <= 2){
          return "First Name must be of minimum 2+ Letters";
        }
        return null;
      },
      onChanged:(v){
        v = firstNameController.text.trim().toString();
        formGlobalKey.currentState.validate();
        setState(()=> v.length <= 2 ? checkAuto = false : checkAuto = true);
      },
    );
  }

  Widget _middleWidget(){
    return TextFieldWidget(
      labelText:AppStrings.middleNameLabel,
      hintText:AppStrings.middleNameLabel,
      controller:middleNameController,
      textInputType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
    );
  }

  Widget _lastNameWidget(){
    return  TextFieldWidget(
      labelText: AppStrings.lastNameLabel,
      hintText:AppStrings.lastNameLabel,
      controller:lastNameController,
      textInputType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
      suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
      validator: (value){
        if(value.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
          return "Enter Last Name";
        }
        return null;
      },
      onChanged:(v){
        formGlobalKey.currentState.validate();
        setState(()=> v.length <= 2 ? checkAuto = false : checkAuto = true);
      },
    );
  }

  Widget _guardianTypeDropDown(){
    return  ReusedDropDownString(
      textLabel: AppStrings.guardianTypeLabel,
      onChanged: (String value) {
        setState(()=>  guardianTypeValue = value);
      },
      items: guardianTypeDropdownItems,
      value: guardianTypeValue,
      hint: 'Select Relation Type',
    );
  }

  Widget _guardianNameWidget(){
    return TextFieldWidget(
      labelText: AppStrings.guardianNameLabel,
      hintText: AppStrings.guardianNameLabel,
      controller:guardianNameController,
      textInputType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
      suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
      validator: (value){
        if(value.isEmpty){
          return "Please enter Guardian name";
        } else if(!RegExp('.*[A-Z].*').hasMatch(value ?? '')){
          return 'Input should contain an uppercase letter A-Z.';
        } else if(value.length <= 2){
          return "Enter a Guardian name 2+char long";
        }
        return null;
      },
      onChanged:(v){
        formGlobalKey.currentState.validate();
        setState(()=> v.length <= 2 ? checkAuto = false : checkAuto = true);
      },
    );
  }

  Widget _emailWidget(){
    return  TextFieldWidget(
      labelText: AppStrings.emailAddressLabel,
      hintText: AppStrings.emailAddressLabel,
      controller:emailIdController,
      textCapitalization :TextCapitalization.none,
      textInputType : TextInputType.emailAddress,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-z0-9@._-]")),],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your emailAddress.';
        } else if (!RegExp(
            r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
            .hasMatch(value)) {
          return 'Please enter a valid Email';
        }
        return null;

      },
      onChanged:(v){
        formGlobalKey.currentState.validate();
      },
    );
  }

  Widget _propertyCategoryDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.propertyCategoryLabel,
      onChanged: (OptionItem value) {
        setState(() {
          _propertyTypeId = value.id;
          pCategoryId = value.id;
          log("_propertyTypeId$_propertyTypeId");
          _categoryType = value;
        });
      },
      items: _propertyDropdownItems,
      value: _categoryType,
      hint: 'Select Property Category',
    );
  }

  Widget _propertyClassDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.propertyClassLabel,
      onChanged: (OptionItem value) {
        setState(() {
          _propertyClassId = value.id;
          log("_propertyClassId$_propertyClassId");
          _propertyClassType = value;
        });
      },
      items: _propertyClassDropdownItems,
      value: _propertyClassType,
      hint: 'Select Property Class',
    );
  }
  Widget _depositAmountWidget(){
    return TextFieldWidget(
      enabled: false,
      labelText: AppStrings.depositAmountControllerLabel,
      hintText: AppStrings.depositAmountControllerLabel,
      controller:depositAmountController,
      textInputType: TextInputType.number,
      onChanged: (value) {
        if (value.length > 1) {
          setState(() {
            fDepositeSiteCheck = true;
          });
        } else {
          setState(() {
            fDepositeSiteCheck = true;
          });
        }
      },
    );
  }

/*_depositTypeLabel*/
  getdepositTypeDropDown() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: DropdownButtonFormField<DepositItem>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: _propertyDropdownItemsDeposit,
                value: _depositCategoryType,
                hint: Text(AppStrings.depositTypeLabel,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal),
                ),
                onChanged: (DepositItem value) {
                  setState(() {
                    _schemeMonth = value.schememonth;
                    if (_schemeMonth > 0) {
                      depositAmountController.text = value.firstamount.toString();
                    } else {
                      depositAmountController.text = value.amount.toString();
                    }
                    AppStrings.depositName = value.title;
                    AppStrings.depositAmountController = value.amount;
                    gasDepositAmountController = value.gas_amount;
                    schemeId = value.id;
                    AppStrings.schemeType = value.scheme_type;
                    AppStrings.schemeCode = value.scheme_code;
                    AppStrings.depositAmount = value.deposit_amount;
                    AppStrings.equipmentDepositAmount = value.equipment_deposit_amount;
                    AppStrings.interestAmount = value.interest_amount;
                    AppStrings.registrationGST = value.registration_gst;
                    AppStrings.interestTaxAmt = value.interest_tax_amt;
                    AppStrings.totalAmount = value.totalAmount;
                    AppStrings.nextCycleAmount = value.nextCycleAmount;
                    AppStrings.registrationTaxName = value.registration_tax_name;
                    depositTotalAmount = value.total_amount;
                    AppStrings.interestTaxAmt = value.interest_tax_amt;
                    AppStrings.regTax = value.reg_tax;
                    AppStrings.msgSchemeDetail =
                        "Deposit Name = " + AppStrings.depositName +
                            "\nDeposit Amount = " + AppStrings.depositAmountController.toString() +
                            "\nSchemeMonth = " +_schemeMonth.toString() +
                            "\nEquipment Deposit Amount = " + AppStrings.equipmentDepositAmount +
                            "\nGAS Amount = " +gasDepositAmountController.toString() +
                            "\nFirst Deposit Amount = " +value.firstamount.toString();

                  });
                },
                isExpanded: true,
                isDense: true,
              ),
            ),
            getDepositDetailButton("Detail",alignment: CrossAxisAlignment.center),
          ],
        ));
  }

  getDepositDetailButton(title, {alignment}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      child: Column(
          crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                child: Text(title,style: TextStyle(color: Colors.white),),
                onPressed: () {
                  _showdepositAmountControllerDialog(AppStrings.msgSchemeDetail);
                }),
          ]),
    );
  }

  _showdepositAmountControllerDialog( String _msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Description'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [Text((_msg))],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _houseNumberWidget(){
    return TextFieldWidget(
      labelText: AppStrings.houseNumberLabel,
      hintText: AppStrings.houseNumberLabel,
      controller:houseNumberController,
      textInputType: TextInputType.number,
      suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
      validator: (value){
        if(value.isEmpty){
          return "Please enter House Number";
        }
        return null;
      },
      onTap: (){},
      onChanged:(v){
        formGlobalKey.currentState.validate();
        setState(()=> v.length >= 1 ? checkAuto = true : checkAuto = false);
      },
    );
  }

  Widget  _localityWidget(){
    return TextFieldWidget(
      labelText:AppStrings.addressLabel,
      hintText: AppStrings.addressLabel,
      controller:localityController,
      textInputType: TextInputType.text,
      suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
      validator: (value){
        if(value.isEmpty){
          return "Please enter the locality";
        }
        return null;
      },
      onTap: (){},
      onChanged:(v){
        formGlobalKey.currentState.validate();
        setState(()=> v.length > 1 ? checkAuto = true : checkAuto = false);
      },
    );
  }

  Widget _townWidget(){
    return TextFieldWidget(
        labelText: AppStrings.townLabel,
        hintText: AppStrings.townLabel,
        controller:townController,
        textInputType: TextInputType.name,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))]
    );
  }

  Widget _districtWidget(){
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.districtLabel,
      items: getAllDistrictItems,
      value: getAllDistrictType,
      hint: AppStrings.districtLabel,
      onChanged: (OptionItem value) {
        setState(() {
          getAllDistrictId = value.id;
          getAllDistrictType = value;
        });

      },
    );
  }

  Widget _pinCodeWidget(){
    return  TextFieldWidget(
        labelText: AppStrings.pinCodeLabel,
        hintText:AppStrings.pinCodeLabel,
        controller:pinCodeController,
        textInputType: TextInputType.number,
        maxLength: 6,
        suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
        validator: (value){
          if(value.isEmpty){
            return "Please enter Pin Number";
          }
          else if(value.length <= 5){
            return 'Pin Number must be of 6 digit';
          }
          return null;
        },
        onTap: (){},
        onChanged:(v){
          formGlobalKey.currentState.validate();
          setState(()=> v.length <= 5 ? checkAuto = false : checkAuto = true);
        }
    );
  }

  Widget _noKitchenWidget(){
    return  TextFieldWidget(
      labelText:AppStrings.noOfKitchenLabel,
      hintText: AppStrings.noOfKitchenLabel,
      controller:kitchenController,
      textInputType: TextInputType.number,
      maxLength: 2,
    );
  }

  Widget _noBathroomWidget(){
    return TextFieldWidget(
      labelText:AppStrings.noOfBathroomLabel,
      hintText: AppStrings.noOfBathroomLabel,
      controller:bathroomController,
      textInputType: TextInputType.number,
      maxLength: 2,
    );
  }

  Widget _noFamilyWidget(){
    return  TextFieldWidget(
      labelText:AppStrings.noOfFamilyMembersLabel,
      hintText: AppStrings.noOfFamilyMembersLabel,
      controller:familyMemController,
      textInputType: TextInputType.number,
      maxLength: 2,
    ) ;
  }


  Widget _locationWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 0.0),
          child: Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(AppStrings.locationCoordinatesLabel,style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
            ),
          ),
        ),
        TextFieldWidget(
          enabled: false,
          labelText: AppStrings.locationLat,
          hintText: AppStrings.locationLat,
          controller:latitudeController,
        ),
        TextFieldWidget(
          enabled: false,
          labelText: AppStrings.locationLong,
          hintText: AppStrings.locationLong,
          controller:longitudeController,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
          child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  child: new Text(AppStrings.getLocationLabel),
                  onPressed: ()async{
                    Position position = await _getCurrentLocation();
                    AppStrings.locationLat ='${position.latitude} ';
                    AppStrings.locationLong = '${position.longitude}';
                    latitudeController.text ='${position.latitude} ';
                    longitudeController.text = '${position.longitude}';
                  },
                ),
              ]),
        ),
      ],
    );
  }

  Widget _landmarkWidget(){
    return TextFieldWidget(
      labelText: AppStrings.landmarkLabel,
      hintText: AppStrings.landmarkLabel,
      controller: landmarkController,
      textInputType  : TextInputType.text,
    );
  }

  Widget _fuelDropdownWidget() {
    return ReusedDropDownString(
      textLabel: AppStrings.existingCookingFuelLabel,
      onChanged: (String value) {
        setState(() =>  cookInFuelValue = value);
      },
      items: _cookingFuelDropdownItems,
      value: cookInFuelValue,
      hint: 'Select Existing Cooking Fuel',
    );
  }

  _residentStatusDropdownWidget() {
    return ReusedDropDownString(
      textLabel: AppStrings.residentStatusLabel,
      items: _residentDropdownItems,
      value: _residentStatusValue,
      hint: AppStrings.residentStatusLabel,
      onChanged: (String value) {
        setState(() =>  _residentStatusValue = value);
      },
    ) ;
  }

  _docTypeDropDown() {
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.docTypeLabel,
      hint: AppStrings.docTypeLabel,
      items: _idProofDropdownItems,
      value: _idProofDropDownValue,
      onChanged: (OptionItem value) {
        setState(() {
          _idProofDropDownValueId = value.id;
          _idProofDropDownValue = value;
        });
      },
    );
  }

  Widget _backNameWidget() {
    return TextFieldWidget(
        maxLength: 20,
        labelText: AppStrings.customerAccountNoLabel,
        hintText: AppStrings.customerAccountNoLabel,
        controller: bankAccNoController,
        textInputType: TextInputType.text,
        suffixIcon: checkAuto == true ? Icon(
          Icons.check_circle_sharp, color: Colors.green,) : Icon(Icons.info,),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter bank account number";
          } else if (value.length <= 7) {
            return 'bank account number must be of 6 digit';
          }
          return null;
        },
        onTap: () {},
        onChanged: (v) {
          formGlobalKey.currentState.validate();
          setState(() => v.length <= 7 ? checkAuto = false : checkAuto = true);
        }
    );
  }

  Widget _micrCodeWidget() {
    return TextFieldWidget(
        labelText: AppStrings.mICRCodeLabel,
        hintText: AppStrings.mICRCodeLabel,
        maxLength: 9,
        controller: mICRCodeController,
        textInputType: TextInputType.number,
        suffixIcon: checkAuto == true ? Icon(
          Icons.check_circle_sharp, color: Colors.green,) : Icon(Icons.info,),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter MICR Code";
          }
          else if (value.length <= 8) {
            return 'MICR Code must be of 9 digit';
          }
          return null;
        },
        onTap: () {},
        onChanged: (v) {
          formGlobalKey.currentState.validate();
          setState(() => v.length <= 8 ? checkAuto = false : checkAuto = true);
        }
    );
  }

  Widget _chequeImageWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _imageNameWidget(imageName: AppStrings.chqPhotoLabel),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppStrings.profileImage9 == null ? AppStrings.profileImagePath9.isEmpty
              ? _dottedBorder(
              onTap: () => _showPicker9(context, meterPhotoController9)
          )
              : _networkImageWidget(
              networkImage: AppStrings.profileImagePath9,
              onPressed: () {
                setState(() => AppStrings.profileImagePath9 = "");
              }
          )
              : _fileImageWidget(
              fileImage: AppStrings.profileImage9,
              onPressed: () {
                setState(() => AppStrings.profileImage9 = null);
              }
          ),
        ),
      ],
    );
  }

  Widget _backImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.idBackImgSide),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppStrings.backImage == null ? AppStrings.backImagePath.isEmpty
              ? _dottedBorder(
              onTap: () => _showPicker2(context, meterPhotoController2)
          )
              : _networkImageWidget(
              networkImage: AppStrings.backImagePath,
              onPressed: () {
                setState(() => AppStrings.backImagePath = "");
              }
          )
              : _fileImageWidget(
              fileImage: AppStrings.backImage,
              onPressed: () {
                setState(() => AppStrings.backImage = null);
              }
          ),
        ),
      ],
    );
  }

  Widget _frontImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.idFrontImgSide),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppStrings.frontImage == null
              ? AppStrings.frontImagePath.isEmpty
              ? _dottedBorder(
              onTap: () => _showPicker(context, meterPhotoController)
          )
              : _networkImageWidget(
              networkImage: AppStrings.frontImagePath,
              onPressed: () {
                setState(() => AppStrings.frontImagePath = "");
              }
          )
              : _fileImageWidget(
              fileImage: AppStrings.frontImage,
              onPressed: () {
                setState(() => AppStrings.frontImage = null);
              }
          ),
        ),
      ],
    );
  }

  Widget _electricBillFrontImgWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.electricBillFrontImg),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppStrings.profileImage3 == null ? AppStrings.profileImagePath3.isEmpty
              ? _dottedBorder(
              onTap: () => _showPicker3(context, meterPhotoController3)
          )
              : _networkImageWidget(
              networkImage: AppStrings.profileImagePath3,
              onPressed: () {
                setState(() => AppStrings.profileImagePath3 = "");
              }
          )
              : _fileImageWidget(
              fileImage: AppStrings.profileImage3,
              onPressed: () {
                setState(() => AppStrings.profileImage3 = null);
              }
          ),
        ),

      ],
    );
  }

  Widget _electricBillBackImgWidget(){
    return  Column(
      children: [
        _imageNameWidget(imageName: AppStrings.electricBillBackImgLabel),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppStrings.electricBillBackImg == null ? AppStrings.electricBillBackImgPath.isEmpty
              ? _dottedBorder(
              onTap:()=> _showPicker4(context, meterPhotoController4)
          )
              : _networkImageWidget(
              networkImage: AppStrings.electricBillBackImgPath ,
              onPressed:(){
                setState(()=> AppStrings.electricBillBackImgPath = "");
              }
          )
              : _fileImageWidget(
              fileImage: AppStrings.electricBillBackImg,
              onPressed: () {
                setState(() => AppStrings.electricBillBackImg = null);
              }
          ),
        ),
      ],
    );
  }

  Widget _nocProofNoWidget(){
    return   TextFieldWidget(
        labelText: AppStrings.nocProofNoLabel,
        hintText: AppStrings.nocProofNoLabel,
        controller:nocProofNoController,
        textInputType: TextInputType.text,
        maxLength: 20,
        suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
        validator: (value){
          if(value.isEmpty){
            return "Please enter NOC Proof Number";
          }
          return null;
        },
        onTap: (){},
        onChanged:(v){
          formGlobalKey.currentState.validate();
          setState(()=> v.length > 2 ? checkAuto = false : checkAuto = true);
        }
    );
  }

  Widget _nocFrontImageWidget(){
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.doc3FrontImgSide),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppStrings.profileImage5 == null ? AppStrings.profileImagePath5.isEmpty
              ? _dottedBorder(
              onTap:()=>  _showPicker5(context,  meterPhotoController5)
          )
              : _networkImageWidget(
              networkImage:AppStrings.profileImagePath5 ,
              onPressed:(){
                setState(()=> AppStrings.profileImagePath5 = "");
              }
          )
              : _fileImageWidget(
              fileImage: AppStrings.profileImage5,
              onPressed: () {
                setState(() => AppStrings.profileImage5 = null);
              }
          ),
        ),
      ],
    );
  }

  Widget _nocBackImageWidget(){
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.doc3BackImgSide),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppStrings.profileImage6 == null ? AppStrings.profileImagePath6.isEmpty
              ? _dottedBorder(
            onTap:()=>  _showPicker6(context, meterPhotoController6),
          )
              : _networkImageWidget(
              networkImage: AppStrings.profileImagePath6 ,
              onPressed:(){
                setState(()=> AppStrings.profileImagePath6 = "");
              }
          )
              : _fileImageWidget(
              fileImage: AppStrings.profileImage6,
              onPressed: () {
                setState(() => AppStrings.profileImage6 = null);
              }
          ),
        ),
      ],
    );
  }

  Widget _consentImageWidget(){
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.consentPhotoLabel),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:AppStrings.profileImage7 == null ? AppStrings.profileImagePath7.isEmpty
              ? _dottedBorder(
            onTap:()=>  _showPicker7(context, meterPhotoController7),
          )
              : _networkImageWidget(
              networkImage: AppStrings.profileImagePath7,
              onPressed:(){
                setState(()=> AppStrings.profileImagePath7 = "");
              }
          )
              : _fileImageWidget(
              fileImage: AppStrings.profileImage7,
              onPressed: () {
                setState(() => AppStrings.profileImage7 = null);
              }
          ),
        ),
      ],
    );
  }

  Widget _cancelChqImageWidget(){
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.chqCancelledPhotoLabel),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppStrings.profileImage8 == null ? AppStrings.profileImagePath8.isEmpty
              ? _dottedBorder(
            onTap:()=> _showPicker8(context, meterPhotoController8),
          )
              : _networkImageWidget(
              networkImage:AppStrings.profileImagePath8,
              onPressed:(){
                setState(()=> AppStrings.profileImagePath8 = "");
              }
          )
              : _fileImageWidget(
              fileImage: AppStrings.profileImage8,
              onPressed: () {
                setState(() => AppStrings.profileImage8 = null);
              }
          ),
        ),

      ],
    );
  }

  Widget _idProofNoWidget(){
    return TextFieldWidget(
      labelText: AppStrings.idProofNo,
      hintText: AppStrings.idProofNo,
      controller:idProofNoController,
      textInputType: TextInputType.text,
      maxLength: 20,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-0-9\u0900-\u097F]",))],
    );
  }

  Widget _ownerProofNoWidget(){
    return TextFieldWidget(
        labelText: AppStrings.ownershipProofNo,
        hintText: AppStrings.ownershipProofNo,
        controller:ownershipController,
        textInputType: TextInputType.text,
        maxLength: 20,
        suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
        validator: (value){
          if(value.isEmpty){
            return "Please enter Ownership Proof No";
          }
          return null;
        },
        onChanged:(v){
          formGlobalKey.currentState.validate();
          setState(()=> v.length <= 1 ? checkAuto = false : checkAuto = true);
        }
    );
  }

  Widget getDropDown2() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      child: ReusedDropDownOptionItem(
        textLabel:AppStrings.docTypeLabel,
        hint: AppStrings.docTypeLabel,
        items: _addressProofDropdownItems,
        value: _addressProofDropDownValue,
        onChanged: (OptionItem value) {
          log(value.id);
          setState(() {
            _addressProofDropDownValueId = value.id;
            _addressProofDropDownValue = value;
          });
        },
      ),
    );
  }

  Widget getDropDown3() {
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.docTypeLabel,
      hint: AppStrings.docTypeLabel,
      items: _kycProofDropdownItems,
      value: _kycProofDropDownValue,
      onChanged: (OptionItem value) {
        log(value.id);
        setState(() {
          _kycProofDropDownValueId = value.id;
          _kycProofDropDownValue = value;
        });
      },
    );
  }

  Widget _billModeDropDown(){
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.billingModeLabel,
      hint: AppStrings.billingModeLabel,
      items: _billingModeList,
      value: __billingModeValue,
      onChanged: (value) {
        setState(() {
          __billingModeValueId = value.id;
          __billingModeValue = value;
          log(__billingModeValueId);
        });
      },
    );
  }

  Widget _customerBankDropDown() {
    return ReusedDropDownString(
      textLabel:AppStrings.customerBankNameLabel,
      hint: AppStrings.customerBankNameLabel,
      items: _bankDropdownItems.map((String item) {
        return DropdownMenuItem<String>(
            value:item,
            child: Text(item)
        );
      }).toList(),
      value: _bankValue,
      onChanged: (value) {
        setState(() {
          _bankValue = value;
          print("_bankValue-->"+_bankValue);
        });
      },
    );
  }

  Widget _customerBackNoWidget(){
    return TextFieldWidget(
        labelText:AppStrings.customerAccountNoLabel,
        hintText: AppStrings.customerAccountNoLabel,
        controller:customerAccountNum,
        textInputType: TextInputType.text,
        maxLength: 20,
        suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
        validator: (value){
          if(value.isEmpty){
            return "Please enter Customer Account Number";
          }else if(value.length <= 16){
            return "Customer Account Number must be of 17 digit";
          }
          return null;
        },
        onChanged:(v){
          formGlobalKey.currentState.validate();
          setState(()=> v.length <= 16 ? checkAuto = false : checkAuto = true);
        }
    );
  }

  Widget _customerIFSCCodeWidget(){
    return TextFieldWidget(
        labelText: AppStrings.customerIfscCodeLabel,
        hintText: AppStrings.customerIfscCodeLabel,
        controller:IFSCController,
        textInputType: TextInputType.text,
        maxLength: 11,
        suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
        validator: (value){
          if(value.isEmpty){
            return "Please enter Customer Ifsc Code";
          }else if(value.length <= 10){
            return "Customer Ifsc Code must be of 11 digit";
          }
          return null;
        },
        onChanged:(v){
          formGlobalKey.currentState.validate();
          setState(()=> v.length <= 10 ? checkAuto = false : checkAuto = true);
        }
    );
  }

  Widget _customerBankAddWidget(){
    return TextFieldWidget(
      labelText: AppStrings.customerBankAddress,
      hintText: AppStrings.customerBankAddress,
      controller:bank_address,
      textInputType: TextInputType.text,
      suffixIcon: checkAuto == true ? Icon(Icons.check_circle_sharp,color: Colors.green,): Icon(Icons.info,),
      validator: (value){
        if(value.isEmpty){
          return "Please enter the customer bank address";
        }
        return null;
      },
      onTap: (){},
      onChanged:(v){
        formGlobalKey.currentState.validate();
        setState(()=> v.length > 1 ? checkAuto = true : checkAuto = false);
      },
    );
  }

  Widget _depositStatusDropDown(){
    return ReusedDropDownOptionItem(
      textLabel:AppStrings.depositStatusLabel,
      hint: AppStrings.depositStatusLabel,
      items: dropListDepositStatusList,
      value: __depositStatusValue,
      onChanged: (OptionItem value) {
        setState(() {
          _depositStatusId = value.id;
          __depositStatusValue = value;
          if (_depositStatusId != '2') {
            reasonNoController.text = '';
          }
        });
      },
    );
  }

  Widget _reasonDepositStatusWidget(){
    return TextFieldWidget(
      labelText: AppStrings.reasonLabel,
      hintText: AppStrings.reasonLabel,
      controller:reasonNoController,
      textInputType: TextInputType.text,
    );
  }

  Widget  _modeDepositDropDown(){
    return ReusedDropDownOptionItem(
        textLabel:AppStrings.modeOfDepositLabel,
        hint: AppStrings.modeOfDepositLabel,
        items: dropListModeOfDepositList,
        value: __modeDepositValue,
        onChanged: (item) {
          setState(() {
            __modeDepositValue = item;
            print("__modeDepositValue-->"+ __modeDepositValue.id.toString());
          });
          if (item.id == "2") {
            _modeOfDeposit = item.id;
            setState(() {
              chqNOController.clear();
              bankAccNoController.text="";
              mICRCodeController.text = "";
              mICRCodeController.clear();
              initDepDateController.clear();
              chqDateController.text="";
              checkONLine=false;
              isDepositCheq = false;
              _modeOfDeposit = item.id;
            });
          } else {
            setState(() {
              checkONLine=true;
              isDepositCheq = true;
              _modeOfDeposit = item.id;
            });
          }
        }
    );
  }

  Widget _chqNoWidget(){
    return TextFieldWidget(
      labelText: AppStrings.chqNoLabel,
      hintText: AppStrings.chqNoLabel,
      controller:chqNOController,
      maxLength: 5,
      textInputType: TextInputType.number,
    );
  }

  Widget _depositDateWidget(){
    return TextFieldWidget(
      labelText: AppStrings.depositDateLabel,
      hintText:  AppStrings.depositDateLabel,
      controller:initDepDateController,
      readOnly : true,
      textInputType: TextInputType.datetime,
      onTap: () => _selectDate(context, initDepDateController),
    );
  }

  Widget _bankNameDropDown() {
    return ReusedDropDownString(
      textLabel:AppStrings.bankNameLabel,
      hint: AppStrings.bankNameLabel,
      items:_bankDropdownItems2.map((String item) {
        return DropdownMenuItem<String>(
          value:item,
          child: Text(item),
        );
      }).toList(),
      value:_bankValue2,
      onChanged: (String value) {
        setState(() {
          _bankValue2 = value;
          print("_bankValue2--->"+_bankValue2);
        });
      },
    );
  }

  Widget _buildCardWidget({String text}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Card(
          shape: Border(left: BorderSide(color: Colors.blue, width: 15)),
          elevation: 5,
          shadowColor: Colors.lightBlueAccent,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Text(text),
          ),
        ),
      ),
    );
  }

  Widget _dottedBorder({Function onTap}){
    return Container(
      alignment: Alignment.topLeft,
      child: GestureDetector(
          child: DottedBorder(
            padding: EdgeInsets.all(20),
            borderType: BorderType.Circle,
            dashPattern: [6, 3],
            color: greyColor,
            child: Image.asset("assets/images/place_holder.png",width: 60,height: 60,),
          ),
          onTap:onTap
      ),
    );
  }

  Widget _networkImageWidget({Function onPressed, String networkImage}){
    return Container(
      alignment: Alignment.topLeft,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(networkImage),
            radius: 40,
            child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: blackColor.withOpacity(0.7),
                child: IconButton(
                    icon: Icon(Icons.delete_outlined,color: whiteColor.withOpacity(0.7)),
                    onPressed:onPressed),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _imageNameWidget({String imageName}){
    return Card(
        elevation: 5,
        shadowColor: Colors.white,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(imageName,style: TextStyle(color: Colors.white),),
        ));
  }

  Widget  _fileImageWidget({File fileImage,Function onPressed}){
    return Container(
      alignment: Alignment.topLeft,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage:FileImage(fileImage),
            radius: 40,
            child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor:
                blackColor.withOpacity(0.7),
                child: IconButton(
                    icon: Icon(Icons.delete_outlined,color: whiteColor.withOpacity(0.7)),
                    onPressed:onPressed
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRow({String leading,String trailing}){
    return Column(
      children: [
        ListTile(
          leading: Text(leading),
          trailing:Text(trailing),
        ),
        Divider(),
      ],
    );
  }

  Widget _preNetworkImage({String networkImage, File imageFile}){
    return Container(
      alignment:Alignment.topLeft,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage:NetworkImage(networkImage),
            radius:40,
            child:Align(
              alignment:Alignment.center,
              child:CircleAvatar(
                backgroundColor:blackColor.withOpacity(0.7),
                child: IconButton(icon: Icon(Icons.zoom_out_map, color: whiteColor.withOpacity(0.7),),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      );
                      AlertDialog alert = AlertDialog(
                        title: Text("HPCL DMA"),
                        content: Image.file(File(imageFile.path)),
                        actions: [ okButton,],
                      );
                      showDialog(context: context,builder: (BuildContext context) {
                        return alert;
                      },
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _preFileImage({File fileImage,File imageFilePath}){
    return Container(
      alignment: Alignment.topLeft,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: FileImage(AppStrings.frontImage, ),
            radius: 40,
            child: Align(
              alignment:Alignment.center,
              child:CircleAvatar(
                backgroundColor: blackColor.withOpacity(0.7),
                child: IconButton(icon: Icon(Icons.zoom_out_map,color:whiteColor.withOpacity(0.7),),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      );
                      AlertDialog alert = AlertDialog(
                        title: Text("HPCL DMA"),
                        content: Image.file(File(imageFilePath.path)),
                        actions: [okButton, ],
                      );
                      showDialog(context: context,builder: (BuildContext context) {
                        return alert;
                      },
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }


  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    setState(() {
      initDepDateController.text = formatter.format(pickedDate);
      if (initDepDateController.text.toString().isNotEmpty) {
        fDepositeDate = true;
      } else {}
    });
  }

  Future<void> fetchDistrict() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    List dataChargeList = json.decode(prefs.getString(GlobalConstants.AllDistrict));
    List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
      dataChargeList.length, (i) => DropdownMenuItem(
      value: OptionItem(id: dataChargeList[i]['id'], title: dataChargeList[i]['district_name']),
      child: Text("${dataChargeList[i]['district_name']}"),
    ),
    );
    if (!mounted) return;
    setState(() {
      getAllDistrictItems = menuItems;
    });
  }

  Future<void> fetchArea(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    List dataList = json.decode(prefs.getString(GlobalConstants.area));
    List<DropdownMenuItem<OptionItem>> menuItems = [];
    for(int i=0; i< dataList.length; i++) {
      if(dataList[i]['charge_area_id'] == id) {
        menuItems.add(DropdownMenuItem(
          value: OptionItem(id: dataList[i]['gid'], title: dataList[i]['area_name']),
          child: Text("${dataList[i]['area_name']}"),
        ));
      }
    }
    if (!mounted) return;
    setState(() {
      _dropdownItems = menuItems;
    });
  }

  Future<void> fetchChargeAreaList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    List dataChargeList = json.decode(prefs.getString(GlobalConstants.chargeAreaName));
    //   _toastMsg(dataList.toString());
    log(dataChargeList.toString());
    List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
      dataChargeList.length,
          (i) => DropdownMenuItem(
        value:
        OptionItem(id: dataChargeList[i]['gid'], title: dataChargeList[i]['charge_area_name']),
        child: Text("${dataChargeList[i]['charge_area_name']}"),
      ),
    );
    if (!mounted) return;
    setState(() {
      chargeAreaItems = menuItems;
    });
    fetchArea(dataChargeList[0]['gid']);
  }

  Future<void> interestedDorpdownList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    var res = prefs.getString(GlobalConstants.Interested);
    schema = prefs.getString(GlobalConstants.schema);
    final decoded = jsonDecode(res) as Map;
    decoded.forEach((k, v) {
      dropListModelInterested.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    setState(() {
      _isInterestedItem = dropListModelInterested.first.value;
      _isInterestedId = _isInterestedItem.id;
    });
  }

  Future<void> _getSocietyAllow() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    var res = prefs.getString(GlobalConstants.sociaty_allow);
    final decoded = jsonDecode(res) as Map;
    decoded.forEach((k, v) {
      _mdpeDropdownItems.add(DropdownMenuItem(
        value: v,
        child: Text(v),
      ));
    });
    _mdpeValue = decoded.values.first;
    setState(() {});
  }

  Future<void> _getExistingCookingFuel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    var res = prefs.getString(GlobalConstants.CookingFuel);
    schema = prefs.getString(GlobalConstants.schema);
    final decoded = jsonDecode(res) as Map;
    for (final name in decoded.values) {
      _cookingFuelDropdownItems.add(DropdownMenuItem(
        value: name,
        child: Text(name),
      ));
    }
    cookInFuelValue = decoded.values.first;
    setState(() {});
  }

  Future<void> _getGuardianType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    var res = prefs.getString(GlobalConstants.GuardianType);
    final decoded = jsonDecode(res) as Map;
    for (final name in decoded.values) {
      guardianTypeDropdownItems.add(DropdownMenuItem(
        value: name,
        child: Text(name),
      ));
    }
    guardianTypeValue = decoded.values.first;
    setState(() {
    });
  }

  Future<void> _getResidentStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    var res = prefs.getString(GlobalConstants.ResidentStatus);
    final decoded = jsonDecode(res) as Map;
    for (final name in decoded.values) {
      _residentDropdownItems.add(DropdownMenuItem(
        value: name,
        child: Text(name),
      ));
    }
    _residentStatusValue = decoded.values.first;
    setState(() {});
  }

  Future<void> _getPropertyCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    List dataList = json.decode(prefs.getString(GlobalConstants.PropertyCategory));
    List<DropdownMenuItem<OptionItem>> menuItems = [];
    menuItems.add(DropdownMenuItem(
      value: OptionItem(id: '0', title:'Select Property Category'),
      child: Text('Select Property Category'),
    ));
    menuItems = List.generate(
      dataList.length, (i) => DropdownMenuItem(
        value: OptionItem(id: dataList[i]['id'], title: dataList[i]['name']),
        child: Text("${dataList[i]['name']}"),
      ),
    );
    if (!mounted) return;
    setState(() {
      _propertyDropdownItems = menuItems;
      _categoryType = menuItems.first.value;
      _propertyTypeId = _propertyDropdownItems.first.value.id;
    });
  }

  Future<void> _getPropertyClass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    List dataList = json.decode(prefs.getString(GlobalConstants.propertyclass));
    List<DropdownMenuItem<OptionItem>> menuItems = [];
    menuItems = List.generate(dataList.length, (i) => DropdownMenuItem(
        value: OptionItem(id: dataList[i]['id'], title: dataList[i]['name']),
        child: Text("${dataList[i]['name']}"),
      ),
    );
    if (!mounted) return;
    setState(() {
      _propertyClassDropdownItems = menuItems;
      _propertyClassType = menuItems.first.value;
      _propertyClassId = _propertyClassDropdownItems.first.value.id;
    });
  }

  Future<void> _getIdProofArray() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getString(GlobalConstants.IdentityProof);
    schema = prefs.getString(GlobalConstants.schema);
    final decoded = jsonDecode(res) as Map;
    decoded.forEach((k, v) {
      _idProofDropdownItems.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    _idProofDropDownValue = _idProofDropdownItems.first.value;
    _idProofDropDownValueId = _idProofDropDownValue.id;
    setState(() {});
  }

  Future<void> _getAddressProofArray() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getString(GlobalConstants.OwnershipProof);
    final decoded = jsonDecode(res) as Map;
    decoded.forEach((k, v) {
      _addressProofDropdownItems.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    _addressProofDropDownValue = _addressProofDropdownItems.first.value;
    _addressProofDropDownValueId = _addressProofDropDownValue.id;
    setState(() {});
  }

  Future<void> _getKycProofArray() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getString(GlobalConstants.KycDoc);
    schema = prefs.getString(GlobalConstants.schema);
    final decoded = jsonDecode(res) as Map;
    decoded.forEach((k, v) {
      _kycProofDropdownItems.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    _kycProofDropDownValue = _kycProofDropdownItems.first.value;
    _kycProofDropDownValueId = _kycProofDropDownValue.id;
    log("NOC_kycProofDropDownValueId$_kycProofDropDownValueId");
    setState(() {});
  }

  Future<void> _getBank() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = prefs.getString(GlobalConstants.AllBanks);
    log("getBankGetBank---> ${prefs.getString(GlobalConstants.AllBanks)}");
    final decoded = (jsonDecode(response) as List<dynamic>).cast<String>();
    setState(() {
      _bankDropdownItems = decoded;
    });
  }

  Future<void> _getBank2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = prefs.getString(GlobalConstants.AllBanks);
    log("getBankGetBank2--> ${prefs.getString(GlobalConstants.AllBanks)}");
    final decoded = (jsonDecode(response) as List<dynamic>).cast<String>();
    setState(() {
      _bankDropdownItems2 = decoded;
    });
  }

  Future<void> _getBillingModeList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString(GlobalConstants.Ebilling);
    schema = prefs.getString(GlobalConstants.schema);
    log("Ebilling --> $response");
    final decoded = jsonDecode(response) as Map;
    decoded.forEach((k, v) {
      _billingModeList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    setState(() {
      __billingModeValue = _billingModeList.first.value;
      __billingModeValueId = __billingModeValue.id;
    });
  }

  Future<void> _getAcceptConversionPolicyList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString(GlobalConstants.ConversionPolicy);
    schema = prefs.getString(GlobalConstants.schema);
    final decoded = jsonDecode(response) as Map;
    decoded.forEach((k, v) {
      _acceptConversionPolicyList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    __acceptConversionPolicyValue = _acceptConversionPolicyList.first.value;
    __acceptConversionPolicyValueId = __acceptConversionPolicyValue.id;
    setState(() {});
  }

  Future<void> _getAcceptExtraFittingCostList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString(GlobalConstants.ExtraFittingCost);
    schema = prefs.getString(GlobalConstants.schema);
    final decoded = jsonDecode(response) as Map;
    decoded.forEach((k, v) {
      _acceptExtraFittingCostList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    __acceptExtraFittingCostValue = _acceptExtraFittingCostList.first.value;
    __acceptExtraFittingCostValueId = __acceptExtraFittingCostValue.id;
    setState(() {});
  }

  Future<void> _getMdeOfDeposite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString(GlobalConstants.MdeOfDeposite);
    schema = prefs.getString(GlobalConstants.schema);
    final decoded = jsonDecode(response) as Map;
    decoded.forEach((k, v) {
      dropListModeOfDepositList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    __modeDepositValue = dropListModeOfDepositList.first.value;
    _modeOfDeposit = __modeDepositValue.id;

    setState(() {
      if (_modeOfDeposit == '1') {
        isDepositCheq = true;
        checkONLine=true;
      }
      if (_modeOfDeposit == '2') {
        isDepositCheq = false;
        setState(() {
          checkONLine=false;
          chqNOController.clear();
          mICRCodeController.text = "";
          bankAccNoController.text="";
          mICRCodeController.clear();
          initDepDateController.clear();
          chqDateController.text="";
        });
      }
    });

  }

  Future<void> _getInitialDepositeStatusList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString(GlobalConstants.DepositeStatus);
    schema = prefs.getString(GlobalConstants.schema);
    log("_getInitialDepositeStatusList$response");
    final decoded = jsonDecode(response) as Map;
    decoded.forEach((k, v) {
      dropListDepositStatusList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    setState(() {
      __depositStatusValue = dropListDepositStatusList.first.value;
      _depositStatusId = __depositStatusValue.id;
    });
  }

  Future<void> _getAllDepositScheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString(GlobalConstants.SchemeType);
    List dataList = json.decode(response);
    List<DropdownMenuItem<DepositItem>> menuItems = [];
    List<DropdownMenuItem<DepositItem>> menuItems2 = [];
    menuItems.add(DropdownMenuItem(
      value: DepositItem(
          id: "0",
          title: "Select Deposit Type",
          firstamount: 0,
          amount: '0.0',
          schememonth: 0,
          gas_amount: 0,
          scheme_type: '',
          scheme_code: '',
          deposit_amount: '',
          equipment_deposit_amount: '',
          interest_amount: '',
          registration_gst: '',
          totalAmount: '',
          nextCycleAmount: '',
          registration_tax_name: '',
          interest_tax_amt: '',
          reg_tax: ''),
      child: Text('Select Deposit Type'),
    ));
    menuItems2 = List.generate(dataList.length, (i) => DropdownMenuItem(
      value: DepositItem(
          id: dataList[i]['deposit_types_id'],
          title: dataList[i]['deposit_name'],
          firstamount: dataList[i]['firstDepositAmount'],
          amount: dataList[i]['totalAmount'],
          schememonth: dataList[i]['scheme_month'],
          gas_amount: dataList[i]['gas_deposit_amount'],
          scheme_type: dataList[i]['scheme_type'],
          scheme_code: dataList[i]['scheme_code'],
          deposit_amount: dataList[i]['deposit_amount'],
          equipment_deposit_amount: dataList[i]['equipment_deposit_amount'],
          interest_amount: dataList[i]['interest_amount'],
          registration_gst: dataList[i]['registration_gst'],
          totalAmount: dataList[i]['totalAmount'],
          nextCycleAmount: dataList[i]['nextCycleAmount'],
          registration_tax_name: dataList[i]['registration_tax_name'],
          interest_tax_amt: dataList[i]['interest_tax_amt'],
          reg_tax: dataList[i]['reg_tax']),
      child: Text("${dataList[i]['deposit_name']}"),
    ),);
    menuItems.addAll(menuItems2);
    if (!mounted) return;
    setState(() {
      _propertyDropdownItemsDeposit = menuItems;
    });
    return;
  }

  Future<void> fetchLabels() async {
    String strUrl = GlobalConstants.getLabels;
    final response = await http.get(Uri.parse(strUrl),
    );
    var album = HpclLabals.fromJson(json.decode(response.body));
    var registration = album.deposit;
    AppStrings.mobileNoLabel = album.steps.mobile;
    AppStrings.firstNameLabel = album.steps.firstname;
    AppStrings.middleNameLabel = album.steps.middlename;
    AppStrings.lastNameLabel = album.steps.lastname;
    AppStrings.btnLabel = album.steps.button;
    AppStrings.feeChargeLabel = "fee charge";
    AppStrings.depositStatusLabel = registration.depositSta;
    AppStrings.reasonLabel = registration.reason;
    AppStrings.modeOfDepositLabel = registration.modeOfDep;
    AppStrings.depositDateLabel = registration.depositDate;
    schemeTypeLabel = registration.depositType;
    AppStrings.depositAmountControllerLabel = registration.depositAmt;
    AppStrings.chqNoLabel = registration.chqNum;
    AppStrings.chqBankLabel = registration.chqBank;
    AppStrings.accountNoLabel = registration.bankAcc;
    AppStrings.chqPhotoLabel = registration.chqPhoto;
    AppStrings.formStatusLabel = registration.payStatus;
    if (!mounted) return;

  }
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      connectionStatus = result;
    });
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Your are connected to ${isWifiConnected ? "WIFI" : "MOBILE DATA"}"),
              Text(isWifiConnected ? "$wifiBSSID" : "Not Wifi"),
              Text("$wifiIP"),
              Text("$wifiName")
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(context, PhotoController photoController) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getProfilePhoto();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageGallery(photoController,);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  void _showPicker2(context, PhotoController photoController) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getProfilePhoto2();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageGallery2(photoController,);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPicker3(context, PhotoController photoController) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getProfilePhoto3();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageGallery3(photoController,);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPicker4(context, PhotoController photoController) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getProfilePhoto4();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageGallery4(photoController);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPicker5(context, PhotoController photoController) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getProfilePhoto5();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageGallery5(photoController,);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  void _showPicker6(context, PhotoController photoController) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getProfilePhoto6();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageGallery6(photoController,);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  void _showPicker7(context, PhotoController photoController) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getProfilePhoto7();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageGallery7(photoController,);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  void _showPicker8(context, PhotoController photoController) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        //_imgFromGallery();
                        //_imgFromGallery();
                        getProfilePhoto8();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageGallery8(photoController);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  void _showPicker9(context, PhotoController photoController) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        //_imgFromGallery();
                        //_imgFromGallery();
                        getProfilePhoto9();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      //_imgFromCamera();
                      getImageGallery9(photoController);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getProfilePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxHeight: 1000,maxWidth: 1000,  imageQuality: 100);
    final pickedImageFile = File(pickedFile.path);
    setState(() {
      AppStrings.frontImage = pickedImageFile;
    });
  }
  getImageGallery(PhotoController controller,) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1000, maxWidth: 1000,imageQuality: 100);
      final pickedImageFile = File(pickedFile.path);
      setState(() {
        AppStrings.frontImage = pickedImageFile;
        log("pickedImageFile-->" +AppStrings.frontImage.toString());
      });
    }catch(e){
      log(e);
    }
  }

  Future getProfilePhoto2() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
    final pickedImageFile = File(pickedFile.path);
    setState(() {
      AppStrings.backImage = pickedImageFile;
    });
  }
  getImageGallery2(PhotoController controller) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
      final pickedImageFile = File(pickedFile.path);
      setState(() {
        AppStrings.backImage = pickedImageFile;
        log("pickedImageFile2-->" +AppStrings.backImage.toString());
      });
    } catch(e){
      log(e);
    }
  }

  Future getProfilePhoto3() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
    final pickedImageFile = File(pickedFile.path);
    setState(() {
      AppStrings.profileImage3 = pickedImageFile;
    });
  }
  getImageGallery3(PhotoController controller) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);

    final pickedImageFile = File(pickedFile.path);
    setState(() {
      AppStrings.profileImage3 = pickedImageFile;
      log("pickedImageFile3-->" + AppStrings.profileImage3.toString());
    });
  }

  Future getProfilePhoto4() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxHeight: 1000, maxWidth: 1000,imageQuality: 100);
    final pickedImageFile = File(pickedFile.path);
    setState(() {
      AppStrings.electricBillBackImg = pickedImageFile;
    });
  }
  getImageGallery4(PhotoController controller,) async {
    try  {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera, maxWidth: 1000, imageQuality: 100);
      final pickedImageFile = File(pickedFile.path);
      setState(() {
        AppStrings.electricBillBackImg = pickedImageFile;
      });
    } catch(e){
      log(e.toString());
    }
  }

  Future getProfilePhoto5() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
    var asd = File(pickedFile.path);
    final bytes = asd.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;
    if(mb>1){
      EasyLoading.showError("PICK IMAGE \nSHOULD BE LESS THEN 1MB");
    } else{
      setState(() {
        if (pickedFile != null) {
          AppStrings.profileImage5 = File(pickedFile.path);
        } else {
          log('No image selected.');
        }
      });
    }
  }
  getImageGallery5(PhotoController controller) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
      final pickedImageFile = File(pickedFile.path);
      setState(() {
        AppStrings.profileImage5 = pickedImageFile;
        log("pickedImageFile5-->" +AppStrings.profileImage5.toString());
      });
    }catch(e){
      log(e);
    }
  }

  Future getProfilePhoto6() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
    var asd = File(pickedFile.path);
    final bytes = asd.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;
    log("mbmbmb$mb");
    if(mb>1){
      EasyLoading.showError("PICK IMAGE \nSHOULD BE LESS THEN 1MB");
    } else {
      setState(() {
        if (pickedFile != null) {
          AppStrings.profileImage6 = File(pickedFile.path);
        } else {
          log('No image selected.');
        }
      });
    }
  }
  getImageGallery6(PhotoController controller,) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);

      final pickedImageFile = File(pickedFile.path);
      setState(() {
        AppStrings.profileImage6 = pickedImageFile;
        log("pickedImageFile6-->" +AppStrings.profileImage6.toString());
      });
    }catch(e){
      log(e);
    }
  }

  Future getProfilePhoto7() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
    var asd = File(pickedFile.path);
    final bytes = asd.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;
    log("mbmbmb$mb");
    if(mb>1){
      EasyLoading.showError("PICK IMAGE \nSHOULD BE LESS THEN 1MB");
    } else {
      setState(() {
        if (pickedFile != null) {
          AppStrings.profileImage7 = File(pickedFile.path);
        } else {
          log('No image selected.');
        }
      });
    }
  }
  getImageGallery7(PhotoController controller) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
      final pickedImageFile = File(pickedFile.path);
      setState(() {
        AppStrings.profileImage7 = pickedImageFile;
        log("pickedImageFile7-->" +AppStrings.profileImage7.toString());
      });
    } catch(e){
      log(e);
    }
  }

  Future getProfilePhoto8() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, maxHeight: 1000, maxWidth: 1000,imageQuality: 100);
    var asd = File(pickedFile.path);
    final bytes = asd.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;
    log("mbmbmb$mb");
    if(mb>1) {
      EasyLoading.showError("PICK IMAGE \nSHOULD BE LESS THEN 1MB");
    } else{
      setState(() {
        if (pickedFile != null) {
          AppStrings.profileImage8 = File(pickedFile.path);
        } else {
          log('No image selected.');
        }
      });
    }
  }
  getImageGallery8(PhotoController controller,) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1000, maxWidth: 1000,imageQuality: 100);
      final pickedImageFile = File(pickedFile.path);
      setState(() {
        AppStrings.profileImage8 = pickedImageFile;
        log("pickedImageFile8-->" +AppStrings.profileImage8.toString());
      });
    }catch(e){
      log(e);
    }
  }

  Future getProfilePhoto9() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
      final pickedImageFile = File(pickedFile.path);
      setState(() {
        AppStrings.profileImage9 = pickedImageFile;
        log("pickedImageFile9-->" +AppStrings.profileImage9.toString());
      });
    } catch(e){
      log(e.toString());
    }
  }

  getImageGallery9(PhotoController controller,) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1000,maxWidth: 1000,imageQuality: 100);
      final pickedImageFile = File(pickedFile.path);
      setState(() {
        AppStrings.profileImage9 = pickedImageFile;
        log("pickedImageFile9-->" +AppStrings.profileImage9.toString());
      });
    } catch(e){
      log(e.toString());
    }
  }


}

class PhotoController {
  File imagePath;
  String imageString = '';
}

