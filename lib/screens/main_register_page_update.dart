import 'package:flutter/material.dart';
import 'package:hpcl_app/HiveDataStore/customer_reg_data_store.dart';
import 'package:hpcl_app/models/save_customer_registration_offline_model.dart';
import 'package:hpcl_app/utils/common_widgets/photo_controller.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../ExportFile/export_file.dart';
import '../utils/common_widgets/custom_app_bar.dart';
import '../utils/common_widgets/open_image_source.dart';

class MainRegisterPageUpdate extends StatefulWidget {
  bool isUpdate;
  int position=-1;
  SaveCustomerRegistrationOfflineModel studentModel = null;
  MainRegisterPageUpdate({this.isUpdate,this.position, this.studentModel});

  @override
  State<StatefulWidget> createState() {
    return MainRegisterPageUpdateState();
  }

}

class MainRegisterPageUpdateState extends BaseState<MainRegisterPageUpdate> {
  Customer editedCustomer;
  Position position;
  int gasDepositAmountController,
      depositTotalAmount = 0,
      _schemeMonth = 0;

  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool isWifiConnected = false;
  bool isInternetOn = true;

  List<String> _bankDropdownItems = ([]);
  String _bankValue;

  List data = [];

  List<String> _bankDropdownItems2 = ([]);
  String _bankValue2;
  List data2 = [];

  //Area
  List<DropdownMenuItem<OptionItem>> areaItems = [];
  OptionItem areaTypeValue = OptionItem(id: "", title: "");

  //Charge Area
  List<DropdownMenuItem<OptionItem>> chargeAreaItems = [];
  OptionItem chargeAreaType = OptionItem(id: "", title: "");

  //getAllDistrict
  List<DropdownMenuItem<OptionItem>> getAllDistrictItems = [];
  OptionItem districtValue = OptionItem(id: "", title: "");

  List<DropdownMenuItem<OptionItem>> dropListModelInterested = [];
  OptionItem _isInterestedItem = OptionItem(id: "", title: "");
  String _isInterestedId = '';
  String schemeTypeLabel = '';

  Box<SaveCustomerRegistrationOfflineModel> customerRegistrationBox;
  List<SaveCustomerRegistrationOfflineModel> customerRegistrationList;

  bool error = false;
  String dateAndTime = '';
  bool fDepositeSiteCheck = false;
  bool fDepositeDate = false;

  PhotoController frontImageController = PhotoController();
  PhotoController backImageController = PhotoController();
  PhotoController eleBillFrontImgController = PhotoController();
  PhotoController eleBillBackImgController = PhotoController();
  PhotoController nocFrontImgController = PhotoController();
  PhotoController nocBackImgController = PhotoController();
  PhotoController consentImageController = PhotoController();
  PhotoController cancelChqImageController = PhotoController();
  PhotoController chqImgController = PhotoController();
  var frontImageFile = "",
      backImageFile = "",
      electricBillFrontImgFile = "",
      electricBillBackImgFile = "",
      nocFrontImgFile = "",
      nocBackImgFile = "",
      consentPhotoFile = "",
      chqCancelledPhotoFile = "",
      chqPhotoFile = "";


  void removeSpace(TextEditingController controller) {
    if (controller.text.trim() == "") {
      setState(() => controller.text = "");
    }
    print("controller==>" + controller.text);
  }

  String schemeId = '0';
  List<ChargeAreaModel> listChargeArea;

  var checkDepositeDate;
  var checkONLine = true;
  String selectedDropDownValue = "";
  ServerApi serverApi;


  @override
  void initState() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    getLocalData();
    serverApi = ServerApi();
    firstNameController.addListener(() => removeSpace(firstNameController));
    middleNameController.addListener(() => removeSpace(middleNameController));
    lastNameController.addListener(() => removeSpace(lastNameController));
    guardianNameController.addListener(() => removeSpace(guardianNameController));
    reasonController.addListener(() => removeSpace(reasonController));
    emailIdController.addListener(() => removeSpace(emailIdController));
    localityController.addListener(() => removeSpace(localityController));
    streetNameController.addListener(() => removeSpace(streetNameController));
    townController.addListener(() => removeSpace(townController));
    landmarkController.addListener(() => removeSpace(landmarkController));
    IFSCController.addListener(() => removeSpace(IFSCController));
    bank_address.addListener(() => removeSpace(bank_address));
    longitudeController.addListener(() => removeSpace(longitudeController));
    latitudeController.addListener(() => removeSpace(latitudeController));
    ownershipController.addListener(() => removeSpace(ownershipController));
    nocProofNoController.addListener(() => removeSpace(nocProofNoController));
    reasonNoController.addListener(() => removeSpace(reasonNoController));
    mICRCodeController.addListener(() => removeSpace(mICRCodeController));
    initDepDateController.addListener(() => removeSpace(initDepDateController));
    super.initState();
  }

  final SaveCusRegHiveDataStore dataStore = SaveCusRegHiveDataStore();
  ValueNotifier<bool> isUpdate = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context) {
    if (widget.isUpdate == true) {
      mobileNoController.text = widget.studentModel.mobileNumber;
      firstNameController.text = widget.studentModel.firstName;
      middleNameController.text = widget.studentModel.middleName;
      lastNameController.text = widget.studentModel.lastName;
      guardianNameController.text = widget.studentModel.guardianName;
      reasonController.text = widget.studentModel.residentStatus;
      emailIdController.text = widget.studentModel.emailId;
      localityController.text = widget.studentModel.locality;
      streetNameController.text = widget.studentModel.locality;
      townController.text = widget.studentModel.town;
      houseNumberController.text = widget.studentModel.houseNumber;
      pinCodeController.text = widget.studentModel.pinCode;
      kitchenController.text = widget.studentModel.noOfKitchen;
      bathroomController.text = widget.studentModel.noOfBathroom;
      familyMemController.text = widget.studentModel.noOfFamilyMembers;
      landmarkController.text = widget.studentModel.reasonForHold;
      longitudeController.text = widget.studentModel.longitude;
      latitudeController.text = widget.studentModel.latitude;
      idProofNoController.text = widget.studentModel.kycDocument1Number;
      ownershipController.text = widget.studentModel.kycDocument2Number;
      nocProofNoController.text = widget.studentModel.kycDocument3Number;
      reasonNoController.text = widget.studentModel.remarks;
      depositAmountController.text = widget.studentModel.depositeType;
      chqNOController.text = widget.studentModel.chequeNumber;
      bankAccNoController.text = widget.studentModel.chequeBankAccount;
      mICRCodeController.text = widget.studentModel.micr;
      chqDateController.text = widget.studentModel.chequeNumber;
      initDepDateController.text = widget.studentModel.initialDepositeDate;
      customerAccountNum.text = widget.studentModel.bankAccountNumber;
      IFSCController.text = widget.studentModel.bankIfscCode;
      bank_address.text = widget.studentModel.bankAddress;
      _isInterestedId = widget.studentModel.interested;
      // _mdpeValue == 'Yes' ? '1' : '0' = widget.studentModel.societyAllowedMdpe;
      _residentStatusValue = widget.studentModel.residentStatus;
      cookInFuelValue = widget.studentModel.existingCookingFuel;
      frontImageFile = widget.studentModel.backSide1;
      electricBillBackImgFile = widget.studentModel.backSide2;
      nocBackImgFile = widget.studentModel.backSide3;
      frontImageFile = widget.studentModel.documentUploads1;
      electricBillFrontImgFile = widget.studentModel.documentUploads2;
      nocFrontImgFile = widget.studentModel.documentUploads3;
      consentPhotoFile = widget.studentModel.customerConsent;
      chqCancelledPhotoFile = widget.studentModel.canceledCheque;
      chqPhotoFile = widget.studentModel.chequePhoto;
      //  uploadHousePhoto = widget.studentModel.uploadHousePhoto,
      //   ownerConsent = widget.studentModel.ownerConsent,
      //   reasonForHold = widget.studentModel.reasonForHold,
      _bankValue = widget.studentModel.nameOfBank;
      _bankValue2 = widget.studentModel.payementBankName;
      schema = widget.studentModel.schema;
      dmaUserName = widget.studentModel.dmaUserName;
      dmaId = widget.studentModel.dmaUserId;
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => RegistrationForm()));
              },
            ),
            titleAppBar: "Customer Input",
            actions: [],
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
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }


  TextEditingController mobileNoController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
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

  OptionItem categoryValue = OptionItem(id: "", title: "");
  OptionItem depositStatusValue = OptionItem(id: "", title: "");
  OptionItem __modeDepositValue = OptionItem(id: "", title: "");
  DepositItem _depositCategoryType;



  List<DropdownMenuItem<OptionItem>> dropListDepositStatusList = ([]);
  List<DropdownMenuItem<OptionItem>> modeOfDepositList = ([]);
  List<DropdownMenuItem<OptionItem>> dropListChoiceStatusList = ([]);
  List<DropdownMenuItem<OptionItem>> propertyCategoryList = [];
  List<DropdownMenuItem<DepositItem>> _propertyDropdownItemsDeposit = [];
  List<DropdownMenuItem<OptionItem>> idProofList = [];
  List<DropdownMenuItem<OptionItem>> _addressProofDropdownItems = [];
  List<DropdownMenuItem<OptionItem>> _kycProofDropdownItems = ([]);
  List<DropdownMenuItem<String>> _cookingFuelDropdownItems = ([]);
  List<DropdownMenuItem<OptionItem>> propertyClassList = [];
  List<DropdownMenuItem<String>> guardianTypeDropdownItems = ([]);

  String _depositStatusId = '';
  String _modeOfDeposit = '';

  bool isDepositCheq = true;


  OptionItem idProofValue = OptionItem(id: "", title: "");
  OptionItem _addressProofDropDownValue = OptionItem(id: "", title: "");
  String _addressProofDropDownValueId = "";

  OptionItem _kycProofDropDownValue = OptionItem(id: "", title: "");
 // String _kycProofDropDownValueId = "";

  DropListModel dropListModelarea = DropListModel([
    OptionItem(id: "1", title: "A"),
    OptionItem(id: "2", title: "B"),
    OptionItem(id: "3", title: "C"),
    OptionItem(id: "4", title: "D"),
  ]);


  String cookInFuelValue;


  OptionItem propertyClassValue;


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
  String dmaId = "";
  String dmaUserName = "";
  String schema = "";
  SharedPreferences prefs;

  getLocalData() async {
    prefs = await SharedPreferences.getInstance();
    schema = prefs.getString(GlobalConstants.schema);
    dmaId = prefs.getString(GlobalConstants.id);
    dmaUserName = prefs.getString(GlobalConstants.name);
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
  }

  PhotoController consentPhoto = PhotoController();
  PhotoController chequePhoto = PhotoController();

  List<DropdownMenuItem<OptionItem>> billingModeList = [];
  OptionItem billingModeValue = OptionItem(id: "", title: "");

  List<DropdownMenuItem<OptionItem>> _acceptConversionPolicyList = [];
  OptionItem __acceptConversionPolicyValue = OptionItem(id: "", title: "");

  List<DropdownMenuItem<OptionItem>> _acceptExtraFittingCostList = [];
  OptionItem acceptExtraFittingCostValue =  OptionItem(id: "", title: "");

  List<ImageSource> values = [];
  DateTime currentDate = DateTime.now();
  String userId = "";
  String depositSum = "";
  final formGlobalKey = GlobalKey<FormState>();


  _buildLayout() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: formGlobalKey,
        child: Column(
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
            _apartmentWidget(),
            _streetNameWidget(),
            _townWidget(),
            _districtWidget(),
            _pinCodeWidget(),
            _isInterestedId == '1'
                ? _residentStatusDropdownWidget()
                : Container(),
            _isInterestedId == '1' ? _noKitchenWidget() : Container(),
            _isInterestedId == '1' ? _noBathroomWidget() : Container(),
            _isInterestedId == '1' ? _fuelDropdownWidget() : Container(),
            _isInterestedId == '1' ? _noFamilyWidget() : Container(),
            _locationWidget(),
            _isInterestedId == '1' ? _landmarkWidget() : Container(),
            _buildCardWidget(text: AppStrings.identificationProofLabel),
            _docTypeDropDown(),
            _idProofNoWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _frontImageWidget(),
                _backImageWidget()
              ],
            ),
            _buildCardWidget(text: AppStrings.ownershipProofHeading),
            getDropDown2(),
            _ownerProofNoWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _electricBillFrontImgWidget(),
                _electricBillBackImgWidget(),
              ],
            ),
            _buildCardWidget(text: AppStrings.nocLabel),
            getDropDown3(),
            _nocProofNoWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _nocFrontImageWidget(),
                _nocBackImageWidget(),
              ],
            ),
            _buildCardWidget(text: AppStrings.customerConsentLabel),
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
            Text("=============================================="),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 12, right: 15),
                  child: Text(AppStrings.securityDepositLabel),
                ),
                Flexible(child: _depositStatusDropDown())
              ],
            ),
            _depositStatusId != "1"
                ? _reasonDepositStatusWidget()
                : Container(),
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
              child: widget.isUpdate == false ? Text("Preview") : Text("Update"),
              onPressed: () async {
                var textFieldValidationCheck = CustomerFormHelper
                    .textFieldValidationCheck(
                  titleLocation: latitudeController.text.trim().toString(),
                  acceptConversionPolicyValueId: __acceptConversionPolicyValue.title,
                  acceptExtraFittingCostValueId: acceptExtraFittingCostValue.title,
                  chargeAreaType: chargeAreaType.title,
                  areaTypeId: areaTypeValue.title,
                  mobileNoController: mobileNoController.text.toString(),
                  firstNameController: firstNameController.text.toString(),
                  lastNameController: lastNameController.text.toString(),
                  guardianNameController: guardianNameController.text
                      .toString(),
                  propertyTypeId: categoryValue.title,
                  propertyClassId: propertyClassValue.title,
                  houseNumberController: houseNumberController.text.toString(),
                  localityController: localityController.text.toString(),
                  streetNameController: streetNameController.text.toString(),
                  district: districtValue.id,
                  pinCodeController: pinCodeController.text.toString(),
                  noOfKitchen: kitchenController.text.toString(),
                  noOfBathroom: bathroomController.text.toString(),
                  cookInFuelValue: cookInFuelValue,
                  noOfFamilyMembers: familyMemController.text.toString(),
                  addressProofNo: idProofValue.title,
                  idProofNo: idProofNoController.text.toString(),
                  idFrontImage: frontImageFile,
                  idBackImage: backImageFile,
                  consentImage: consentPhotoFile,
                  customerBankName: _bankValue,
                  customerAccNo: customerAccountNum.text.trim().toString(),
                  customerIfscCode: IFSCController.text.trim().toString(),
                  customerBankAdd: bank_address.text.trim().toString(),
                  modeOfDeposit: _modeOfDeposit,
                  chequeNo: _modeOfDeposit == "1" ? chqNOController.text.trim()
                      .toString() : "",
                  chequeDate: _modeOfDeposit == "1" ? initDepDateController.text
                      .trim().toString() : "",
                  bankName: _bankValue2,
                  bankAccNo: bankAccNoController.text.trim().toString(),
                  depositAmount: AppStrings.depositAmount,
                  micrCode: _modeOfDeposit == "1" ? mICRCodeController.text
                      .trim().toString() : "",
                  chequePhoto: _modeOfDeposit == "1"
                      ? chqPhotoFile
                      : null,
                  mdpeValue: _mdpeValue,
                  residentStatusValue: _residentStatusValue,
                );
                if (textFieldValidationCheck == true) {
                  _showDialog(context: context, index: 0);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _showDialog({BuildContext context, int index}) {
    return showDialog(
        context: context, builder: (context,) {
      return Container(
        color: Colors.white,
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
                trailing: chargeAreaType.title ?? "-",
              ),
              _buildRow(
                leading: AppStrings.areaLabel,
                trailing: areaTypeValue.title ?? "-",
              ),
              _buildRow(
                leading: AppStrings.mobileNoLabel,
                trailing: mobileNoController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.firstNameLabel,
                trailing: firstNameController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.middleNameLabel,
                trailing: middleNameController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.lastNameLabel,
                trailing: lastNameController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.guardianTypeLabel,
                trailing: guardianTypeValue ?? "-",
              ),
              _buildRow(
                leading: AppStrings.guardianNameLabel,
                trailing: guardianNameController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.emailAddressLabel,
                trailing: emailIdController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.propertyCategoryLabel,
                trailing: categoryValue.title ?? "-",
              ),
              _buildRow(
                leading: AppStrings.propertyClassLabel,
                trailing: propertyClassValue.title ?? "-",
              ),
              _buildRow(
                leading: AppStrings.houseNumberLabel,
                trailing: houseNumberController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.apartmentLabel,
                trailing: localityController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.streetNameLabel,
                trailing: streetNameController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.townLabel,
                trailing: townController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.pinCodeLabel,
                trailing: pinCodeController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.districtLabel,
                trailing: districtValue.title ?? "-",
              ),
              _buildRow(
                leading: AppStrings.mdpeAllowLabel,
                trailing: _mdpeValue ?? "-",
              ),
              _buildRow(
                leading: AppStrings.residentStatusLabel,
                trailing: _residentStatusValue ?? "-",
              ),
              _buildRow(
                leading: AppStrings.noOfKitchenLabel,
                trailing: kitchenController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.noOfBathroomLabel,
                trailing: bathroomController.text.toString() ?? "-",
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
                leading: AppStrings.identificationProofLabel,
                trailing: idProofValue.title ?? "-",
              ),
              _buildRow(
                leading: AppStrings.idProofNo,
                trailing: idProofNoController.text.toString() ?? "-",
              ),
              _buildRow(
                leading: AppStrings.billingModeLabel,
                trailing: billingModeValue.title.toString() ?? "-",
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
                trailing: acceptExtraFittingCostValue.title ?? "-",
              ),
              _buildRow(
                leading: AppStrings.depositStatusLabel,
                trailing: depositStatusValue.title ?? "-",
              ),
              _buildRow(
                leading: AppStrings.modeOfDepositLabel,
                trailing: __modeDepositValue.title ?? "-",
              ),
              _buildRow(
                leading: AppStrings.depositTypeLabel,
                trailing: AppStrings.depositName.toString() ?? "-",
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
                      trailing: mICRCodeController.text.toString() ?? "-",
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
                        frontImageFile == null && frontImageFile.isEmpty
                            ? InkWell(
                            onTap: () => _openFrontImageSource(
                                controller: frontImageController,
                                context: context),
                            child: _localBorderImg())
                            : ImageCircle(
                          fileImage1: File(frontImageFile),
                          pathImage: frontImageFile,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        _imageNameWidget(imageName: AppStrings.idBackImgSide),
                        backImageFile == null && backImageFile.isEmpty
                            ? InkWell(
                            onTap: () => _openBackImageSource(
                                controller: backImageController,
                                context: context),
                            child: _localBorderImg())
                            : ImageCircle(
                          fileImage1: File(backImageFile),
                          pathImage: backImageFile,
                        ),
                      ],
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
                        _imageNameWidget(imageName: AppStrings
                            .electricBillFrontImgLabel),
                        electricBillFrontImgFile == null && electricBillFrontImgFile.isEmpty
                            ? InkWell(
                            onTap: () => _openEleBillFrontSource(
                                controller: eleBillFrontImgController,
                                context: context),
                            child: _localBorderImg())
                            : ImageCircle(
                          fileImage1: File(electricBillFrontImgFile),
                          pathImage: electricBillFrontImgFile,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        _imageNameWidget(imageName: AppStrings
                            .electricBillBackImgLabel),
                        electricBillBackImgFile == null && electricBillBackImgFile.isEmpty
                            ? InkWell(
                            onTap: () => _openEleBackSource(
                                controller: eleBillBackImgController,
                                context: context),
                            child: _localBorderImg())
                            : ImageCircle(
                          fileImage1: File(electricBillBackImgFile),
                          pathImage: electricBillBackImgFile,
                        ),
                      ],
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
                        _imageNameWidget(imageName: AppStrings
                            .nocFrontImgLabel),
                        nocFrontImgFile == null && nocFrontImgFile.isEmpty
                            ? InkWell(
                            onTap: () => _openNocFrontImgSource(
                                controller: nocFrontImgController,
                                context: context),
                            child: _localBorderImg())
                            : ImageCircle(
                          fileImage1: File(nocFrontImgFile),
                          pathImage: nocFrontImgFile,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        _imageNameWidget(imageName: AppStrings.nocBackImgLabel),
                        nocBackImgFile == null && nocBackImgFile.isEmpty
                            ? InkWell(
                            onTap: () => _openNocBackImgSource(
                                controller: nocBackImgController,
                                context: context),
                            child: _localBorderImg())
                            : ImageCircle(
                          fileImage1:File(nocBackImgFile),
                          pathImage: nocBackImgFile,
                        ),
                      ],
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
                        _imageNameWidget(imageName: AppStrings
                            .consentPhotoLabel),
                        consentPhotoFile == null && consentPhotoFile.isEmpty
                            ? InkWell(
                            onTap: () => _openConsentImgSource(
                                controller: consentImageController,
                                context: context),
                            child: _localBorderImg())
                            : ImageCircle(
                          fileImage1: File(consentPhotoFile),
                          pathImage: consentPhotoFile,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        _imageNameWidget(imageName: AppStrings
                            .chqCancelledPhotoLabel),
                        chqCancelledPhotoFile == null && chqCancelledPhotoFile.isEmpty
                            ? InkWell(
                            onTap: () => _openChqCancelledImgSource(
                                controller: cancelChqImageController,
                                context: context),
                            child: _localBorderImg())
                            : ImageCircle(
                            fileImage1: File(chqCancelledPhotoFile),
                            pathImage: chqCancelledPhotoFile
                        ),
                      ],
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
                        _imageNameWidget(imageName: AppStrings.chqPhotoLabel),
                        chqPhotoFile == null && chqPhotoFile.isEmpty
                            ? InkWell(
                            onTap: () => _openChqImgSource(
                                controller: chqImgController,
                                context: context),
                            child: _localBorderImg())
                            : ImageCircle(
                          fileImage1: File(chqPhotoFile),
                          pathImage:chqPhotoFile,
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
                    onPressed: ()  {
                       storeRecords();
                    },
                    child: Text("SAVE ", style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    child: Text("EDIT", style: TextStyle(fontSize: 20),
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

  void  storeRecords() {
    SaveCustomerRegistrationOfflineModel data = SaveCustomerRegistrationOfflineModel(
      interested: _isInterestedId,
      areaId: areaTypeValue.id,
      chargeArea: chargeAreaType.id,
      mobileNumber: mobileNoController.text.toString(),
      firstName: firstNameController.text.toString(),
      middleName: middleNameController.text.toString(),
      lastName: lastNameController.text,
      guardianType: guardianTypeValue,
      guardianName: guardianNameController.text.toString(),
      emailId: emailIdController.text.toString(),
      propertyCategoryId: categoryValue.id,
      propertyClassId: propertyClassValue.id,
      houseNumber: houseNumberController.text.toString(),
      locality: localityController.text.toString(),
      //   crLocality:streetNameController.text.toString(),
      town: townController.text.toString(),
      pinCode: pinCodeController.text.toString(),
      districtId: districtValue.id,
      societyAllowedMdpe: _mdpeValue == 'Yes' ? '1' : '0',
      residentStatus: _residentStatusValue,
      noOfKitchen: kitchenController.text.toString(),
      noOfBathroom: bathroomController.text,
      existingCookingFuel: cookInFuelValue,
      noOfFamilyMembers: familyMemController.text.toString(),
      latitude: latitudeController.text.toString(),
      longitude: longitudeController.text.toString(),
      remarks: landmarkController.text.toString(),
      kycDocument1: idProofValue.id,
      kycDocument1Number: idProofNoController.text.toString(),
      backSide1: backImageFile,
      backSide2: electricBillBackImgFile,
      backSide3: nocBackImgFile,
      documentUploads1: frontImageFile,
      documentUploads2: electricBillFrontImgFile,
      documentUploads3: nocFrontImgFile,
      customerConsent: consentPhotoFile,
      canceledCheque: chqCancelledPhotoFile,
      chequePhoto: chqPhotoFile,
      uploadCustomerPhoto: "",
      uploadHousePhoto: "",
      ownerConsent: "",
      reasonForHold: "",
      kycDocument3: _kycProofDropDownValue.id,
      kycDocument3Number: nocProofNoController.text.toString(),
      kycDocument2: _addressProofDropDownValueId,
      kycDocument2Number: ownershipController.text.toString(),
      //   cusBillingMode:__billingModeValueId,
      bankAccountNumber: customerAccountNum.text,
      bankIfscCode: IFSCController.text.toString(),
      bankAddress: bank_address.text.toString(),
      acceptConversionPolicy: __acceptConversionPolicyValue.id,
      acceptExtraFittingCost: acceptExtraFittingCostValue.id,
      initialDepositeStatus: _depositStatusId.toString(),
      modeOfDeposite: _modeOfDeposit,
      depositeType: schemeId,
      initialAmount: depositAmountController.text.toString(),
      chequeNumber: chqNOController.text.toString(),
      initialDepositeDate: initDepDateController.text.toString(),
      nameOfBank: _bankValue == null ? '' : _bankValue,
      payementBankName: _bankValue2 == null ? "" : _bankValue2,
      chequeBankAccount: bankAccNoController.text.toString(),
      micr: mICRCodeController.text.toString(),
      schema: schema,
      dmaUserName: dmaUserName,
      dmaUserId: dmaId,
    );
    if (isUpdate.value) {
      dataStore.updateUser(userModel: data, index: widget.position).then((value) {
        Navigator.pop(context);
      });
    } else {
      var mmm = SaveCusRegHiveDataStore.box.length;
      if (mmm <= 5) {
        dataStore.addUser(userModel: data);
      }
      else {
        EasyLoading.showError('Error !!!! \n Please Uploade Previous record');
      }
    }
    EasyLoading.showSuccess('Great Success! \n Record Save');
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForm()),);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => RegistrationForm()),
            (r) => false);
  }

  Widget _interestedDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.interestedLabel,
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

  Widget _conversionPolicyDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.conversionPolicyLabel,
      hint: AppStrings.conversionPolicyLabel,
      items: _acceptConversionPolicyList,
      value: __acceptConversionPolicyValue,
      onChanged: (value) {
        setState(() {
          __acceptConversionPolicyValue = value;
        });
      },
    );
  }

  Widget _fittingCostDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.fittingCostLabel,
      hint: AppStrings.fittingCostLabel,
      items: _acceptExtraFittingCostList,
      value: acceptExtraFittingCostValue,
      onChanged: (value) {
        setState(() {
          acceptExtraFittingCostValue = value;
        });
      },
    );
  }

  Widget _mdpeDropdown() {
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

  Widget _reasonInterestedWidget() {
    return TextFieldWidget(
      enabled: true,
      headingLabel: AppStrings.reasonLabel,
      textInputType: TextInputType.text,
      controller: reasonController,
      hintText: AppStrings.reasonLabel,
    );
  }

  Widget _chargeAreaDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.chargeAreaLabel,
      hint: AppStrings.chargeAreaLabel,
      items: chargeAreaItems,
      value: chargeAreaType,
      onChanged: (OptionItem value) {
        setState(() {
          chargeAreaType = value;
          areaItems.clear();
          areaTypeValue = null;
          fetchArea(value.id);
        });
      },
    );
  }

  Widget _areaDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.areaLabel,
      hint: AppStrings.areaLabel,
      items: areaItems,
      value: areaTypeValue,
      onChanged: (OptionItem value) {
        setState(() {
          areaTypeValue = value;
        });
      },
    );
  }

  Widget _mobileWidget() {
    return TextFieldWidget(
        headingLabel: AppStrings.mobileNoLabel,
        hintText: AppStrings.mobileNoLabel,
        controller: mobileNoController,
        textInputType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        maxLength: 10,
        suffixIcon: AppStrings.isMobile == true
            ? Icon(Icons.check_circle_sharp, color: Colors.green,)
            : Icon(Icons.info, color: Colors.red),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter Mobile Number";
          }
          else if (value.length <= 9) {
            return 'Mobile Number must be of 10 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
          setState(() =>
          v.length <= 9 ? AppStrings.isMobile = false : AppStrings.isMobile =
          true);
        }
    );
  }

  Widget _firstNameWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.firstNameLabel,
      hintText: AppStrings.firstNameLabel,
      controller: firstNameController,
      textInputType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
      ],
      suffixIcon: AppStrings.isFirst == true
          ? Icon(Icons.check_circle_sharp, color: Colors.green,)
          : Icon(Icons.info, color: Colors.red),
      validator: (value) {
        if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
          return "Enter First Name";
        } else if (value.length <= 2) {
          return "First Name must be of minimum 2+ Letters";
        }
        return null;
      },
      onChanged: (v) {
        v = firstNameController.text.trim().toString();
        formGlobalKey.currentState.validate();
        setState(() =>
        v.length <= 2 ? AppStrings.isFirst = false : AppStrings.isFirst = true);
      },
    );
  }

  Widget _middleWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.middleNameLabel,
      hintText: AppStrings.middleNameLabel,
      controller: middleNameController,
      textInputType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
    );
  }

  Widget _lastNameWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.lastNameLabel,
      hintText: AppStrings.lastNameLabel,
      controller: lastNameController,
      textInputType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
      suffixIcon: AppStrings.isLast == true
          ? Icon(Icons.check_circle_sharp, color: Colors.green,)
          : Icon(Icons.info, color: Colors.red),
      validator: (value) {
        if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
          return "Enter Last Name";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
        setState(() =>
        v.length <= 2 ? AppStrings.isLast = false : AppStrings.isLast = true);
      },
    );
  }

  Widget _guardianTypeDropDown() {
    return ReusedDropDownString(
      textLabel: AppStrings.guardianTypeLabel,
      onChanged: (String value) {
        setState(() => guardianTypeValue = value);
      },
      items: guardianTypeDropdownItems,
      value: guardianTypeValue,
      hint: 'Select Relation Type',
    );
  }

  Widget _guardianNameWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.guardianNameLabel,
      hintText: AppStrings.guardianNameLabel,
      controller: guardianNameController,
      textInputType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
      suffixIcon: AppStrings.isGuardian == true
          ? Icon(Icons.check_circle_sharp, color: Colors.green,)
          : Icon(Icons.info, color: Colors.red),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter Guardian name";
        } else if (!RegExp('.*[A-Z].*').hasMatch(value ?? '')) {
          return 'Input should contain an uppercase letter A-Z.';
        } else if (value.length <= 2) {
          return "Enter a Guardian name 2+char long";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
        setState(() =>
        v.length <= 2 ? AppStrings.isGuardian = false : AppStrings.isGuardian =
        true);
      },
    );
  }

  Widget _emailWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.emailAddressLabel,
      hintText: AppStrings.emailAddressLabel,
      controller: emailIdController,
      textCapitalization: TextCapitalization.none,
      textInputType: TextInputType.emailAddress,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-z0-9@._-]")),
      ],
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
      onChanged: (v) {
        //  formGlobalKey.currentState.validate();
      },
    );
  }

  Widget _propertyCategoryDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.propertyCategoryLabel,
      onChanged: (OptionItem value) {
        setState(() {
          categoryValue = value;
        });
      },
      items: propertyCategoryList,
      value: categoryValue,
      hint: 'Select Property Category',
    );
  }

  Widget _propertyClassDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.propertyClassLabel,
      onChanged: (OptionItem value) {
        setState(() {
          propertyClassValue = value;
        });
      },
      items: propertyClassList,
      value: propertyClassValue,
      hint: 'Select Property Class',
    );
  }

  Widget _depositAmountWidget() {
    return TextFieldWidget(
      enabled: false,
      headingLabel: AppStrings.depositAmountControllerLabel,
      hintText: AppStrings.depositAmountControllerLabel,
      controller: depositAmountController,
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: DropdownButtonFormField<DepositItem>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
                      depositAmountController.text =
                          value.firstamount.toString();
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
                    AppStrings.equipmentDepositAmount =
                        value.equipment_deposit_amount;
                    AppStrings.interestAmount = value.interest_amount;
                    AppStrings.registrationGST = value.registration_gst;
                    AppStrings.interestTaxAmt = value.interest_tax_amt;
                    AppStrings.totalAmount = value.totalAmount;
                    AppStrings.nextCycleAmount = value.nextCycleAmount;
                    AppStrings.registrationTaxName =
                        value.registration_tax_name;
                    depositTotalAmount = value.total_amount;
                    AppStrings.interestTaxAmt = value.interest_tax_amt;
                    AppStrings.regTax = value.reg_tax;
                    AppStrings.msgSchemeDetail =
                        "Deposit Name = " + AppStrings.depositName +
                            "\nDeposit Amount = " +
                            AppStrings.depositAmountController.toString() +
                            "\nSchemeMonth = " + _schemeMonth.toString() +
                            "\nEquipment Deposit Amount = " +
                            AppStrings.equipmentDepositAmount +
                            "\nGAS Amount = " +
                            gasDepositAmountController.toString() +
                            "\nFirst Deposit Amount = " +
                            value.firstamount.toString();
                  });
                },
                isExpanded: true,
                isDense: true,
              ),
            ),
            getDepositDetailButton(
                "Detail", alignment: CrossAxisAlignment.center),
          ],
        ));
  }

  getDepositDetailButton(title, {alignment}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
          crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                child: Text(title, style: TextStyle(color: Colors.white),),
                onPressed: () {
                  _showdepositAmountControllerDialog(
                      AppStrings.msgSchemeDetail);
                }),
          ]),
    );
  }

  _showdepositAmountControllerDialog(String _msg) async {
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

  Widget _houseNumberWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.houseNumberLabel,
      hintText: AppStrings.houseNumberLabel,
      controller: houseNumberController,
      textInputType: TextInputType.text,
      suffixIcon: AppStrings.isHouseNo == true
          ? Icon(Icons.check_circle_sharp, color: Colors.green,)
          : Icon(Icons.info, color: Colors.red),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter House Number";
        }
        return null;
      },
      onTap: () {},
      onChanged: (v) {
        formGlobalKey.currentState.validate();
        setState(() =>
        v.length >= 1 ? AppStrings.isHouseNo = true : AppStrings.isHouseNo =
        false);
      },
    );
  }

  Widget _apartmentWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.addressLabel,
      hintText: AppStrings.addressLabel,
      controller: localityController,
      textInputType: TextInputType.text,
      suffixIcon: AppStrings.isAddress == true
          ? Icon(Icons.check_circle_sharp, color: Colors.green,)
          : Icon(Icons.info, color: Colors.red),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter Colony/Society/Apartment";
        }
        return null;
      },
      onTap: () {},
      onChanged: (v) {
        formGlobalKey.currentState.validate();
        setState(() =>
        v.length > 1 ? AppStrings.isAddress = true : AppStrings.isAddress =
        false);
      },
    );
  }

  Widget _streetNameWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.streetNameLabel,
      hintText: AppStrings.addressLabel,
      controller: streetNameController,
      textInputType: TextInputType.text,
      suffixIcon: AppStrings.isAddress == true
          ? Icon(Icons.check_circle_sharp, color: Colors.green,)
          : Icon(Icons.info, color: Colors.red),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter street name";
        }
        return null;
      },
      onTap: () {},
      onChanged: (v) {
        formGlobalKey.currentState.validate();
        setState(() =>
        v.length > 1 ? AppStrings.isAddress = true : AppStrings.isAddress =
        false);
      },
    );
  }

  Widget _townWidget() {
    return TextFieldWidget(
        headingLabel: AppStrings.townLabel,
        hintText: AppStrings.townLabel,
        controller: townController,
        textInputType: TextInputType.name,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
        ]
    );
  }

  Widget _districtWidget() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.districtLabel,
      items: getAllDistrictItems,
      value: districtValue,
      hint: AppStrings.districtLabel,
      onChanged: (OptionItem value) {
        setState(() {
          districtValue = value;
        });
      },
    );
  }

  Widget _pinCodeWidget() {
    return TextFieldWidget(
        headingLabel: AppStrings.pinCodeLabel,
        hintText: AppStrings.pinCodeLabel,
        controller: pinCodeController,
        textInputType: TextInputType.number,
        maxLength: 6,
        suffixIcon: AppStrings.isPinCode == true
            ? Icon(Icons.check_circle_sharp, color: Colors.green,)
            : Icon(Icons.info, color: Colors.red),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter Pin Number";
          }
          else if (value.length <= 5) {
            return 'Pin Number must be of 6 digit';
          }
          return null;
        },
        onTap: () {},
        onChanged: (v) {
          formGlobalKey.currentState.validate();
          setState(() =>
          v.length <= 5 ? AppStrings.isPinCode = false : AppStrings.isPinCode =
          true);
        }
    );
  }

  Widget _noKitchenWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.noOfKitchenLabel,
      hintText: AppStrings.noOfKitchenLabel,
      controller: kitchenController,
      textInputType: TextInputType.number,
      maxLength: 2,
    );
  }

  Widget _noBathroomWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.noOfBathroomLabel,
      hintText: AppStrings.noOfBathroomLabel,
      controller: bathroomController,
      textInputType: TextInputType.number,
      maxLength: 2,
    );
  }

  Widget _noFamilyWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.noOfFamilyMembersLabel,
      hintText: AppStrings.noOfFamilyMembersLabel,
      controller: familyMemController,
      textInputType: TextInputType.number,
      maxLength: 2,
    );
  }

  Widget _locationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 8),
              child: TextButton(
                child: new Text(AppStrings.getLocationLabel),
                onPressed: () async {
                  Position position = await _getCurrentLocation();
                  //  AppStrings.locationLat ='${position.latitude} ';
                  //  AppStrings.locationLong = '${position.longitude}';
                  latitudeController.text =
                      position.latitude.toStringAsFixed(3);
                  longitudeController.text =
                      position.longitude.toStringAsFixed(3);
                },
              ),
            ),
          ),
        ),
        Flexible(
            child: TextFieldWidget(
              enabled: false,
              headingLabel: AppStrings.locationLat,
              hintText: AppStrings.locationLat,
              controller: latitudeController,
            )
        ),
        Flexible(
          child: TextFieldWidget(
            enabled: false,
            headingLabel: AppStrings.locationLong,
            hintText: AppStrings.locationLong,
            controller: longitudeController,
          ),
        ),
      ],
    );
  }

  Widget _landmarkWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.landmarkLabel,
      hintText: AppStrings.landmarkLabel,
      controller: landmarkController,
      textInputType: TextInputType.text,
    );
  }

  Widget _fuelDropdownWidget() {
    return ReusedDropDownString(
      textLabel: AppStrings.existingCookingFuelLabel,
      onChanged: (String value) {
        setState(() => cookInFuelValue = value);
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
        setState(() => _residentStatusValue = value);
      },
    );
  }

  _docTypeDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.docTypeLabel,
      hint: AppStrings.docTypeLabel,
      items: idProofList,
      value: idProofValue,
      onChanged: (OptionItem value) {
        setState(() {
          idProofValue = value;
        });
      },
    );
  }

  Widget _backNameWidget() {
    return TextFieldWidget(
        maxLength: 20,
        headingLabel: AppStrings.customerAccountNoLabel,
        hintText: AppStrings.customerAccountNoLabel,
        controller: bankAccNoController,
        textInputType: TextInputType.text,
        suffixIcon: AppStrings.isBankAccNo == true
            ? Icon(Icons.check_circle_sharp, color: Colors.green,)
            : Icon(Icons.info, color: Colors.red),
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
          setState(() =>
          v.length <= 7 ? AppStrings.isBankAccNo = false : AppStrings
              .isBankAccNo = true);
        }
    );
  }

  Widget _micrCodeWidget() {
    return TextFieldWidget(
        headingLabel: AppStrings.mICRCodeLabel,
        hintText: AppStrings.mICRCodeLabel,
        maxLength: 9,
        controller: mICRCodeController,
        textInputType: TextInputType.number,
        suffixIcon: AppStrings.isMICRCode == true
            ? Icon(Icons.check_circle_sharp, color: Colors.green,)
            : Icon(Icons.info, color: Colors.red),
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
          setState(() =>
          v.length <= 8 ? AppStrings.isMICRCode = false : AppStrings
              .isMICRCode = true);
        }
    );
  }



  /////////////////////////////  image 1 ///////////////////////////////////////
  Future<void> _openFrontImageSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getFrontImage(
                photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getFrontImage(
                photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getFrontImage(
      {PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource,
          maxHeight: 480, maxWidth: 640, imageQuality: 25);
      if (pickedFile != null || photoController != null) {
        setState(() {
          frontImageFile = pickedFile.path;
          //   photoController.frontImage = File(pickedFile.path);
        });
      }
    }catch (e) {
      CustomToast.showToast(e.toString());
    }
  }

  Future<void> _openBackImageSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getBackImage(
                photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getBackImage(
                photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getBackImage(
      {PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource,
          maxHeight: 480, maxWidth: 640, imageQuality: 25);
      if (pickedFile != null || photoController != null) {
        setState(() {
          backImageFile = pickedFile.path;
          //  photoController.backImage = File(pickedFile.path);
        });
      }
    }  catch (e) {
      CustomToast.showToast(e.toString());
    }
  }

  Future<void> _openEleBillFrontSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getEleBillFrontImage(
                photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getEleBillFrontImage(
                photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getEleBillFrontImage(
      {PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource,
          maxHeight: 480, maxWidth: 640, imageQuality: 25);
      if (pickedFile != null || photoController != null) {
        setState(() {
          electricBillFrontImgFile = pickedFile.path;
          // photoController.electricBillFrontImg = File(pickedFile.path);
        });
      }
    }catch (e) {
      CustomToast.showToast(e.toString());
    }
  }

  Future<void> _openEleBackSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getEleBackImage(
                photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getEleBackImage(
                photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getEleBackImage(
      {PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource,
          maxHeight: 480, maxWidth: 640, imageQuality: 25);
      if (pickedFile != null|| photoController != null) {
        setState(() {
          electricBillBackImgFile = pickedFile.path;
          // photoController.electricBillBackImg = File(pickedFile.path);
        });
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
    }
  }

  Future<void> _openNocFrontImgSource(
      {BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getNocFrontImgImage(
                photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getNocFrontImgImage(
                photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getNocFrontImgImage(
      {PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource,
          maxHeight: 480,maxWidth: 640, imageQuality: 25);
      if (pickedFile != null || photoController != null) {
        setState(() {
          nocFrontImgFile = pickedFile.path;
          // photoController.nocFrontImg = File(pickedFile.path);
        });
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
    }
  }

  Future<void> _openNocBackImgSource(
      {BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getNocBackImgImage(
                photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getNocBackImgImage(
                photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getNocBackImgImage(
      {PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource,
          maxHeight: 480, maxWidth: 640, imageQuality: 25);
      if (pickedFile != null || photoController != null) {
        setState(() {
          nocBackImgFile = pickedFile.path;
          //  photoController.nocBackImg = File(pickedFile.path);
        });
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
    }
  }

  Future<void> _openConsentImgSource(
      {BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getConsentImgImage(
                photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getConsentImgImage(
                photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getConsentImgImage(
      {PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource,
          maxHeight: 480, maxWidth: 640, imageQuality: 25);
      if (pickedFile != null || photoController != null) {
        setState(() {
          consentPhotoFile = pickedFile.path;
          // photoController.consentPhoto = File(pickedFile.path);
        });
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
    }
  }

  Future<void> _openChqCancelledImgSource(
      {BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getChqCancelledImg(photoController: controller, imageSource: ImageSource.gallery);},
          onTapCamera: () {
            Navigator.of(context).pop();
            getChqCancelledImg(
                photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getChqCancelledImg(
      {PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource,
          maxHeight: 480, maxWidth: 640, imageQuality: 25);
      if (pickedFile != null || photoController != null) {
        setState(() {
          chqCancelledPhotoFile = pickedFile.path;
          //  photoController.chqCancelledPhoto = File(pickedFile.path);
        });
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
    }
  }

  Future<void> _openChqImgSource(
      {BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getChqImg(
                photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getChqImg(
                photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getChqImg(
      {PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource,
          maxHeight: 480, maxWidth: 640, imageQuality: 25);
      if (pickedFile != null || photoController != null) {
        setState(() {
          chqPhotoFile = pickedFile.path;
          //  photoController.chqPhoto = File(pickedFile.path);
        });
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
    }
  }


  Widget _frontImageWidget() {
    print("Get File Path ====== ${frontImageController.frontImage}");
    print("Get File Path ====== ${frontImageFile}");
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.idFrontImgSide),
        InkWell(
            onTap: () => _openFrontImageSource(context: context, controller: frontImageController),
            child: frontImageFile != null && frontImageFile.isNotEmpty
                ? _fileImage(
                fileImage: File(frontImageFile),
                onPressed: () {
                  _openFrontImageSource(context: context, controller: frontImageController);
                }
            ) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _backImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.idBackImgSide),
        InkWell(
            onTap: () => _openBackImageSource(
                context: context, controller: backImageController),
            child: backImageFile != null && backImageFile.isNotEmpty
                ? _fileImage(
              fileImage: File(backImageFile),
              onPressed: () => _openBackImageSource(
                  context: context, controller: backImageController),
            ) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _electricBillFrontImgWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.electricBillFrontImgLabel),
        InkWell(
            onTap: () => _openEleBillFrontSource(
                context: context, controller: eleBillFrontImgController),
            child: electricBillFrontImgFile != null && electricBillFrontImgFile.isNotEmpty
                ? _fileImage(
              fileImage:File(electricBillFrontImgFile),
              onPressed: () => _openEleBillFrontSource(
                  context: context, controller: eleBillFrontImgController),
            ) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _electricBillBackImgWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.electricBillBackImgLabel),
        InkWell(
            onTap: () => _openEleBackSource(
                context: context, controller: eleBillBackImgController),
            child:electricBillBackImgFile != null && electricBillBackImgFile.isNotEmpty
                ? _fileImage(
              fileImage:File(electricBillBackImgFile),
              onPressed: () => _openEleBackSource(
                  context: context, controller: eleBillBackImgController),
            ) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _nocFrontImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.nocFrontImgLabel),
        InkWell(
            onTap: () => _openNocFrontImgSource(
                context: context, controller: nocFrontImgController),
            child:nocFrontImgFile != null && nocFrontImgFile.isNotEmpty
                ? _fileImage(
              fileImage:File(nocFrontImgFile),
              onPressed: () => _openNocFrontImgSource(
                  context: context, controller: nocFrontImgController),
            ) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _nocBackImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.nocBackImgLabel),
        InkWell(
            onTap: () => _openNocBackImgSource(
                context: context, controller: nocBackImgController),
            child: nocBackImgFile != null && nocBackImgFile.isNotEmpty
                ? _fileImage(
              fileImage:File(nocBackImgFile),
              onPressed: () => _openNocBackImgSource(
                  context: context, controller: nocBackImgController),
            ) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _consentImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.consentPhotoLabel),
        InkWell(
            onTap: () => _openConsentImgSource(
                context: context, controller: consentImageController),
            child: consentPhotoFile != null && consentPhotoFile.isNotEmpty
                ? _fileImage(
              fileImage: File(consentPhotoFile),
              onPressed: () => _openConsentImgSource(
                  context: context, controller: consentImageController),
            ) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _cancelChqImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.chqCancelledPhotoLabel),
        InkWell(
            onTap: () => _openChqCancelledImgSource(
                context: context, controller: cancelChqImageController),
            child: chqCancelledPhotoFile != null && chqCancelledPhotoFile.isNotEmpty
                ? _fileImage(
              fileImage: File(chqCancelledPhotoFile),
              onPressed: () => _openChqCancelledImgSource(
                  context: context, controller: cancelChqImageController),
            ) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _chequeImageWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _imageNameWidget(imageName: AppStrings.chqPhotoLabel),
        InkWell(
            onTap: () => _openChqImgSource(context: context, controller: chqImgController),
            child:chqPhotoFile != null && chqPhotoFile.isNotEmpty
                ? _fileImage(
              fileImage: File(chqPhotoFile),
              onPressed: () => _openChqImgSource(context: context, controller: chqImgController),
            ) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _nocProofNoWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.nocProofNoLabel,
      hintText: AppStrings.nocProofNoLabel,
      controller: nocProofNoController,
      textInputType: TextInputType.text,
      maxLength: 20,
    );
  }


  Widget _idProofNoWidget() {
    return TextFieldWidget(
        headingLabel: AppStrings.idProofNo,
        hintText: AppStrings.idProofNo,
        controller: idProofNoController,
        textInputType: TextInputType.text,
        maxLength: 20,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
              RegExp("[a-zA-Z-0-9\u0900-\u097F]",))
        ],
        suffixIcon: AppStrings.isIdProofNo == true
            ? Icon(Icons.check_circle_sharp, color: Colors.green,)
            : Icon(Icons.info, color: Colors.red),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter id proof no";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
          setState(() =>
          v.length <= 1 ? AppStrings.isIdProofNo = false : AppStrings
              .isIdProofNo = true);
        }
    );
  }

  Widget _ownerProofNoWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.ownershipProofNo,
      hintText: AppStrings.ownershipProofNo,
      controller: ownershipController,
      textInputType: TextInputType.text,
      maxLength: 20,
    );
  }

  Widget getDropDown2() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.docTypeLabel,
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
    );
  }

  Widget getDropDown3() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.docTypeLabel,
      hint: AppStrings.docTypeLabel,
      items: _kycProofDropdownItems,
      value: _kycProofDropDownValue,
      onChanged: ( value) {
        log(value.id);
        setState(() {
          _kycProofDropDownValue = value;
        });
      },
    );
  }

  Widget _billModeDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.billingModeLabel,
      hint: AppStrings.billingModeLabel,
      items: billingModeList,
      value: billingModeValue,
      onChanged: (value) {
        setState(() {
          billingModeValue = value;
        });
      },
    );
  }

  Widget _customerBankDropDown() {
    return ReusedDropDownString(
      textLabel: AppStrings.customerBankNameLabel,
      hint: AppStrings.customerBankNameLabel,
      items: _bankDropdownItems.map((String item) {
        return DropdownMenuItem<String>(
            value: item,
            child: Text(item)
        );
      }).toList(),
      value: _bankValue,
      onChanged: (value) {
        setState(() {
          _bankValue = value;
          print("_bankValue-->" + _bankValue);
        });
      },
    );
  }

  Widget _customerBackNoWidget() {
    return TextFieldWidget(
        headingLabel: AppStrings.customerAccountNoLabel,
        // labelText:AppStrings.customerAccountNoLabel,
        hintText: AppStrings.customerAccountNoLabel,
        controller: customerAccountNum,
        textInputType: TextInputType.text,
        maxLength: 20,
        suffixIcon: AppStrings.isCustAccNo == true
            ? Icon(Icons.check_circle_sharp, color: Colors.green,)
            : Icon(Icons.info, color: Colors.red),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter Customer Account Number";
          } else if (value.length <= 16) {
            return "Customer Account Number must be of 17 digit";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
          setState(() =>
          v.length <= 16 ? AppStrings.isCustAccNo = false : AppStrings
              .isCustAccNo = true);
        }
    );
  }

  Widget _customerIFSCCodeWidget() {
    return TextFieldWidget(
        headingLabel: AppStrings.customerIfscCodeLabel,
        hintText: AppStrings.customerIfscCodeLabel,
        controller: IFSCController,
        textInputType: TextInputType.text,
        maxLength: 11,
        suffixIcon: AppStrings.isCustIfscCode == true
            ? Icon(Icons.check_circle_sharp, color: Colors.green,)
            : Icon(Icons.info, color: Colors.red),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter Customer Ifsc Code";
          } else if (value.length <= 10) {
            return "Customer Ifsc Code must be of 11 digit";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
          setState(() =>
          v.length <= 10 ? AppStrings.isCustIfscCode = false : AppStrings
              .isCustIfscCode = true);
        }
    );
  }

  Widget _customerBankAddWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.customerBankAddress,
      hintText: AppStrings.customerBankAddress,
      controller: bank_address,
      textInputType: TextInputType.text,
      suffixIcon: AppStrings.isCustBankAdd == true
          ? Icon(Icons.check_circle_sharp, color: Colors.green,)
          : Icon(Icons.info, color: Colors.red),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter the customer bank address";
        }
        return null;
      },
      onTap: () {},
      onChanged: (v) {
        formGlobalKey.currentState.validate();
        setState(() =>
        v.length > 1 ? AppStrings.isCustBankAdd = true : AppStrings
            .isCustBankAdd = false);
      },
    );
  }

  Widget _depositStatusDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: "",
      hint: AppStrings.depositStatusLabel,
      items: dropListDepositStatusList,
      value: depositStatusValue,
      onChanged: ( value) {
        setState(() {
          _depositStatusId = value.id;
          depositStatusValue = value;
          if (_depositStatusId != '2') {
            reasonNoController.text = '';
          }
        });
      },
    );
  }

  Widget _reasonDepositStatusWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.reasonLabel,
      hintText: AppStrings.reasonLabel,
      controller: reasonNoController,
      textInputType: TextInputType.text,
    );
  }

  Widget _modeDepositDropDown() {
    return ReusedDropDownOptionItem(
        textLabel: AppStrings.modeOfDepositLabel,
        hint: AppStrings.modeOfDepositLabel,
        items: modeOfDepositList,
        value: __modeDepositValue,
        onChanged: (OptionItem item) {
          setState(() {
            __modeDepositValue = item;
            print("__modeDepositValue-->" + __modeDepositValue.id.toString());
          });
          if (item.id == "2") {
            _modeOfDeposit = item.id;
            setState(() {
              chqNOController.clear();
              bankAccNoController.text = "";
              mICRCodeController.text = "";
              mICRCodeController.clear();
              initDepDateController.clear();
              chqDateController.text = "";
              checkONLine = false;
              isDepositCheq = false;
              _modeOfDeposit = item.id;
            });
          } else {
            setState(() {
              checkONLine = true;
              isDepositCheq = true;
              _modeOfDeposit = item.id;
            });
          }
        }
    );
  }

  Widget _chqNoWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.chqNoLabel,
      hintText: AppStrings.chqNoLabel,
      controller: chqNOController,
      maxLength: 5,
      textInputType: TextInputType.number,
    );
  }

  Widget _depositDateWidget() {
    return TextFieldWidget(
      prefixIcon: Icon(Icons.calendar_today),
      hintText: AppStrings.depositDateLabel,
      controller: initDepDateController,
      readOnly: true,
      textInputType: TextInputType.datetime,
      onTap: () => _selectDate(context, initDepDateController),
    );
  }

  Widget _bankNameDropDown() {
    return ReusedDropDownString(
      textLabel: AppStrings.bankNameLabel,
      hint: AppStrings.bankNameLabel,
      items: _bankDropdownItems2.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      value: _bankValue2,
      onChanged: (String value) {
        setState(() {
          _bankValue2 = value;
          print("_bankValue2--->" + _bankValue2);
        });
      },
    );
  }

  Widget _buildCardWidget({String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        shape: Border(
          left: BorderSide(color: Colors.red, width: 15),
          right: BorderSide(color: Colors.blue.shade900, width: 15),
        ),
        elevation: 5,
        shadowColor: Colors.lightBlueAccent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Text(text, textAlign: TextAlign.center, style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,

          ),),
        ),
      ),
    );
  }

  Widget _localBorderImg() {
    return CircleAvatar(
      radius: 41,
      child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/place_holder.png'),
            ),
          )
      ),
    );
  }

  Widget _fileImage({File fileImage, Function onPressed}) {
    print("sdsdsldk =========================== ${fileImage}");
    if (fileImage.path.isNotEmpty) {
      return CircleAvatar(
        radius: 41,
        child: CircleAvatar(
          radius: 40,
          backgroundImage: FileImage(fileImage),
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade400.withOpacity(0.7),
              child: IconButton(
                  icon: Icon(
                      Icons.delete_outline, color: Colors.blue.shade900.withOpacity(0.7)),
                  onPressed: onPressed
              ),
            ),
          ),),
      );
    } else {
      return CircleAvatar(
        radius: 41,
        child: CircleAvatar(
          backgroundImage: FileImage(fileImage),
          radius: 40,
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: blackColor.withOpacity(0.7),
              child: IconButton(
                  icon: Icon(
                      Icons.edit, color: whiteColor.withOpacity(0.7)),
                  onPressed: onPressed
              ),
            ),
          ),
        ),
      );
    }
  }


  Widget _imageNameWidget({String imageName}) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.red, Colors.blue.shade900]
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(imageName, style: TextStyle(color: Colors.white),),
            )),
        SizedBox(height: 12,),
      ],
    );
  }

  Widget _buildRow({String leading, String trailing}) {
    return Column(
      children: [
        ListTile(
          leading: Text(leading),
          trailing: Text(trailing),
        ),
        Divider(),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context,
      TextEditingController controller) async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    setState(() {
      initDepDateController.text = formatter.format(pickedDate);
      if (initDepDateController.text
          .toString()
          .isNotEmpty) {
        fDepositeDate = true;
      } else {}
    });
  }

  Future<void> fetchDistrict() async {
    var resAllDistrict = prefs.getString(GlobalConstants.AllDistrict);
    List dataChargeList = json.decode(resAllDistrict);
    List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
      dataChargeList.length, (i) =>
        DropdownMenuItem(
          value: OptionItem(id: dataChargeList[i]['id'],
              title: dataChargeList[i]['district_name']),
          child: Text("${dataChargeList[i]['district_name']}"),
        ),
    );
    if (!mounted) return;
    getAllDistrictItems = menuItems;
    districtValue = getAllDistrictItems.firstWhere((element) => element.value.id == widget.studentModel.districtId).value;
    setState(() {

    });
  }

  Future<void> fetchArea(String id) async {
    var resArea = prefs.getString(GlobalConstants.area);
    List dataList = json.decode(resArea);
    List<DropdownMenuItem<OptionItem>> menuItems = [];
    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i]['charge_area_id'] == id) {
        menuItems.add(DropdownMenuItem(
          value: OptionItem(
              id: dataList[i]['gid'], title: dataList[i]['area_name']),
          child: Text("${dataList[i]['area_name']}"),
        ));
      }
    }
    if (!mounted) return;
    setState(() {

      areaItems = menuItems;
      areaTypeValue = areaItems.firstWhere((element) => element.value.id == widget.studentModel.areaId).value;

    });
  }

  Future<void> fetchChargeAreaList() async {
    var resChargeAreaName = prefs.getString(GlobalConstants.chargeAreaName);
    List dataChargeList = json.decode(resChargeAreaName);
    //   _toastMsg(dataList.toString());
    log(dataChargeList.toString());
    List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
      dataChargeList.length,
          (i) =>
          DropdownMenuItem(
            value:
            OptionItem(id: dataChargeList[i]['gid'],
                title: dataChargeList[i]['charge_area_name']),
            child: Text("${dataChargeList[i]['charge_area_name']}"),
          ),
    );
    if (!mounted) return;
    setState(() {
      chargeAreaItems = menuItems;
      chargeAreaType = chargeAreaItems.firstWhere((element) => element.value.id == widget.studentModel.chargeArea ?? "").value;
    });
    fetchArea(chargeAreaType.id);
  }

  Future<void> interestedDorpdownList() async {
    var resInterested = prefs.getString(GlobalConstants.Interested);
    final decoded = jsonDecode(resInterested) as Map;
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
    var resSociatyAllow = prefs.getString(GlobalConstants.sociaty_allow);
    final decoded = jsonDecode(resSociatyAllow) as Map;
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
    var resCookingFuel = prefs.getString(GlobalConstants.CookingFuel);
    final decoded = jsonDecode(resCookingFuel) as Map;
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
    var resGuardianType = prefs.getString(GlobalConstants.GuardianType);
    final decoded = jsonDecode(resGuardianType) as Map;
    for (final name in decoded.values) {
      guardianTypeDropdownItems.add(DropdownMenuItem(
        value: name,
        child: Text(name),
      ));
    }
    guardianTypeValue = decoded.values.first;
    setState(() {});
  }

  Future<void> _getResidentStatus() async {
    var resResidentStatus = prefs.getString(GlobalConstants.ResidentStatus);
    final decoded = jsonDecode(resResidentStatus) as Map;
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
    var resPropertyCategory = prefs.getString(GlobalConstants.PropertyCategory);
    List dataList = json.decode(resPropertyCategory);
    List<DropdownMenuItem<OptionItem>> menuItems = [];
    menuItems.add(DropdownMenuItem(
      value: OptionItem(id: '0', title: 'Select Property Category'),
      child: Text('Select Property Category'),
    ));
    menuItems = List.generate(
      dataList.length, (i) =>
        DropdownMenuItem(
          value: OptionItem(id: dataList[i]['id'], title: dataList[i]['name']),
          child: Text("${dataList[i]['name']}"),
        ),
    );
    if (!mounted) return;
    setState(() {
      propertyCategoryList = menuItems;
      categoryValue = menuItems.first.value;
      categoryValue = propertyCategoryList.firstWhere((element) => element.value.id == widget.studentModel.propertyCategoryId).value;
    });
  }

  Future<void> _getPropertyClass() async {
    var resPropertyClass = prefs.getString(GlobalConstants.propertyclass);
    List dataList = json.decode(resPropertyClass);
    List<DropdownMenuItem<OptionItem>> menuItems = [];
    menuItems = List.generate(dataList.length, (i) =>
        DropdownMenuItem(
          value: OptionItem(id: dataList[i]['id'], title: dataList[i]['name']),
          child: Text("${dataList[i]['name']}"),
        ),
    );
    if (!mounted) return;
    setState(() {
      propertyClassList = menuItems;
      propertyClassValue = menuItems.first.value;
      propertyClassValue = propertyClassList.firstWhere((element) => element.value.id == widget.studentModel.propertyClassId?? "").value;
    });
  }

  Future<void> _getIdProofArray() async {
    var resIdentityProof = prefs.getString(GlobalConstants.IdentityProof);
    final decoded = jsonDecode(resIdentityProof) as Map;
    decoded.forEach((k, v) {
      idProofList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    idProofValue = idProofList.first.value;
    idProofValue = idProofList.firstWhere((element) => element.value.id == widget.studentModel.kycDocument1).value;
    setState(() {});
  }

  Future<void> _getAddressProofArray() async {
    var resOwnershipProof = prefs.getString(GlobalConstants.OwnershipProof);
    final decoded = jsonDecode(resOwnershipProof) as Map;
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
    var resKycDoc = prefs.getString(GlobalConstants.KycDoc);
    final decoded = jsonDecode(resKycDoc) as Map;
    decoded.forEach((k, v) {
      _kycProofDropdownItems.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    _kycProofDropDownValue = _kycProofDropdownItems.first.value;
    _kycProofDropDownValue = _kycProofDropdownItems.firstWhere((element) => element.value.id == widget.studentModel.kycDocument3).value;
    setState(() {});
  }

  Future<void> _getBank() async {
    var resAllBanks = prefs.getString(GlobalConstants.AllBanks);
    final decoded = (jsonDecode(resAllBanks) as List<dynamic>).cast<String>();
    log("getBankGetBank---> $resAllBanks");
    setState(() {
      _bankDropdownItems = decoded;
    });
  }

  Future<void> _getBank2() async {
    var resAllBanks = prefs.getString(GlobalConstants.AllBanks);
    final decoded = (jsonDecode(resAllBanks) as List<dynamic>).cast<String>();
    log("getBankGetBank2--> $resAllBanks");
    setState(() {
      _bankDropdownItems2 = decoded;
      billingModeValue = billingModeList.firstWhere((element) => element.value.id == widget.studentModel.billingModel).value;

    });
  }

  Future<void> _getBillingModeList() async {
    var resEbilling = prefs.getString(GlobalConstants.Ebilling);
    final decoded = jsonDecode(resEbilling) as Map;
    log("Ebilling --> $resEbilling");
    decoded.forEach((k, v) {
      billingModeList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    setState(() {
      billingModeValue = billingModeList.first.value;
      billingModeValue = billingModeList.firstWhere((element) => element.value.id == widget.studentModel.billingModel).value;
    });
  }

  Future<void> _getAcceptConversionPolicyList() async {
    var resConversionPolicy = prefs.getString(GlobalConstants.ConversionPolicy);
    final decoded = jsonDecode(resConversionPolicy) as Map;
    decoded.forEach((k, v) {
      _acceptConversionPolicyList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    __acceptConversionPolicyValue = _acceptConversionPolicyList.first.value;
    __acceptConversionPolicyValue = _acceptConversionPolicyList.firstWhere((element) => element.value.id == widget.studentModel.acceptConversionPolicy).value;
    setState(() {});
  }

  Future<void> _getAcceptExtraFittingCostList() async {
    var resExtraFittingCost = prefs.getString(GlobalConstants.ExtraFittingCost);
    final decoded = jsonDecode(resExtraFittingCost) as Map;
    decoded.forEach((k, v) {
      _acceptExtraFittingCostList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    acceptExtraFittingCostValue = _acceptExtraFittingCostList.first.value;
    acceptExtraFittingCostValue = _acceptExtraFittingCostList.firstWhere((element) => element.value.id == widget.studentModel.acceptExtraFittingCost).value;
    setState(() {

    });
  }

  Future<void> _getMdeOfDeposite() async {
    var resMdeOfDeposite = prefs.getString(GlobalConstants.MdeOfDeposite);
    final decoded = jsonDecode(resMdeOfDeposite) as Map;
    decoded.forEach((k, v) {
      modeOfDepositList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    __modeDepositValue = modeOfDepositList.first.value;
    _modeOfDeposit = __modeDepositValue.id;
    __modeDepositValue = modeOfDepositList.firstWhere((element) => element.value.id == widget.studentModel.modeOfDeposite).value;
    setState(() {
      if (_modeOfDeposit == '1') {
        isDepositCheq = true;
        checkONLine = true;
      }
      if (_modeOfDeposit == '2') {
        isDepositCheq = false;
        setState(() {
          checkONLine = false;
          chqNOController.clear();
          mICRCodeController.text = "";
          bankAccNoController.text = "";
          mICRCodeController.clear();
          initDepDateController.clear();
          chqDateController.text = "";
        });
      }
    });
  }

  Future<void> _getInitialDepositeStatusList() async {
    var resDepositeStatus = prefs.getString(GlobalConstants.DepositeStatus);
    final decoded = jsonDecode(resDepositeStatus) as Map;
    log("_getInitialDepositeStatusList$resDepositeStatus");
    decoded.forEach((k, v) {
      dropListDepositStatusList.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    setState(() {
      depositStatusValue = dropListDepositStatusList.first.value;
      _depositStatusId = depositStatusValue.id;
      depositStatusValue = dropListDepositStatusList.firstWhere((element) => element.value.id == widget.studentModel.initialDepositeStatus).value;
    });
  }

  Future<void> _getAllDepositScheme() async {
    var resSchemeType = prefs.getString(GlobalConstants.SchemeType);
    List dataList = json.decode(resSchemeType);
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
    menuItems2 = List.generate(dataList.length, (i) =>
        DropdownMenuItem(
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
      _depositCategoryType = _propertyDropdownItemsDeposit.firstWhere((element) => element.value.id == widget.studentModel.depositeType).value;
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
              Text("Your are connected to ${isWifiConnected
                  ? "WIFI"
                  : "MOBILE DATA"}"),
              Text(isWifiConnected ? "$wifiBSSID" : "Not Wifi"),
              Text("$wifiIP"),
              Text("$wifiName")
            ],
          ),
        ),
      ),
    );
  }
}
