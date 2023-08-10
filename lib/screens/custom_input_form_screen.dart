import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../ExportFile/export_file.dart';

class CustomInputForm extends StatefulWidget {
  final bool isUpdate;
  final int position;
  final SaveCustomerRegistrationOfflineModel studentModel;
  CustomInputForm({Key key,this.isUpdate, this.position, this.studentModel}) : super(key: key);

  @override
  State<CustomInputForm> createState() => _CustomInputFormState();
}

class _CustomInputFormState extends State<CustomInputForm> {
  Position position;
  int gasDepositAmountController, depositTotalAmount = 0, _schemeMonth = 0;

  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool isWifiConnected = false;
  bool isInternetOn = true;

  List<String> _customerBankNameList = [];
  String _customerBankValue;

  List<String> _payementBankNameList = [];
  String _payementBankValue;

  //Area
  List<DropdownMenuItem<OptionItem>> areaItems = [];
  OptionItem areaTypeValue;
  String _areaTypeId = '0';

  //Charge Area
  List<DropdownMenuItem<OptionItem>> chargeAreaItems = [];
  OptionItem chargeAreaType;
  String chargeAreaId = '0';

  //getAllDistrict
  List<DropdownMenuItem<OptionItem>> getAllDistrictItems = [];
  OptionItem districtValue;
  String getAllDistrictId = '0';

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

  PhotoController ownerConsentImageController = PhotoController();
  PhotoController frontImageController = PhotoController();
  PhotoController backImageController = PhotoController();
  PhotoController eleBillFrontImgController = PhotoController();
  PhotoController eleBillBackImgController = PhotoController();
  PhotoController nocFrontImgController = PhotoController();
  PhotoController nocBackImgController = PhotoController();
  PhotoController customerImgController = PhotoController();
  PhotoController houseImgController = PhotoController();
  PhotoController consentImageController = PhotoController();
  PhotoController cancelChqImageController = PhotoController();
  PhotoController chqImgController = PhotoController();
  var frontImageFile = "",
      backImageFile = "",
      electricBillFrontImgFile = "",
      electricBillBackImgFile = "",
      nocFrontImgFile = "",
      nocBackImgFile = "",
      uploadCustomerImgFile = "",
      customerConsentImageFile = "",
      uploadHouseImgFile = "",
      ownerConsentImageFile = "",
      chqCancelledPhotoFile = "",
      chqPhotoFile = "";

  String schemeId = '0';
  List<ChargeAreaModel> listChargeArea;

  var checkDepositeDate;
  String selectedDropDownValue = "";
  ServerApi serverApi;

  @override
  void initState() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    getLocalData();
    serverApi = ServerApi();
    updateValue();
    super.initState();
  }

  updateValue() {
    if (widget.isUpdate) {
      mobileNoController.text = widget.studentModel.mobileNumber;
      firstNameController.text = widget.studentModel.firstName;
      middleNameController.text = widget.studentModel.middleName;
      lastNameController.text = widget.studentModel.lastName;
      guardianNameController.text = widget.studentModel.guardianName;
      reasonInterestedController.text = widget.studentModel.residentStatus;
      emailIdController.text = widget.studentModel.emailId;
      colonySocietyApartmentController.text = widget.studentModel.colonySocietyApartment;
      streetNameController.text = widget.studentModel.streetName;
      townController.text = widget.studentModel.town;
      houseNumberController.text = widget.studentModel.houseNumber;
      pinCodeController.text = widget.studentModel.pinCode;
      kitchenController.text = widget.studentModel.noOfKitchen;
      bathroomController.text = widget.studentModel.noOfBathroom;
      familyMemController.text = widget.studentModel.noOfFamilyMembers;
      landmarkController.text = widget.studentModel.reasonForHold;
      longitudeController.text = widget.studentModel.longitude;
      latitudeController.text = widget.studentModel.latitude;
      kYCDoc1NoController.text = widget.studentModel.kycDocument1Number;
      kYCDoc2NoController.text = widget.studentModel.kycDocument2Number;
      kYCDoc3NoController.text = widget.studentModel.kycDocument3Number;
      reasonDepositStatusController.text = widget.studentModel.remarks;
      depositAmountController.text = widget.studentModel.initialAmount;
      chqNOController.text = widget.studentModel.chequeNumber;
      chequeAccountNoController.text = widget.studentModel.chequeBankAccount;
      chequeMICRNoController.text = widget.studentModel.micr;
      chqDateController.text = widget.studentModel.chequeNumber;
      chequeDateController.text = widget.studentModel.initialDepositeDate;
      customerAccountNum.text = widget.studentModel.bankAccountNumber;
      customerIFSCController.text = widget.studentModel.bankIfscCode;
      customerBankAddController.text = widget.studentModel.bankAddress;
      _isInterestedId = widget.studentModel.interested;
      _residentStatusValue = widget.studentModel.residentStatus;
      cookInFuelValue = widget.studentModel.existingCookingFuel;
      backImageFile = widget.studentModel.backSidePhoto1;
      electricBillBackImgFile = widget.studentModel.backSidePhoto2;
      nocBackImgFile = widget.studentModel.backSidePhoto3;
      frontImageFile = widget.studentModel.documentUploadsPhoto1;
      electricBillFrontImgFile = widget.studentModel.documentUploadsPhoto2;
      nocFrontImgFile = widget.studentModel.documentUploadsPhoto3;
      ownerConsentImageFile = widget.studentModel.ownerConsent;
      chqCancelledPhotoFile = widget.studentModel.canceledChequePhoto;
      chqPhotoFile = widget.studentModel.chequePhoto;
      customerConsentImageFile = widget.studentModel.customerConsentPhoto;
      uploadHouseImgFile = widget.studentModel.uploadHousePhoto;
      uploadCustomerImgFile = widget.studentModel.uploadCustomerPhoto;
      buildingNumberController.text = widget.studentModel.buildingNumber;
      _payementBankValue = widget.studentModel.payementBankName;
      schema = widget.studentModel.schema;
      dmaUserName = widget.studentModel.dmaUserName;
      dmaId = widget.studentModel.dmaUserId;
    }
  }


  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForm()));
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
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  TextEditingController mobileNoController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController reasonInterestedController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController colonySocietyApartmentController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController buildingNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController kitchenController = TextEditingController(text: '1');
  TextEditingController bathroomController = TextEditingController(text: "1");
  TextEditingController familyMemController = TextEditingController(text: "4");
  TextEditingController landmarkController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController kYCDoc1NoController = TextEditingController();
  TextEditingController kYCDoc2NoController = TextEditingController();
  TextEditingController kYCDoc3NoController = TextEditingController();
  TextEditingController reasonDepositStatusController = TextEditingController();
  TextEditingController depositAmountController = TextEditingController();
  TextEditingController chqNOController = TextEditingController();
  TextEditingController chequeAccountNoController = TextEditingController();
  TextEditingController chequeMICRNoController = TextEditingController();
  TextEditingController chqDateController = TextEditingController();
  TextEditingController chequeDateController = TextEditingController();
  TextEditingController customerAccountNum = TextEditingController();
  TextEditingController customerIFSCController = TextEditingController();
  TextEditingController customerBankAddController = TextEditingController();

  OptionItem propertyCategoryValue;
  OptionItem depositStatusValue;

  List<DropdownMenuItem<OptionItem>> modeOfDepositList = [];
  OptionItem modeDepositValue;
  String modeOfDepositString = '';

  DepositItem _depositTypeValue;
  String _depositTypeString = '';

  List<DropdownMenuItem<OptionItem>> dropListDepositStatusList = ([]);
  List<DropdownMenuItem<OptionItem>> dropListChoiceStatusList = ([]);
  List<DropdownMenuItem<OptionItem>> propertyCategoryList = [];
  List<DropdownMenuItem<DepositItem>> _depositTypeList = [];


  List<DropdownMenuItem<OptionItem>> _kycProofDropdownItems = ([]);
  List<DropdownMenuItem<String>> _cookingFuelDropdownItems = ([]);
  List<DropdownMenuItem<OptionItem>> propertyClassList = [];
  List<DropdownMenuItem<String>> guardianTypeDropdownItems = ([]);

  String _depositStatusId = '';


  List<DropdownMenuItem<OptionItem>> _kYCDoc1List = [];
  OptionItem _kYCDoc1Value;

  List<DropdownMenuItem<OptionItem>> _kYCDoc2List = [];
  OptionItem _kYCDoc2Value = OptionItem(id: "", title: "");
  String _kYCDoc2ValueString = "";

  OptionItem _kYCDocument3Value;

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
    _getKYCDoc1Data();
    _getKYCDoc2Data();
    _getKycProofArray();
    _getBankData();
    _getPayementBankData();
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
  OptionItem billingModeValue;
  String billingModeId;

  List<DropdownMenuItem<OptionItem>> _acceptConversionPolicyList = [];
  OptionItem __acceptConversionPolicyValue = OptionItem(id: "0", title: "");
  String __acceptConversionPolicyValueId;

  List<DropdownMenuItem<OptionItem>> _acceptExtraFittingCostList = [];
  OptionItem acceptExtraFittingCostValue = OptionItem(id: "0", title: "");
  String __acceptExtraFittingCostValueId;

  List<ImageSource> values = [];

  String userId = "";
  String depositSum = "";
  final formGlobalKey = GlobalKey<FormState>();

  _buildLayout() {
    modeOfDepositString = modeDepositValue == null ? modeOfDepositString : modeDepositValue.id;
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
            _buildingNumberWidget(),
            _houseNumberWidget(),
            _apartmentWidget(),
            _streetNameWidget(),
            _townWidget(),
            _districtWidget(),
            _pinCodeWidget(),
            _isInterestedId == '1' ? _residentStatusDropdownWidget() : Container(),
            _isInterestedId == '1' ? _noKitchenWidget() : Container(),
            _isInterestedId == '1' ? _noBathroomWidget() : Container(),
            _isInterestedId == '1' ? _fuelDropdownWidget() : Container(),
            _isInterestedId == '1' ? _noFamilyWidget() : Container(),
            _locationWidget(),
            _isInterestedId == '1' ? _landmarkWidget() : Container(),
            _buildCardWidget(text: AppStrings.identificationProofLabel),
            _kYCDoc1DropDown(),
            _kYCDoc1NoWidget(),
            _rowWidget(
              widget1: _frontImageWidget(),
              widget2: _backImageWidget(),
            ),
            _buildCardWidget(text: AppStrings.ownershipProofHeading),
            _kYCDoc2DropDown(),
            _kYCDoc2NoWidget(),
            _rowWidget(
              widget1: _electricBillFrontImgWidget(),
              widget2: _electricBillBackImgWidget(),
            ),
            _buildCardWidget(text: AppStrings.nocLabel),
            _kYCDoc3DropDown(),
            _kYCDoc3NoWidget(),
            _rowWidget(
              widget1: _nocFrontImageWidget(),
              widget2: _nocBackImageWidget(),
            ),
            SizedBox(
              height: 12,
            ),
            _rowWidget(
              widget1: _customerImageWidget(),
              widget2: _houseNumImageWidget(),
            ),
            _ownerConsentImageWidget(),
            _buildCardWidget(text: AppStrings.customerConsentLabel),
            _rowWidget(
              widget1: _consentImageWidget(),
              widget2: _cancelChqImageWidget(),
            ),
            _billModeDropDown(),
            _customerBankDropDown(),
            _customerBackNoWidget(),
            _customerIFSCCodeWidget(),
            _customerBankAddWidget(),
            _buildCardWidget(text: AppStrings.securityDepositLabel),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 12, right: 15),
                  child: Text(AppStrings.initialDepositStatusLabel,style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                Flexible(child: _depositStatusDropDown())
              ],
            ),
            _depositStatusId != "1" ? _reasonDepositStatusWidget() : Container(),
            _depositTypeDropDown(),
            _depositAmountWidget(),
            _modeDepositDropDown(),
            if(modeOfDepositString == "1")...[
              Column(
                children: [
                  _chqNoWidget(),
                  _chequeDateWidget(),
                  _payementBankNameDropDown(),
                  _chequeAccountNoWidget(),
                  _chequeMICRNoWidget(),
                  _chequeImageWidget(),
                ],
              )
            ] else...[
              Container(),
            ],

            ButtonWidget(
              textButton: !widget.isUpdate ? "Preview" : "Update",
              onPressed: () async {
                chargeAreaId = chargeAreaType == null ? chargeAreaId : chargeAreaType.id;
                _areaTypeId = areaTypeValue == null ? _areaTypeId : areaTypeValue.id;
                getAllDistrictId = districtValue == null ? getAllDistrictId : districtValue.id;
                modeOfDepositString = modeDepositValue == null ? modeOfDepositString : modeDepositValue.id;
                _depositTypeString = _depositTypeValue == null ? _depositTypeString : _depositTypeValue.id;

                var textFieldValidationCheck = CustomerFormHelper.textFieldValidationCheck(
                  titleLocation: latitudeController.text.trim().toString(),
                  acceptConversionPolicyValueId: __acceptConversionPolicyValueId.toString(),
                  acceptExtraFittingCostValueId: __acceptExtraFittingCostValueId.toString(),
                  chargeAreaType: chargeAreaId.toString(),
                  areaTypeId: _areaTypeId.toString(),
                  mobileNoController: mobileNoController.text.toString(),
                  firstNameController: firstNameController.text.toString(),
                  lastNameController: lastNameController.text.toString(),
                  guardianNameController: guardianNameController.text.toString(),
                  propertyTypeId: propertyCategoryValue.toString(),
                  propertyClassId: propertyClassValue.toString(),
                  buildingNumberController: buildingNumberController.text.toString(),
                  houseNumberController: houseNumberController.text.toString(),
                  colonySocietyApartmentController: colonySocietyApartmentController.text.toString(),
                  streetNameController: streetNameController.text.toString(),
                  townController: townController.text.toString(),
                  district: getAllDistrictId.toString(),
                  pinCodeController: pinCodeController.text.toString(),
                  noOfKitchen: kitchenController.text.toString(),
                  noOfBathroom: bathroomController.text.toString(),
                  cookInFuelValue: cookInFuelValue.toString(),
                  noOfFamilyMembers: familyMemController.text.trim().toString(),
                  addressProofNo: _kYCDoc1Value.id.toString(),
                  idProofNo: kYCDoc1NoController.text.trim().toString(),
                  idFrontImage: frontImageFile.toString(),
                  idBackImage: backImageFile.toString(),
                  consentImage: ownerConsentImageFile.toString(),
                  modeOfDeposit: modeOfDepositString.toString(),
                  depositType: _depositTypeString.toString(),
                  chequeNo: chqNOController.text.trim().toString(),
                  chequeDate: chequeDateController.text.trim().toString(),
                  payementBankName:_payementBankValue,
                  bankAccNo: chequeAccountNoController.text.trim().toString(),
                  micrCode:chequeMICRNoController.text.trim().toString(),
                  chequePhoto:chqPhotoFile.toString(),
                  mdpeValue: _mdpeValue.toString(),
                  residentStatusValue: _residentStatusValue.toString(),
                );
                if(textFieldValidationCheck == true){
                  if( formGlobalKey.currentState.validate()){
                    formGlobalKey.currentState.save();
                    _showDialog();
                  }
                }

                /* if (formGlobalKey.currentState.validate() == false) {
                  CustomToast.showToast("Blank space. Please remove space");
                }else {
                  formGlobalKey.currentState.validate();
                  formGlobalKey.currentState.save();
                  if (textFieldValidationCheck == true) {
                    _showDialog();
                  }
                }*/
              },
            ),
          ],
        ),
      ),
    );
  }

  _showDialog() {
    return showDialog(
        context: context,
        builder: (
            context,
            ) {
          return Container(
              height: 200,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text("Customer Detail", textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold,color: Colors.blue.shade900
                      ),
                      ),
                    ),
                    _buildRow(
                      leading: AppStrings.interestedLabel,
                      trailing: _isInterestedItem.title ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.conversionPolicyLabel,
                      trailing: __acceptConversionPolicyValue.title ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.fittingCostLabel,
                      trailing: acceptExtraFittingCostValue.title ?? "-",
                    ),
                    _isInterestedId == '1' ? _buildRow(
                      leading: AppStrings.mdpeAllowLabel,
                      trailing: _mdpeValue ?? "-",
                    ): Container(),
                    _isInterestedId == '0' ?_buildRow(
                      leading: AppStrings.reasonInterestedLabel,
                      trailing: reasonInterestedController.text.toString() ?? "-",
                    ): Container(),
                    _buildRow(
                      leading: AppStrings.chargeAreaLabel,
                      trailing: chargeAreaType.title.toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.areaLabel,
                      trailing: areaTypeValue.title.toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.mobileNoLabel,
                      trailing: mobileNoController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.firstNameLabel,
                      trailing: firstNameController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.middleNameLabel,
                      trailing: middleNameController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.lastNameLabel,
                      trailing: lastNameController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.guardianTypeLabel,
                      trailing: guardianTypeValue.toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.guardianNameLabel,
                      trailing: guardianNameController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.emailAddressLabel,
                      trailing: emailIdController.text.trim().toString() ?? "-",
                    ),
                    _isInterestedId == '1' ?_buildRow(
                      leading: AppStrings.propertyCategoryLabel,
                      trailing: propertyCategoryValue.title.toString() ?? "-",
                    ):Container(),
                    _isInterestedId == '1' ? _buildRow(
                      leading: AppStrings.propertyClassLabel,
                      trailing: propertyClassValue.title.toString() ?? "-",
                    ):Container(),
                    _buildRow(
                      leading: AppStrings.buildingNumberLabel,
                      trailing: buildingNumberController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.houseNumberLabel,
                      trailing: houseNumberController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.apartmentLabel,
                      trailing: colonySocietyApartmentController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.streetNameLabel,
                      trailing: streetNameController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.townLabel,
                      trailing: townController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.districtLabel,
                      trailing: districtValue.title.toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.pinCodeLabel,
                      trailing: pinCodeController.text.trim().toString() ?? "-",
                    ),
                    _isInterestedId == '1' ? _buildRow(
                      leading: AppStrings.residentStatusLabel,
                      trailing: _residentStatusValue.toString() ?? "-",
                    ): Container(),
                    _isInterestedId == '1' ? _buildRow(
                      leading: AppStrings.noOfKitchenLabel,
                      trailing: kitchenController.text.trim().toString() ?? "-",
                    ): Container(),
                    _isInterestedId == '1' ?_buildRow(
                      leading: AppStrings.noOfBathroomLabel,
                      trailing: bathroomController.text.trim().toString() ?? "-",
                    ): Container(),
                    _isInterestedId == '1' ?_buildRow(
                      leading: AppStrings.existingCookingFuelLabel,
                      trailing: cookInFuelValue.toString() ?? "-",
                    ): Container(),
                    _isInterestedId == '1' ? _buildRow(
                      leading: AppStrings.noOfFamilyMembersLabel,
                      trailing: familyMemController.text.trim().toString() ?? "-",
                    ): Container(),
                    _buildRow(
                      leading: AppStrings.latitudeLabel,
                      trailing: latitudeController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.longitudeLabel,
                      trailing: longitudeController.text.trim().toString() ?? "-",
                    ),
                    _isInterestedId == '1' ?_buildRow(
                      leading: AppStrings.landmarkLabel,
                      trailing: landmarkController.text.trim().toString() ?? "-",
                    ): Container(),
                    _buildCardWidget(text: AppStrings.identificationProofLabel),
                    _buildRow(
                      leading: AppStrings.kYCDoc1Label,
                      trailing: _kYCDoc1Value.title.toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.kYCDoc1NoLabel,
                      trailing: kYCDoc1NoController.text.trim().toString() ?? "-",
                    ),
                    _imageColumn(
                      leadingImg: Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.idFrontImgSide),
                          frontImageFile != null && frontImageFile.isNotEmpty
                              ? ImageCircle(
                            fileImage1: File(frontImageFile.toString()),
                            pathImage: frontImageFile.toString(),
                          )
                              : _localBorderImg()
                        ],
                      ),
                      trailingImg: Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.idBackImgSide),
                          backImageFile != null && backImageFile.isNotEmpty
                              ? ImageCircle(
                            fileImage1: File(backImageFile.toString()),
                            pathImage: backImageFile.toString(),
                          )
                              : _localBorderImg()
                        ],
                      ),
                    ),
                    _buildCardWidget(text: AppStrings.ownershipProofHeading),
                    _buildRow(
                      leading: AppStrings.kYCDoc2Label,
                      trailing: _kYCDoc2Value.title.toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.kYCDoc2NoLabel,
                      trailing: kYCDoc2NoController.text.toString() ?? "-",
                    ),
                    _imageColumn(
                      leadingImg: Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.electricBillFrontImgLabel),
                          electricBillFrontImgFile != null && electricBillFrontImgFile.isNotEmpty
                              ? ImageCircle(
                            fileImage1: File(electricBillFrontImgFile.toString()),
                            pathImage: electricBillFrontImgFile.toString(),
                          )
                              : _localBorderImg()
                        ],
                      ),
                      trailingImg:Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.electricBillBackImgLabel),
                          electricBillBackImgFile != null && electricBillBackImgFile.isNotEmpty
                              ? ImageCircle(
                            fileImage1: File(electricBillBackImgFile.toString()),
                            pathImage: electricBillBackImgFile.toString(),
                          )
                              : _localBorderImg()
                        ],
                      ),
                    ),
                    _buildCardWidget(text: AppStrings.nocLabel),
                    _buildRow(
                      leading: AppStrings.kYCDoc3Label,
                      trailing: _kYCDocument3Value.title.toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.kYCDoc3NoLabel,
                      trailing: kYCDoc3NoController.text.toString() ?? "-",
                    ),
                    _imageColumn(
                      leadingImg:  Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.nocFrontImgLabel),
                          nocFrontImgFile != null && nocFrontImgFile.isNotEmpty
                              ? ImageCircle(
                            fileImage1: File(nocFrontImgFile.toString()),
                            pathImage: nocFrontImgFile.toString(),
                          )
                              : _localBorderImg()
                        ],
                      ),
                      trailingImg: Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.nocBackImgLabel),
                          nocBackImgFile != null && nocBackImgFile.isNotEmpty
                              ? ImageCircle(
                            fileImage1: File(nocBackImgFile.toString()),
                            pathImage: nocBackImgFile.toString(),
                          )
                              : _localBorderImg()
                        ],
                      ),
                    ),
                    _imageColumn(
                      leadingImg:  Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.customerImgLabel),
                          uploadCustomerImgFile != null && uploadCustomerImgFile.isNotEmpty
                              ? ImageCircle(
                            fileImage1: File(uploadCustomerImgFile.toString()),
                            pathImage: uploadCustomerImgFile.toString(),
                          )
                              : _localBorderImg()
                        ],
                      ),
                      trailingImg: Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.houseImgLabel),
                          uploadHouseImgFile != null && uploadHouseImgFile.isNotEmpty
                              ? ImageCircle(fileImage1: File(uploadHouseImgFile.toString()),
                              pathImage: uploadHouseImgFile.toString())
                              : _localBorderImg()
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        _imageNameWidget(imageName: AppStrings.customerConsentImgLabel),
                        customerConsentImageFile != null && customerConsentImageFile.isNotEmpty
                            ? ImageCircle(fileImage1: File(customerConsentImageFile.toString()), pathImage: customerConsentImageFile.toString())
                            : _localBorderImg()
                      ],
                    ),
                    Divider(),
                    _buildCardWidget(text: AppStrings.customerConsentLabel),
                    _imageColumn(
                      leadingImg:  Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.consentPhotoLabel),
                          ownerConsentImageFile != null && ownerConsentImageFile.isNotEmpty
                              ? ImageCircle(
                            fileImage1: File(ownerConsentImageFile.toString()),
                            pathImage: ownerConsentImageFile.toString(),
                          )
                              : _localBorderImg()
                        ],
                      ),
                      trailingImg: Column(
                        children: [
                          _imageNameWidget(imageName: AppStrings.chqCancelledPhotoLabel),
                          chqCancelledPhotoFile != null && chqCancelledPhotoFile.isNotEmpty
                              ? ImageCircle(fileImage1: File(chqCancelledPhotoFile.toString()), pathImage: chqCancelledPhotoFile.toString())
                              : _localBorderImg()
                        ],
                      ),
                    ),
                    _buildRow(
                      leading: AppStrings.billingModeLabel,
                      trailing: billingModeValue.title.toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.customerBankNameLabel,
                      trailing: _customerBankValue != null ? _customerBankValue.toString() : "_",
                    ),
                    _buildRow(
                      leading: AppStrings.customerAccountNoLabel,
                      trailing: customerAccountNum.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.customerIfscCodeLabel,
                      trailing: customerIFSCController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.customerBankAddLabel,
                      trailing: customerBankAddController.text.trim().toString() ?? "-",
                    ),
                    _buildCardWidget(text: AppStrings.securityDepositLabel),
                    _buildRow(
                      leading: AppStrings.depositStatusLabel,
                      trailing: depositStatusValue.title.toString() ?? "-",
                    ),
                    _depositStatusId != "1" ? _buildRow(
                      leading: AppStrings.reasonDepositLabel,
                      trailing: reasonDepositStatusController.text.trim().toString() ?? "-",
                    ): Container(),
                    _buildRow(
                      leading: AppStrings.depositTypeLabel,
                      trailing: AppStrings.depositName.toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.depositAmountControllerLabel,
                      trailing: depositAmountController.text.trim().toString() ?? "-",
                    ),
                    _buildRow(
                      leading: AppStrings.modeOfDepositLabel,
                      trailing: modeDepositValue.title.toString() ?? "-",
                    ),
                    if(modeOfDepositString == "1")...[
                      Column(
                        children: [
                          _buildRow(
                            leading: AppStrings.chqNoLabel,
                            trailing: chqNOController.text.trim().toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.depositDateLabel,
                            trailing: chequeDateController.text.trim().toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.payementBankNameLabel,
                            trailing: _payementBankValue.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.chequeAccountNoLabel,
                            trailing: chequeAccountNoController.text.toString() ?? "-",
                          ),
                          _buildRow(
                            leading: AppStrings.chequeMICRNoLabel,
                            trailing: chequeMICRNoController.text.toString() ?? "-",
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _imageNameWidget(imageName: AppStrings.chqPhotoLabel),
                                chqPhotoFile != null && chqPhotoFile.isNotEmpty
                                    ? ImageCircle(
                                  fileImage1: File(chqPhotoFile.toString()),
                                  pathImage: chqPhotoFile.toString(),
                                )
                                    : _localBorderImg()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]else...[
                      Container()
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: ButtonWidget(
                            onPressed: () {
                              storeRecords();
                            },
                            textButton:"Save",
                          ),
                        ),
                        Flexible(
                          child: ButtonWidget(
                            textButton: "EDIT",
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ));
        });
  }

  Future<void> storeRecords() async {
    SaveCustomerRegistrationOfflineModel data = SaveCustomerRegistrationOfflineModel(
      interested: _isInterestedId.toString(),
      schema: schema,
      dmaUserName: dmaUserName,
      dmaUserId: dmaId,
     // remarks : reasonInterestedController.text.trim().toString() ?? "",
      chargeArea: chargeAreaType.id.toString(),
      areaId: areaTypeValue.id.toString(),
      mobileNumber: mobileNoController.text.trim().toString(),
      firstName: firstNameController.text.trim().toString(),
      middleName: middleNameController.text.trim().toString(),
      lastName: lastNameController.text.trim().toString(),
      guardianType: guardianTypeValue.toString(),
      guardianName: guardianNameController.text.trim().toString(),
      houseNumber: houseNumberController.text.trim().toString(),
      colonySocietyApartment: colonySocietyApartmentController.text.trim().toString(),
      streetName: streetNameController.text.trim().toString(),
      buildingNumber: buildingNumberController.text.trim().toString(),
      town: townController.text.trim().toString(),
      pinCode: pinCodeController.text.trim().toString(),
      districtId: districtValue.id.toString(),
      emailId: emailIdController.text.trim().toString() ?? "",
      propertyCategoryId: propertyCategoryValue.id.toString(),
      propertyClassId: propertyClassValue.id.toString(),
      societyAllowedMdpe: _mdpeValue == 'Yes' ? '1' : '0',
      residentStatus: _residentStatusValue.toString(),
      noOfKitchen: kitchenController.text.toString(),
      noOfBathroom: bathroomController.text.trim().toString() ?? "",
      existingCookingFuel: cookInFuelValue.toString(),
      noOfFamilyMembers: familyMemController.text.trim().toString() ?? "",
      latitude: latitudeController.text.trim().toString() ?? "0.0",
      longitude: longitudeController.text.trim().toString() ?? "0.0",
      remarks: landmarkController.text.trim().toString() ?? "",
      kycDocument1: _kYCDoc1Value.id.toString(),
      kycDocument1Number: kYCDoc1NoController.text.trim().toString() ?? "",
      backSidePhoto1: backImageFile.toString(),
      documentUploadsPhoto1: frontImageFile.toString(),
      kycDocument2: _kYCDoc2ValueString.toString(),
      kycDocument2Number: kYCDoc2NoController.text.toString(),
      backSidePhoto2: electricBillBackImgFile.toString(),
      documentUploadsPhoto2: electricBillFrontImgFile.toString(),
      kycDocument3: _kYCDocument3Value.id.toString(),
      kycDocument3Number: kYCDoc3NoController.text.toString(),
      backSidePhoto3: nocBackImgFile.toString(),
      documentUploadsPhoto3: nocFrontImgFile.toString(),
      customerConsentPhoto: customerConsentImageFile.toString(),
      canceledChequePhoto: chqCancelledPhotoFile.toString(),
      chequePhoto: chqPhotoFile.toString(),
      uploadCustomerPhoto: uploadCustomerImgFile.toString(),
      uploadHousePhoto: uploadHouseImgFile.toString(),
      ownerConsent: ownerConsentImageFile.toString(),
      reasonForHold:reasonDepositStatusController.text.trim().toString() ?? "",
      billingModel: billingModeId.toString(),
      nameOfBank:_customerBankValue != null? _customerBankValue.toString() : "",
      bankAccountNumber: customerAccountNum.text.trim().toString(),
      bankIfscCode: customerIFSCController.text.trim().toString() ?? "",
      bankAddress: customerBankAddController.text.trim().toString(),
      acceptConversionPolicy: __acceptConversionPolicyValueId.toString(),
      acceptExtraFittingCost: __acceptExtraFittingCostValueId.toString(),
      initialDepositeStatus: _depositStatusId.toString(),
      depositeType: _depositTypeValue.id.toString(),
      initialAmount: depositAmountController.text.trim().toString(),
      modeOfDeposite: modeDepositValue.id.toString() ?? "",
      chequeNumber: chqNOController.text.trim().toString() ?? "",
      initialDepositeDate: chequeDateController.text.trim().toString() ?? "",
      payementBankName:_payementBankValue != null ? _payementBankValue.toString() : "",
      chequeBankAccount: chequeAccountNoController.text.trim().toString() ?? "",
      micr: chequeMICRNoController.text.trim().toString() ?? "",
    );
    print("initialDepositeDatefghj" + data.initialDepositeDate.toString());
    if (widget.isUpdate) {
      var box = await Hive.openBox<SaveCustomerRegistrationOfflineModel>("saveCustRegDataBoxName");
      await  box.putAt(widget.position, data);
      CustomToast.showToast('Great Success! Update Record Save');
    } else {
      var box = await Hive.openBox<SaveCustomerRegistrationOfflineModel>("saveCustRegDataBoxName");
      var mmm = box.length;
      if (mmm <= 5) {
        var box = await Hive.openBox<SaveCustomerRegistrationOfflineModel>("saveCustRegDataBoxName");
        await box.add(data);
        CustomToast.showToast('Great Success! Add Record Save');
      } else {
        CustomToast.showToast('Error !!!! \n Please Uploade Previous record');
      }
    }
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => RegistrationForm()), (r) => false);
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
          __acceptConversionPolicyValueId = value.id;
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
          __acceptExtraFittingCostValueId = value.id;
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
      headingLabel: AppStrings.reasonInterestedLabel,
      textInputType: TextInputType.text,
      controller: reasonInterestedController,
      hintText: AppStrings.reasonInterestedLabel,
      validator: (value) {
        if (value != reasonInterestedController.text.trim()) {
          return "Blank space";
        }
        return null;
      },
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
          chargeAreaId = value.id;
          chargeAreaType = value;
          areaTypeValue = null;
          areaItems.clear();
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
          _areaTypeId = value.id;
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
        validator: (value) {
          if (value != mobileNoController.text.trim()) {
            return "Blank space";
          } else if (value.isEmpty) {
            return "Please enter Mobile Number";
          } else if (value.length <= 9) {
            return 'Mobile Number must be of 10 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        });
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
      validator: (value) {
        if (value != firstNameController.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
          return "Enter First Name";
        } else if (value.length <= 2) {
          return "First Name must be of minimum 2+ Letters";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
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
      validator: (value) {
        if (value != middleNameController.text.trim()) {
          return "Blank space";
        }
        return null;
      },
    );
  }

  Widget _lastNameWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.lastNameLabel,
      hintText: AppStrings.lastNameLabel,
      controller: lastNameController,
      textInputType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
      validator: (value) {
        if (value != lastNameController.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
          return "Enter Last Name";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
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
      validator: (value) {
        if (value != guardianNameController.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty) {
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
      },
    );
  }

  Widget _emailWidget() {
    final RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return TextFieldWidget(
      headingLabel: AppStrings.emailAddressLabel,
      hintText: "demo@gmail.com",
      controller: emailIdController,
      textCapitalization: TextCapitalization.none,
      textInputType: TextInputType.emailAddress,
      /* inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-z0-9@._-]")),
      ],*/
      validator: (value) {
        if (value != emailIdController.text.trim()) {
          return "Blank space";
        }
        /* else if(!emailValid.hasMatch(value)){
          return "enter invalid format";
        }*/
        return null;
      },
    );
  }

  Widget _propertyCategoryDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.propertyCategoryLabel,
      onChanged: (OptionItem value) {
        setState(() {
          propertyCategoryValue = value;
        });
      },
      items: propertyCategoryList,
      value: propertyCategoryValue,
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
      validator: (value) {
        if (value != depositAmountController.text.trim()) {
          return "Blank space";
        }
        return null;
      },
    );
  }

  Widget _depositTypeDropDown() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, bottom: 0, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: DropdownButtonFormField<DepositItem>(
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.green),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.green),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(width: 1, color: Colors.red)),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              items: _depositTypeList,
              value: _depositTypeValue,
              hint: Text(
                AppStrings.depositTypeLabel,
                style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontWeight: FontWeight.normal),
              ),
              onChanged: (DepositItem value) {
                setState(() {
                  _depositTypeValue = value;
                  _depositTypeString = _depositTypeValue.id.toString();
                  _schemeMonth = value.schememonth;
                  print("_schemeMonth-->" + _schemeMonth.toString());
                  if (_schemeMonth > 0) {
                    _depositTypeValue = value;
                    depositAmountController.text = value.firstamount.toString();
                    print(depositAmountController.text.toString());
                    print("_isDepositId-->"+_depositTypeString.toString());
                  } else {
                    _depositTypeValue = value;
                    depositAmountController.text = value.amount.toString();
                    print(depositAmountController.text.toString());
                    print("_isDepositId-->"+_depositTypeString.toString());
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
                  AppStrings.msgSchemeDetail = "Deposit Name = " +
                      AppStrings.depositName +
                      "\nDeposit Amount = " +
                      AppStrings.depositAmountController.toString() +
                      "\nSchemeMonth = " +
                      _schemeMonth.toString() +
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
          Flexible(
            flex: 2,
            child: ButtonWidget(
                textButton: "Detail",
                onPressed: () {
                  _showdepositAmountControllerDialog(AppStrings.msgSchemeDetail);
                }),
          )
        ],
      ),
    );
  }

  getDepositDetailButton(title, {alignment}) {
    return ButtonWidget(
        textButton: title,
        onPressed: () {
          _showdepositAmountControllerDialog(AppStrings.msgSchemeDetail);
        });
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
      validator: (value) {
        if (value != houseNumberController.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty) {
          return "Please enter house number";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
      },
    );
  }

  Widget _buildingNumberWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.buildingNumberLabel,
      hintText: AppStrings.buildingNumberLabel,
      controller: buildingNumberController,
      textInputType: TextInputType.text,
      validator: (value) {
        if (value != buildingNumberController.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty) {
          return "Please enter building number";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
      },
    );
  }

  Widget _apartmentWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.addressLabel,
      hintText: AppStrings.addressLabel,
      controller: colonySocietyApartmentController,
      textInputType: TextInputType.text,
      validator: (value) {
        if (value != colonySocietyApartmentController.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty) {
          return "Please enter Colony/Society/Apartment";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
      },
    );
  }

  Widget _streetNameWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.streetNameLabel,
      hintText: AppStrings.streetNameLabel,
      controller: streetNameController,
      textInputType: TextInputType.text,
      validator: (value) {
        if (value != streetNameController.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty) {
          return "Please enter street name";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
      },
    );
  }

  Widget _townWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.townLabel,
      hintText: AppStrings.townLabel,
      controller: townController,
      textInputType: TextInputType.name,
      validator: (value) {
        if (value != townController.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty) {
          return "Please enter the town";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
      },
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
          getAllDistrictId = value.id;
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
        validator: (value) {
          if (value != pinCodeController.text.trim()) {
            return "Blank space";
          } else if (value.isEmpty) {
            return "Please enter Pin Number";
          } else if (value.length <= 5) {
            return 'Pin Number must be of 6 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
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
          flex: 4,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 8),
              child: ButtonWidget(
                textButton: AppStrings.getLocationLabel,
                onPressed: () async {
                  Position position = await _getCurrentLocation();
                  latitudeController.text = position.latitude.toStringAsFixed(3);
                  longitudeController.text = position.longitude.toStringAsFixed(3);
                },
              ),
            ),
          ),
        ),
        Flexible(
            flex: 3,
            child: TextFieldWidget(
              enabled: false,
              headingLabel: AppStrings.locationLat,
              hintText: AppStrings.locationLat,
              controller: latitudeController,
            )),
        Flexible(
          flex: 3,
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
      validator: (value) {
        if (value != landmarkController.text.trim()) {
          return "Blank space";
        }
        return null;
      },
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

  _kYCDoc1DropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.kYCDoc1Label,
      hint: AppStrings.kYCDoc1Label,
      items: _kYCDoc1List,
      value: _kYCDoc1Value,
      onChanged: (OptionItem value) {
        setState(() {
          _kYCDoc1Value = value;
        });
      },
    );
  }

  Widget _chequeAccountNoWidget() {
    return TextFieldWidget(
        maxLength: 20,
        headingLabel: AppStrings.chequeAccountNoLabel,
        hintText: AppStrings.chequeAccountNoLabel,
        controller: chequeAccountNoController,
        textInputType: TextInputType.text,
        validator: (value) {
          if (value != chequeAccountNoController.text.trim()) {
            return "Blank space";
          } else if (value.isEmpty) {
            return "Please enter bank account number";
          } else if (value.length <= 7) {
            return 'bank account number must be of 6 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        });
  }

  Widget _chequeMICRNoWidget() {
    return TextFieldWidget(
        headingLabel: AppStrings.chequeMICRNoLabel,
        hintText: AppStrings.chequeMICRNoLabel,
        maxLength: 9,
        controller: chequeMICRNoController,
        textInputType: TextInputType.number,
        validator: (value) {
          if (value != chequeMICRNoController.text.trim()) {
            return "Blank space";
          } else if (value.isEmpty) {
            return "Please enter MICR Code";
          } else if (value.length <= 8) {
            return 'MICR Code must be of 9 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        });
  }

  /////////////////////////////  image 1 ///////////////////////////////////////
  Future<void> _openOwnerConsentImageSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getOwnerConsentImage(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getOwnerConsentImage(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getOwnerConsentImage({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          customerConsentImageFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("customerConsentCatch--->"+e.toString());
    }
  }

  Future<void> _openFrontImageSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            await getFrontImage(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            await getFrontImage(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getFrontImage({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          frontImageFile = pickedFile.path;
          print(frontImageFile.toString());
        });
      }
    } catch (e) {
      print("frontImageFileCatch--->"+e.toString());
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
            getBackImage(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getBackImage(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getBackImage({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          backImageFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("backImageFileCatch--->"+e.toString());
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
            getEleBillFrontImage(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getEleBillFrontImage(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getEleBillFrontImage({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          electricBillFrontImgFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("EleBillFrontCatch--->"+e.toString());
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
            getEleBackImage(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getEleBackImage(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getEleBackImage({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          electricBillBackImgFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("electricBillBackCatch--->"+e.toString());
    }
  }

  Future<void> _openNocFrontImgSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getNocFrontImgImage(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getNocFrontImgImage(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getNocFrontImgImage({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          nocFrontImgFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("NocFrontCatch--->"+e.toString());
    }
  }

  Future<void> _openNocBackImgSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getNocBackImgImage(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getNocBackImgImage(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getNocBackImgImage({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          nocBackImgFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("NocBackCatch--->"+e.toString());
    }
  }

  Future<void> _openCustomerImgSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getCustomerImage(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getCustomerImage(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getCustomerImage({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          uploadCustomerImgFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("uploadCustomerCatch--->"+e.toString());
    }
  }

  Future<void> _openHouseImgSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getHouseImg(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getHouseImg(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getHouseImg({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          uploadHouseImgFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("uploadHouseCatch--->"+e.toString());
    }
  }

  Future<void> _openConsentImgSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getConsentImgImage(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getConsentImgImage(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getConsentImgImage({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          ownerConsentImageFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("ownerConsentCatch--->"+e.toString());
    }
  }

  Future<void> _openChqCancelledImgSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getChqCancelledImg(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getChqCancelledImg(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getChqCancelledImg({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          chqCancelledPhotoFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("chqCancelledCatch--->"+e.toString());
    }
  }

  Future<void> _openChqImgSource({BuildContext context, PhotoController controller}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () {
            Navigator.of(context).pop();
            getChqImg(photoController: controller, imageSource: ImageSource.gallery);
          },
          onTapCamera: () {
            Navigator.of(context).pop();
            getChqImg(photoController: controller, imageSource: ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> getChqImg({PhotoController photoController, ImageSource imageSource}) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 75);
      if (pickedFile != null || photoController != null) {
        setState(() {
          chqPhotoFile = pickedFile.path;
        });
      }
    } catch (e) {
      print("chqPhotoCatch--->"+e.toString());
    }
  }

  Widget _ownerConsentImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.customerConsentImgLabel),
        InkWell(
            onTap: () => _openOwnerConsentImageSource(context: context, controller: ownerConsentImageController),
            child: customerConsentImageFile != null && customerConsentImageFile.isNotEmpty ? _fileImage(fileImage: File(customerConsentImageFile)) : _localBorderImg()),
      ],
    );
  }

  Widget _frontImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.idFrontImgSide),
        InkWell(
            onTap: () => _openFrontImageSource(context: context, controller: frontImageController),
            child: frontImageFile != null && frontImageFile.isNotEmpty ? _fileImage(fileImage: File(frontImageFile)) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _backImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.idBackImgSide),
        InkWell(
            onTap: () => _openBackImageSource(context: context, controller: backImageController),
            child: backImageFile != null && backImageFile.isNotEmpty ? _fileImage(fileImage: File(backImageFile)) : _localBorderImg()
        ),
      ],
    );
  }

  Widget _electricBillFrontImgWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.electricBillFrontImgLabel),
        InkWell(
            onTap: () => _openEleBillFrontSource(context: context, controller: eleBillFrontImgController),
            child: electricBillFrontImgFile != null && electricBillFrontImgFile.isNotEmpty ? _fileImage(fileImage: File(electricBillFrontImgFile)) : _localBorderImg()),
      ],
    );
  }

  Widget _electricBillBackImgWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.electricBillBackImgLabel),
        InkWell(
            onTap: () => _openEleBackSource(context: context, controller: eleBillBackImgController),
            child: electricBillBackImgFile != null && electricBillBackImgFile.isNotEmpty ? _fileImage(fileImage: File(electricBillBackImgFile)) : _localBorderImg()),
      ],
    );
  }

  Widget _nocFrontImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.nocFrontImgLabel),
        InkWell(
            onTap: () => _openNocFrontImgSource(context: context, controller: nocFrontImgController),
            child: nocFrontImgFile != null && nocFrontImgFile.isNotEmpty ? _fileImage(fileImage: File(nocFrontImgFile)) : _localBorderImg()),
      ],
    );
  }

  Widget _nocBackImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.nocBackImgLabel),
        InkWell(
            onTap: () => _openNocBackImgSource(context: context, controller: nocBackImgController),
            child: nocBackImgFile != null && nocBackImgFile.isNotEmpty ? _fileImage(fileImage: File(nocBackImgFile)) : _localBorderImg()),
      ],
    );
  }

  Widget _customerImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.customerImgLabel),
        InkWell(
            onTap: () => _openCustomerImgSource(context: context, controller: customerImgController),
            child: uploadCustomerImgFile != null && uploadCustomerImgFile.isNotEmpty ? _fileImage(fileImage: File(uploadCustomerImgFile)) : _localBorderImg()),
      ],
    );
  }

  Widget _rowWidget({Widget widget1, Widget widget2}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, bottom: 0, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: widget1),
          Flexible(child: widget2)],
      ),
    );
  }

  Widget _houseNumImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.houseImgLabel),
        InkWell(
            onTap: () => _openHouseImgSource(context: context, controller: houseImgController),
            child: uploadHouseImgFile != null && uploadHouseImgFile.isNotEmpty ? _fileImage(fileImage: File(uploadHouseImgFile)) : _localBorderImg()),
      ],
    );
  }

  Widget _consentImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.consentPhotoLabel),
        InkWell(
            onTap: () => _openConsentImgSource(context: context, controller: consentImageController),
            child: ownerConsentImageFile != null && ownerConsentImageFile.isNotEmpty ? _fileImage(fileImage: File(ownerConsentImageFile)) : _localBorderImg()),
      ],
    );
  }

  Widget _cancelChqImageWidget() {
    return Column(
      children: [
        _imageNameWidget(imageName: AppStrings.chqCancelledPhotoLabel),
        InkWell(
            onTap: () => _openChqCancelledImgSource(context: context, controller: cancelChqImageController),
            child: chqCancelledPhotoFile != null && chqCancelledPhotoFile.isNotEmpty ? _fileImage(fileImage: File(chqCancelledPhotoFile)) : _localBorderImg()),
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
            child: chqPhotoFile != null && chqPhotoFile.isNotEmpty ? _fileImage(fileImage: File(chqPhotoFile)) : _localBorderImg()),
      ],
    );
  }

  Widget _kYCDoc3NoWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.kYCDoc3NoLabel,
      hintText: AppStrings.kYCDoc3NoLabel,
      controller: kYCDoc3NoController,
      textInputType: TextInputType.text,
      maxLength: 20,
      validator: (value) {
        if (value != kYCDoc3NoController.text.trim()) {
          return "Blank space";
        }
        return null;
      },
    );
  }

  Widget _kYCDoc1NoWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.kYCDoc1NoLabel,
      hintText: AppStrings.kYCDoc1NoLabel,
      controller: kYCDoc1NoController,
      textInputType: TextInputType.text,
      maxLength: 20,
      validator: (value) {
        if (value != kYCDoc1NoController.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty) {
          return "Please enter id proof no.";
        }
        return null;
      },
    );
  }

  Widget _kYCDoc2NoWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.kYCDoc2NoLabel,
      hintText: AppStrings.kYCDoc2NoLabel,
      controller: kYCDoc2NoController,
      textInputType: TextInputType.text,
      maxLength: 20,
      validator: (value) {
        if (value != kYCDoc2NoController.text.trim()) {
          return "Blank space";
        }
        return null;
      },
    );
  }

  Widget _kYCDoc2DropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.kYCDoc2Label,
      hint: AppStrings.kYCDoc2Label,
      items: _kYCDoc2List,
      value: _kYCDoc2Value,
      onChanged: (OptionItem value) {
        log(value.id);
        setState(() {
          _kYCDoc2ValueString = value.id;
          _kYCDoc2Value = value;
        });
      },
    );
  }

  Widget _kYCDoc3DropDown() {
    return ReusedDropDownOptionItem(
      textLabel: AppStrings.kYCDoc3Label,
      hint: AppStrings.kYCDoc3Label,
      items: _kycProofDropdownItems,
      value: _kYCDocument3Value,
      onChanged: (value) {
        log(value.id);
        setState(() {
          _kYCDocument3Value = value;
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
          billingModeId = value.id;
          billingModeValue = value;
        });
      },
    );
  }

  Widget _customerBankDropDown() {
    return ReusedDropDownString(
      textLabel: AppStrings.customerBankNameLabel,
      hint: AppStrings.customerBankNameLabel,
      items: _customerBankNameList!= null ?_customerBankNameList.map((String item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList() :[],
      value: _customerBankValue,
      onChanged: (value) {
        setState(() {
          _customerBankValue = value;
          print("CustomerBankValue-->" + _customerBankValue);
        });
      },
    );
  }

  Widget _customerBackNoWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.customerAccountNoLabel,
      hintText: AppStrings.customerAccountNoLabel,
      controller: customerAccountNum,
      textInputType: TextInputType.text,
      maxLength: 20,
      /*  validator: (value) {
          if (value != customerAccountNum.text.trim()) {
            return "Blank space";
          } else if (value.isEmpty) {
            return "Please enter Customer Account Number";
          } else if (value.length <= 16) {
            return "Customer Account Number must be of 17 digit";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        }*/
    );
  }

  Widget _customerIFSCCodeWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.customerIfscCodeLabel,
      hintText: AppStrings.customerIfscCodeLabel,
      controller: customerIFSCController,
      textInputType: TextInputType.text,
      maxLength: 11,
      /*  validator: (value) {
          if (value != IFSCController.text.trim()) {
            return "Blank space";
          } else if (value.isEmpty) {
            return "Please enter Customer Ifsc Code";
          } else if (value.length <= 10) {
            return "Customer Ifsc Code must be of 11 digit";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        }*/
    );
  }

  Widget _customerBankAddWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.customerBankAddLabel,
      hintText: AppStrings.customerBankAddLabel,
      controller: customerBankAddController,
      textInputType: TextInputType.text,
      /*  validator: (value) {
        if (value != bank_address.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty) {
          return "Please enter the customer bank address";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
      },*/
    );
  }

  Widget _depositStatusDropDown() {
    return ReusedDropDownOptionItem(
      textLabel: "",
      hint: AppStrings.depositStatusLabel,
      items: dropListDepositStatusList,
      value: depositStatusValue,
      onChanged: (value) {
        setState(() {
          _depositStatusId = value.id;
          depositStatusValue = value;
          if (_depositStatusId != '2') {
            reasonDepositStatusController.text = '';
          }
        });
      },
    );
  }

  Widget _reasonDepositStatusWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.reasonDepositLabel,
      hintText: AppStrings.reasonDepositLabel,
      controller: reasonDepositStatusController,
      textInputType: TextInputType.text,
      validator: (value) {
        if (value != reasonDepositStatusController.text.trim()) {
          return "Blank space";
        }
        return null;
      },
    );
  }

  Widget _modeDepositDropDown() {
    return ReusedDropDownOptionItem(
        textLabel: AppStrings.modeOfDepositLabel,
        hint: AppStrings.modeOfDepositLabel,
        items: modeOfDepositList,
        value: modeDepositValue,
        onChanged: (OptionItem item) {
          setState(() {
            modeOfDepositString = item.id;
            modeDepositValue = item;
            print("_modeOfDeposit-->" + modeOfDepositString.toString());
          });
          if (modeDepositValue.id == "2") {
            setState(() {
              modeOfDepositString = item.id;
              modeDepositValue.id = item.id;
              chqNOController.clear();
              chequeAccountNoController.text = "";
              chequeMICRNoController.text = "";
              chequeMICRNoController.clear();
              chequeDateController.clear();
              chqDateController.text = "";
            });
          } else if (modeDepositValue.id == "1") {
            setState(() {
              modeOfDepositString = item.id;
              modeDepositValue.id = item.id;
            });
          }
        });
  }

  Widget _chqNoWidget() {
    return TextFieldWidget(
        headingLabel: AppStrings.chqNoLabel,
        hintText: AppStrings.chqNoLabel,
        controller: chqNOController,
        maxLength: 6,
        textInputType: TextInputType.number,
        validator: (value) {
          if (value != chqNOController.text.trim()) {
            return "Blank space";
          } else if (value.isEmpty) {
            return "Please enter Cheque Number";
          } else if (value.length <= 5) {
            return 'Cheque Number must be of 6 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        }
    );
  }

  Widget _chequeDateWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.depositDateLabel,
      prefixIcon: Icon(Icons.calendar_today),
      hintText: AppStrings.depositDateLabel,
      controller: chequeDateController,
      readOnly: true,
      textInputType: TextInputType.datetime,
      onTap: () => _selectDate(context),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015), lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        chequeDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
  }

  Widget _payementBankNameDropDown() {
    return ReusedDropDownString(
      textLabel: AppStrings.payementBankNameLabel,
      hint: AppStrings.payementBankNameLabel,
      items:  _payementBankNameList.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      value: _payementBankValue,
      onChanged: (String value) {
        setState(() {
          _payementBankValue = value;
          print("_payementBankValue--->" + _payementBankValue);
        });
      },
    );
  }

  Widget _buildCardWidget({String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Card(
        shape: Border(
          left: BorderSide(color: Colors.red, width: 8),
          right: BorderSide(color: Colors.blue.shade900, width: 8),
        ),
        elevation: 5,
        shadowColor: Colors.lightBlueAccent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _localBorderImg() {
    return CircleAvatar(
      radius: 41,
      backgroundColor: Colors.blue.shade900,
      child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/place_holder.png'),
            ),
          )),
    );
  }

  Widget _fileImage({
    File fileImage,
  }) {
    if (fileImage.path.isNotEmpty) {
      return CircleAvatar(
        radius: 41,
        backgroundColor: Colors.blue.shade900,
        child: CircleAvatar(
          radius: 40,
          backgroundImage: FileImage(fileImage),
        ),
      );
    } else {
      return CircleAvatar(
        radius: 41,
        child: CircleAvatar(
          backgroundImage: FileImage(fileImage),
          radius: 40,
        ),
      );
    }
  }

  Widget _imageNameWidget({String imageName}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Text(
          imageName,
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget _buildRow({String leading, String trailing}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(leading.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),)),
              Flexible(child: Text(trailing,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12)))
            ],
          ),
        ),
        Divider()
      ],
    );
  }

  Widget _imageColumn({Widget leadingImg, Widget trailingImg}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: leadingImg),
              Flexible(child: trailingImg)
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  Future<void> fetchDistrict() async {
    var resAllDistrict = prefs.getString(GlobalConstants.AllDistrict);
    List dataChargeList = json.decode(resAllDistrict);
    List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
      dataChargeList.length,
          (i) => DropdownMenuItem(
        value: OptionItem(id: dataChargeList[i]['id'], title: dataChargeList[i]['district_name']),
        child: Text("${dataChargeList[i]['district_name']}"),
      ),
    );
    if (!mounted) return;
    setState(() {
      getAllDistrictItems = menuItems;
      if (widget.isUpdate == true) {
        if (widget.studentModel.districtId != null) {
          districtValue = getAllDistrictItems.firstWhere((element) => element.value.id == widget.studentModel.districtId, orElse: null).value;
        }
      }
    });
  }

  Future<void> fetchArea(String id) async {
    var resArea = prefs.getString(GlobalConstants.area);
    List dataList = json.decode(resArea);
    List<DropdownMenuItem<OptionItem>> menuItems = [];
    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i]['charge_area_id'] == id) {
        menuItems.add(DropdownMenuItem(
          value: OptionItem(id: dataList[i]['gid'], title: dataList[i]['area_name']),
          child: Text("${dataList[i]['area_name']}"),
        ));
      }
    }
    if (!mounted) return;
    setState(() {
      areaItems = menuItems;
      if (widget.isUpdate == true) {
        if (widget.studentModel.areaId != null) {
          areaTypeValue = areaItems.firstWhere((element) => element.value.id == widget.studentModel.areaId, orElse: null).value;
        }
      }
    });
  }

  Future<void> fetchChargeAreaList() async {
    var resChargeAreaName = prefs.getString(GlobalConstants.chargeAreaName);
    List dataChargeList = json.decode(resChargeAreaName);
    //   _toastMsg(dataList.toString());
    log(dataChargeList.toString());
    List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
      dataChargeList.length,
          (i) => DropdownMenuItem(
        value: OptionItem(id: dataChargeList[i]['gid'], title: dataChargeList[i]['charge_area_name']),
        child: Text("${dataChargeList[i]['charge_area_name']}"),
      ),
    );
    if (!mounted) return;
    setState(() {
      chargeAreaItems = menuItems;
      if (widget.isUpdate == true) {
        if (widget.studentModel.chargeArea != null) {
          chargeAreaType = chargeAreaItems.firstWhere((element) => element.value.id == widget.studentModel.chargeArea, orElse: null).value;
        }
      }
    });
    if (widget.isUpdate == true) {
      fetchArea(chargeAreaType.id);
    } else {
      fetchArea(dataChargeList[0]['gid']);
    }
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
      dataList.length,
          (i) => DropdownMenuItem(
        value: OptionItem(id: dataList[i]['id'], title: dataList[i]['name']),
        child: Text("${dataList[i]['name']}"),
      ),
    );
    if (!mounted) return;
    setState(() {
      propertyCategoryList = menuItems;
      propertyCategoryValue = menuItems.first.value;
      if (widget.isUpdate == true) {
        if (widget.studentModel.propertyCategoryId != null) {
          propertyCategoryValue = propertyCategoryList.firstWhere((element) => element.value.id == widget.studentModel.propertyCategoryId, orElse: null).value;
        }
      }
    });
  }

  Future<void> _getPropertyClass() async {
    var resPropertyClass = prefs.getString(GlobalConstants.propertyclass);
    List dataList = json.decode(resPropertyClass);
    List<DropdownMenuItem<OptionItem>> menuItems = [];
    menuItems = List.generate(
      dataList.length,
          (i) => DropdownMenuItem(
        value: OptionItem(id: dataList[i]['id'], title: dataList[i]['name']),
        child: Text("${dataList[i]['name']}"),
      ),
    );
    if (!mounted) return;
    setState(() {
      propertyClassList = menuItems;
      propertyClassValue = menuItems.first.value;
      if (widget.isUpdate == true) {
        if (widget.studentModel.propertyClassId != null) {
          propertyClassValue = propertyClassList.firstWhere((element) => element.value.id == widget.studentModel.propertyClassId, orElse: null).value;
        }
      }
    });
  }

  Future<void> _getKYCDoc1Data() async {
    var resIdentityProof = prefs.getString(GlobalConstants.IdentityProof);
    final decoded = jsonDecode(resIdentityProof) as Map;
    decoded.forEach((k, v) {
      _kYCDoc1List.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    _kYCDoc1Value = _kYCDoc1List.first.value;
    if (widget.isUpdate == true) {
      if (widget.studentModel.kycDocument1 != null) {
        _kYCDoc1Value = _kYCDoc1List.firstWhere((element) => element.value.id == widget.studentModel.kycDocument1).value;
      }
    }
    setState(() {});
  }

  Future<void> _getKYCDoc2Data() async {
    var resOwnershipProof = prefs.getString(GlobalConstants.OwnershipProof);
    final decoded = jsonDecode(resOwnershipProof) as Map;
    decoded.forEach((k, v) {
      _kYCDoc2List.add(DropdownMenuItem(
        value: OptionItem(id: k, title: v),
        child: Text(v),
      ));
    });
    _kYCDoc2Value = _kYCDoc2List.first.value;
    _kYCDoc2ValueString = _kYCDoc2Value.id;

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
    _kYCDocument3Value = _kycProofDropdownItems.first.value;
    if (widget.isUpdate == true) {
      if (widget.studentModel.kycDocument3 != null) {
        _kYCDocument3Value = _kycProofDropdownItems.firstWhere((element) => element.value.id == widget.studentModel.kycDocument3, orElse: null).value;
      }
    }
    setState(() {});
  }

  Future<void> _getBankData() async {
    var resAllBanks = prefs.getString(GlobalConstants.AllBanks);
    final decoded = (jsonDecode(resAllBanks) as List<dynamic>).cast<String>();
    log("getBankGetBank---> $resAllBanks");
    setState(() {
      _customerBankNameList = decoded;
      if(widget.isUpdate == true){
        if (widget.studentModel.nameOfBank != null) {
          _customerBankValue = _customerBankNameList.firstWhere((element) => element == widget.studentModel.nameOfBank, orElse: null);
        }
      }
    });
  }

  Future<void> _getPayementBankData() async {
    var resAllBanks = prefs.getString(GlobalConstants.AllBanks);
    final decoded = (jsonDecode(resAllBanks) as List<dynamic>).cast<String>();
    log("getBankGetBank2--> $resAllBanks");
    setState(() {
      _payementBankNameList = decoded;
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
      billingModeId = billingModeValue.id;
      if (widget.isUpdate == true) {
        if (widget.studentModel.billingModel != null) {
          billingModeValue = billingModeList.firstWhere((element) => element.value.id == widget.studentModel.billingModel, orElse: null).value;
        }
      }
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
    __acceptConversionPolicyValueId = __acceptConversionPolicyValue.id;
    if (widget.isUpdate == true) {
      if (widget.studentModel.acceptConversionPolicy != null) {
        __acceptConversionPolicyValue = _acceptConversionPolicyList.firstWhere((element) => element.value.id == widget.studentModel.acceptConversionPolicy, orElse: null).value;
      }
    }
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
    __acceptExtraFittingCostValueId = acceptExtraFittingCostValue.id;
    if (widget.isUpdate == true) {
      if (widget.studentModel.acceptExtraFittingCost != null) {
        acceptExtraFittingCostValue = _acceptExtraFittingCostList.firstWhere((element) => element.value.id == widget.studentModel.acceptExtraFittingCost, orElse: null).value;
      }
    }
    setState(() {});
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
    setState(() {
      if (widget.isUpdate == true) {
        if (widget.studentModel.modeOfDeposite != null) {
          modeDepositValue = modeOfDepositList.firstWhere((element) => element.value.id == widget.studentModel.modeOfDeposite, orElse: null).value;
        }
      }
      //   modeOfDepositString = modeDepositValue.id;
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
      if (widget.isUpdate == true) {
        if (widget.studentModel.initialDepositeStatus != null) {
          depositStatusValue = dropListDepositStatusList.firstWhere((element) => element.value.id == widget.studentModel.initialDepositeStatus, orElse: null).value;
        }
      }
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
    menuItems2 = List.generate(
      dataList.length,
          (i) => DropdownMenuItem(
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
      ),
    );
    menuItems.addAll(menuItems2);
    if (!mounted) return;
    setState(() {
      _depositTypeList = menuItems;
      if (widget.isUpdate) {
        if (widget.studentModel.depositeType != null) {
          _depositTypeValue = _depositTypeList.firstWhere((element) => element.value.id.toString() == widget.studentModel.depositeType, orElse: null).value;
          //  depositAmountController.text = _depositCategoryType.amount.toString();
          print("asdfghjgfedwsqawegtfhj"+_depositTypeValue.amount.toString());
        }
      }
    });
    return;
  }

  Future<void> fetchLabels() async {
    String strUrl = GlobalConstants.getLabels;
    final response = await http.get(
      Uri.parse(strUrl),
    );
    var album = HpclLabals.fromJson(json.decode(response.body));
    var registration = album.deposit;
    // AppStrings.mobileNoLabel = album.steps.mobile;
    // AppStrings.firstNameLabel = album.steps.firstname;
    //  AppStrings.middleNameLabel = album.steps.middlename;
    // AppStrings.lastNameLabel = album.steps.lastname;
    //  AppStrings.btnLabel = album.steps.button;
    AppStrings.feeChargeLabel = "fee charge";
    //  AppStrings.depositStatusLabel = registration.depositSta;
    //   AppStrings.reasonLabel = registration.reason;
    //   AppStrings.modeOfDepositLabel = registration.modeOfDep;
    //   AppStrings.depositDateLabel = registration.depositDate;
    //  schemeTypeLabel = registration.depositType;
    //  AppStrings.depositAmountControllerLabel = registration.depositAmt;
    //   AppStrings.chqNoLabel = registration.chqNum;
    //   AppStrings.chqBankLabel = registration.chqBank;
    //  AppStrings.accountNoLabel = registration.bankAcc;
    //  AppStrings.chqPhotoLabel = registration.chqPhoto;
    //  AppStrings.formStatusLabel = registration.payStatus;
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
}
