import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/helper/DropDownCustom.dart';
import 'package:pbg_app/helper/DropDownCustomDeposit.dart';
import 'package:pbg_app/models/GetAllDistrictModel.dart';
import 'package:pbg_app/models/GetLabelModel.dart';
import 'package:pbg_app/models/save_customer_registration_offline_model.dart';
import 'package:pbg_app/screens/Registration.dart';
import 'package:pbg_app/screens/Widget/customer_form_helper.dart';
import 'package:pbg_app/screens/custom_input_form/presentation/widget/border_form_widget.dart';
import 'package:pbg_app/screens/custom_input_form/presentation/widget/card_image_widget.dart';
import 'package:pbg_app/utils/common_widgets/app_color.dart';
import 'package:pbg_app/utils/common_widgets/app_string.dart';
import 'package:pbg_app/utils/common_widgets/app_style.dart';
import 'package:pbg_app/utils/common_widgets/button_widget.dart';
import 'package:pbg_app/utils/common_widgets/message_box_two_button_pop.dart';
import 'package:pbg_app/utils/common_widgets/text_form_field_widget.dart';
import 'package:pbg_app/utils/common_widgets/custom_app_bar.dart';
import 'package:pbg_app/utils/common_widgets/custom_toast.dart';
import 'package:pbg_app/utils/common_widgets/global_constant.dart';
import 'package:pbg_app/utils/common_widgets/open_image_source.dart';
import 'package:pbg_app/utils/common_widgets/photo_controller.dart';
import 'package:pbg_app/utils/reused_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class CustomInputForm extends StatefulWidget {
  final bool isUpdate;
  final int position;
  final SaveCustomerRegistrationOfflineModel studentModel;
  CustomInputForm({Key key, this.isUpdate, this.position, this.studentModel})
      : super(key: key);

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

  List<DropdownMenuItem<OptionItem>> interestedListItems = [];
  OptionItem interestedValue;
  String interestedId = '';

  Box<SaveCustomerRegistrationOfflineModel> customerRegistrationBox;
  List<SaveCustomerRegistrationOfflineModel> customerRegistrationList;

  bool error = false;
  String dateAndTime = '';
  bool fDepositeSiteCheck = false;
  bool fDepositeDate = false;
  final picker = ImagePicker();
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

  var checkDepositeDate;
  String selectedDropDownValue = "";

  @override
  void initState() {
    getData();
    updateValue();
    super.initState();
  }

  getData() async {
   await getLocalData();
   await _getCurrentLocation();
  }

  updateValue() {
    if (widget.isUpdate) {
      mobileNoController.text = widget.studentModel.mobileNumber;
      alternateMobileNoController.text = widget.studentModel.alternateMobileNo;
      firstNameController.text = widget.studentModel.firstName;
      middleNameController.text = widget.studentModel.middleName;
      lastNameController.text = widget.studentModel.lastName;
      guardianNameController.text = widget.studentModel.guardianName;
      reasonInterestedController.text = widget.studentModel.residentStatus;
      emailIdController.text = widget.studentModel.emailId;
      colonySocietyApartmentController.text =
          widget.studentModel.colonySocietyApartment;
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
      interestedId = widget.studentModel.interested;
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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
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
              titleAppBar: "Customer Input",
              actions: [],
            ),
          ),
          body: _buildLayout()),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
        context: context,
        builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
            message: "Do you want to exit an App?",
            okButtonText: "Exit",
            onPressed: () =>  Navigator.of(context).pop(true)
        ))
    ) ?? false;
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
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
      Position position =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitudeController.text = position.latitude.toString();
      longitudeController.text = position.longitude.toString();
      return position;
    }catch(e) {
      log(e);
    }

  }

  TextEditingController searchController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController alternateMobileNoController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController reasonInterestedController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController colonySocietyApartmentController =
  TextEditingController();
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

  String cookInFuelValue;

  OptionItem propertyClassValue;

  OptionItem guardianType;
  String guardianTypeId = '0';

  String guardianTypeValue;

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
    fetchLabel();
    fetchDistrict();
    fetchDistrictTest();
    fetchChargeAreaList();
    interestedList();
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
    modeOfDepositString =
    modeDepositValue == null ? modeOfDepositString : modeDepositValue.id;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: formGlobalKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _interestedDropDown(),
              AppStyle.vertical(context),
              interestedId == '0' ? _reasonInterestedWidget() : Container(),
              AppStyle.vertical(context),
              _chargeAreaDropDown(),
              AppStyle.vertical(context),
              _areaDropDown(),
              AppStyle.vertical(context),
              _mobileWidget(),
              _alternateMobileWidget(),
              _firstNameWidget(),
              AppStyle.vertical(context),
              _middleWidget(),
              AppStyle.vertical(context),
              _lastNameWidget(),
              AppStyle.vertical(context),
              _guardianTypeDropDown(),
              AppStyle.vertical(context),
              _guardianNameWidget(),
              AppStyle.vertical(context),
              _emailWidget(),
              AppStyle.vertical(context),
              if(interestedId == '1')...[
                Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child:  _propertyCategoryDropDown(),),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Flexible(
                          flex: 3,
                          child:  _propertyClassDropDown(),)
                      ],
                    ),
                    AppStyle.vertical(context),
                  ],
                ),
              ],
              _buildingNumberWidget(),
              AppStyle.vertical(context),
              _houseNumberWidget(),
              AppStyle.vertical(context),
              _apartmentWidget(),
              AppStyle.vertical(context),
              _streetNameWidget(),
              AppStyle.vertical(context),
              _townWidget(),
              AppStyle.vertical(context),
              _districtWidget(),
              AppStyle.vertical(context),
              _pinCodeWidget(),
              _locationWidget(),
              if(interestedId == '0')...[
                _kYCDoc1DropDown(),
                AppStyle.vertical(context),
                _kYCDoc1NoWidget(),
                _rowWidget(
                  widget1: _frontImageWidget(),
                  widget2: _backImageWidget(),
                ),
                AppStyle.vertical(context),
                _kYCDoc2DropDown(),
                AppStyle.vertical(context),
                _kYCDoc2NoWidget(),
                _rowWidget(
                  widget1: _electricBillFrontImgWidget(),
                  widget2: _electricBillBackImgWidget(),
                ),
              ],
              if(interestedId == '1')...[
                /*  _residentStatusDropdownWidget(),
                AppStyle.vertical(context),*/
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: _noKitchenWidget(),),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                    Flexible(
                      flex: 3,
                      child: _noBathroomWidget(),),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                    Flexible(
                      flex: 3,
                      child: _noFamilyWidget(),),
                  ],
                ),
                // AppStyle.vertical(context),
                _fuelDropdownWidget(),
                AppStyle.vertical(context),
                _kYCDoc1DropDown(),
                AppStyle.vertical(context),
                _kYCDoc1NoWidget(),
                _rowWidget(
                  widget1: _frontImageWidget(),
                  widget2: _backImageWidget(),
                ),
                AppStyle.vertical(context),
                _kYCDoc2DropDown(),
                AppStyle.vertical(context),
                _kYCDoc2NoWidget(),
                _rowWidget(
                  widget1: _electricBillFrontImgWidget(),
                  widget2: _electricBillBackImgWidget(),
                ),
                AppStyle.vertical(context),
                _kYCDoc3DropDown(),
                AppStyle.vertical(context),
                BorderWidget(
                  children: [
                    _rowWidget(
                      widget1: _customerImageWidget(),
                      widget2: _kYCDocument3Value.id == '2'? _nocFrontImageWidget() : _houseNumImageWidget(),
                    ),
                    AppStyle.vertical(context),
                    _rowWidget(
                      widget1:_kYCDocument3Value.id == '1'? Container() :_houseNumImageWidget(),
                      widget2: Container(),
                    ),
                    AppStyle.vertical(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(flex: 2, child: _conversionPolicyDropDown()),
                        _width(),
                        Flexible(flex: 2, child: _fittingCostDropDown()),
                        _width(),
                        Flexible(
                          flex: 2,
                          child: interestedId == '1' ? _mdpeDropdown() : Container(),
                        ),
                      ],
                    ),
                  ],
                ),
                AppStyle.vertical(context),
                BorderWidget(
                  children: [
                    Text(AppStrings.securityDepositLabel,style: AppStyle.styleB(),),
                    AppStyle.vertical(context),
                    _depositStatusDropDown(),
                    AppStyle.vertical(context),
                    _depositStatusId != "1" ? _reasonDepositStatusWidget() : Container(),
                    AppStyle.vertical(context),
                    _depositTypeDropDown(AppStrings.schemeTypeLable, AppStrings.star,),
                    AppStyle.vertical(context),
                    _depositAmountWidget(),
                    AppStyle.vertical(context),
                    _modeDepositDropDown(),
                    AppStyle.vertical(context),
                    if (modeOfDepositString == "1") ...[
                      Column(
                        children: [
                          _chqNoWidget(),
                          AppStyle.vertical(context),
                          _chequeDateWidget(),
                          AppStyle.vertical(context),
                          _chequeAccountNoWidget(),
                          _payementBankNameDropDown(),
                          AppStyle.vertical(context),
                          _chequeAccountNoWidget(),
                          _chequeMICRNoWidget(),
                          _chequeImageWidget(),
                        ],
                      )
                    ]
                  ],
                ),

              ],
              ButtonWidget(
                textButton: !widget.isUpdate ? "Preview" : "Update",
                onPressed: () async {
                  chargeAreaId =
                  chargeAreaType == null ? chargeAreaId : chargeAreaType.id;
                  _areaTypeId =
                  areaTypeValue == null ? _areaTypeId : areaTypeValue.id;
                  getAllDistrictId =
                  districtValue == null ? getAllDistrictId : districtValue.id;
                  modeOfDepositString = modeDepositValue == null
                      ? modeOfDepositString
                      : modeDepositValue.id;
                  _depositTypeString = _depositTypeValue == null
                      ? _depositTypeString
                      : _depositTypeValue.id;

                  var textFieldValidationCheck =
                  CustomerFormHelper.textFieldValidationCheck(
                    isInterestedId: interestedId.toString(),
                    reasonNotInterested: reasonInterestedController.text.trim().toString(),
                    titleLocation: latitudeController.text.trim().toString(),
                    acceptConversionPolicyValueId:
                    __acceptConversionPolicyValueId.toString(),
                    acceptExtraFittingCostValueId:
                    __acceptExtraFittingCostValueId.toString(),
                    chargeAreaType: chargeAreaId.toString(),
                    areaTypeId: _areaTypeId.toString(),
                    mobileNoController: mobileNoController.text.toString(),
                    firstNameController: firstNameController.text.toString(),
                    lastNameController: lastNameController.text.toString(),
                    guardianNameController:
                    guardianNameController.text.toString(),
                    propertyTypeId: propertyCategoryValue.toString(),
                    propertyClassId: propertyClassValue.toString(),
                    buildingNumberController: buildingNumberController.text.toString(),
                    houseNumberController: houseNumberController.text.toString(),
                    colonySocietyApartmentController:
                    colonySocietyApartmentController.text.toString(),
                    streetNameController: streetNameController.text.toString(),
                    townController: townController.text.toString(),
                    district: getAllDistrictId.toString(),
                    pinCodeController: pinCodeController.text.toString(),
                    noOfKitchen: kitchenController.text.toString(),
                    noOfBathroom: bathroomController.text.toString(),
                    cookInFuelValue: cookInFuelValue.toString(),
                    noOfFamilyMembers: familyMemController.text.trim().toString(),
                    selectIdentification: _kYCDoc1Value.id.toString(),
                    identificationProofNo: kYCDoc1NoController.text.trim().toString(),
                    idFrontImage: frontImageFile.toString(),
                    idBackImage: backImageFile.toString(),
                    selectAddressProof: _kYCDoc2Value.id.toString(),
                    addressProofNumber: kYCDoc2NoController.text.trim().toString(),
                    addressProofFront: electricBillFrontImgFile.toString(),
                    selectOwnershipType:_kYCDocument3Value.id.toString(),
                    customerConsentImage: customerConsentImageFile.toString(),
                    nocImage:nocFrontImgFile.toString(),
                    modeOfDeposit: modeOfDepositString.toString(),
                    depositType: _depositTypeString.toString(),
                    chequeNo: chqNOController.text.trim().toString(),
                    chequeDate: chequeDateController.text.trim().toString(),
                    payementBankName: _payementBankValue,
                    bankAccNo: chequeAccountNoController.text.trim().toString(),
                    micrCode: chequeMICRNoController.text.trim().toString(),
                    chequePhoto: chqPhotoFile.toString(),
                    mdpeValue: _mdpeValue.toString(),
                    residentStatusValue: _residentStatusValue.toString(),
                  );
                  if (textFieldValidationCheck == true) {
                    if (formGlobalKey.currentState.validate()) {
                      formGlobalKey.currentState.save();
                      _showDialog();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog() {
    return showCupertinoDialog(
        context: context,
        builder: (
            context,
            ) {
          return Container(
              height: 200,
              color: Colors.white,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Text(
                          "Customer Detail",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 21,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade800),
                        ),
                      ),
                      _buildRow(
                        leading: AppStrings.interestedLabel,
                        trailing: interestedValue.title ?? "-",
                      ),
                      interestedId == '1'
                          ? _buildRow(
                        leading: AppStrings.mdpeAllowLabel,
                        trailing: _mdpeValue ?? "-",
                      )
                          : Container(),
                      interestedId == '0'
                          ? _buildRow(
                        leading: AppStrings.reasonInterestedLabel,
                        trailing:
                        reasonInterestedController.text.toString() ??
                            "-",
                      )
                          : Container(),
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
                        trailing:
                        mobileNoController.text.trim().toString() ?? "-",
                      ),
                      _buildRow(
                        leading: AppStrings.alternateMobileNoLabel,
                        trailing:
                        alternateMobileNoController.text.trim().toString() ?? "--",
                      ),
                      _buildRow(
                        leading: AppStrings.firstNameLabel,
                        trailing:
                        firstNameController.text.trim().toString() ?? "-",
                      ),
                      _buildRow(
                        leading: AppStrings.middleNameLabel,
                        trailing:
                        middleNameController.text.trim().toString() ?? "-",
                      ),
                      _buildRow(
                        leading: AppStrings.lastNameLabel,
                        trailing:
                        lastNameController.text.trim().toString() ?? "-",
                      ),
                      _buildRow(
                        leading: AppStrings.guardianTypeLabel,
                        trailing: guardianTypeValue.toString() ?? "-",
                      ),
                      _buildRow(
                        leading: interestedId == "1" ? AppStrings.guardianNameS : AppStrings.guardianNameNot,
                        trailing:
                        guardianNameController.text.trim().toString() ?? "-",
                      ),
                      _buildRow(
                        leading: AppStrings.emailAddressLabel,
                        trailing: emailIdController.text.trim().toString() ?? "-",
                      ),
                      if(interestedId == '1')...[
                        _buildRow(
                          leading: AppStrings.propertyCategoryLabel,
                          trailing:
                          propertyCategoryValue.title.toString() ?? "-",
                        ),_buildRow(
                          leading: AppStrings.propertyClassLabel,
                          trailing:
                          propertyClassValue.title.toString() ?? "-",
                        )
                      ],
                      _buildRow(
                        leading: AppStrings.buildingNumberLabel,
                        trailing:
                        buildingNumberController.text.trim().toString() ??
                            "-",
                      ),
                      _buildRow(
                        leading: AppStrings.houseNumberLabel,
                        trailing:
                        houseNumberController.text.trim().toString() ?? "-",
                      ),
                      _buildRow(
                        leading: AppStrings.apartmentLabel,
                        trailing: colonySocietyApartmentController.text
                            .trim()
                            .toString() ??
                            "-",
                      ),
                      _buildRow(
                        leading: AppStrings.streetNameLabel,
                        trailing:
                        streetNameController.text.trim().toString() ?? "-",
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
                      _buildRow(
                        leading: AppStrings.latitudeLabel,
                        trailing:
                        latitudeController.text.trim().toString() ?? "-",
                      ),
                      _buildRow(
                        leading: AppStrings.longitudeLabel,
                        trailing:
                        longitudeController.text.trim().toString() ?? "-",
                      ),
                      if(interestedId == '0')...[
                        _buildCardWidget(
                            text: AppStrings.identificationProofLabel),
                        _buildRow(
                          leading: AppStrings.kycDoc1,
                          trailing: _kYCDoc1Value.title.toString() ?? "-",
                        ),
                        _buildRow(
                          leading: AppStrings.kycDoc1No,
                          trailing:
                          kYCDoc1NoController.text.trim().toString() ?? "-",
                        ),
                        _imageColumn(
                          leadingImg: CardImageWidget(
                            imgString: AppStrings.idFrontImgSide,
                            children: frontImageFile != null && frontImageFile.isNotEmpty
                                ? frontImageFile.split('.').last == "pdf"
                                ? _pdfImageWidget(frontImageFile)
                                : ImageCircle(
                              fileImage1:
                              File(frontImageFile.toString()),
                              pathImage: frontImageFile.toString(),
                            )
                                : _localBorderImg(),),
                          trailingImg: CardImageWidget(
                            imgString: AppStrings.idBackImgSide,
                            children: backImageFile != null && backImageFile.isNotEmpty
                                ? backImageFile.split('.').last == "pdf"
                                ? _pdfImageWidget(backImageFile)
                                : ImageCircle(
                              fileImage1:
                              File(backImageFile.toString()),
                              pathImage: backImageFile.toString(),
                            )
                                : _localBorderImg(),
                          ),
                        ),
                        _buildCardWidget(text: AppStrings.ownershipProofHeading),
                        _buildRow(
                          leading: AppStrings.kycDoc2No,
                          trailing: _kYCDoc2Value.title.toString() ?? "-",
                        ),
                        _buildRow(
                          leading: AppStrings.kycDoc2,
                          trailing: kYCDoc2NoController.text.toString() ?? "-",
                        ),
                        _imageColumn(
                          leadingImg: CardImageWidget(
                            imgString: AppStrings.electricBillFrontImgLabel,
                            children: electricBillFrontImgFile != null &&
                                electricBillFrontImgFile.isNotEmpty
                                ? electricBillFrontImgFile.split('.').last ==
                                "pdf"
                                ? _pdfImageWidget(electricBillFrontImgFile)
                                : ImageCircle(fileImage1: File(electricBillFrontImgFile.toString()),
                              pathImage:
                              electricBillFrontImgFile.toString(),
                            ) : _localBorderImg(),
                          ),
                          trailingImg:CardImageWidget(
                            imgString: AppStrings.electricBillBackImgLabel,
                            children:  electricBillBackImgFile != null &&
                                electricBillBackImgFile.isNotEmpty
                                ? electricBillBackImgFile.split('.').last ==
                                "pdf"
                                ? _pdfImageWidget(electricBillBackImgFile)
                                : ImageCircle(
                              fileImage1: File(
                                  electricBillBackImgFile.toString()),
                              pathImage:
                              electricBillBackImgFile.toString(),
                            )
                                : _localBorderImg(),
                          ),
                        ),
                      ],
                      if(interestedId == '1')...[
                        _buildRow(
                          leading: AppStrings.residentStatusLabel,
                          trailing: _residentStatusValue.toString() ?? "-",
                        ),
                        _buildRow(
                          leading: AppStrings.noOfKitchenLabel,
                          trailing:
                          kitchenController.text.trim().toString() ?? "-",
                        ),
                        _buildRow(
                          leading: AppStrings.noOfBathroomLabel,
                          trailing:
                          bathroomController.text.trim().toString() ??
                              "-",
                        ),
                        _buildRow(
                          leading: AppStrings.existingCookingFuelLabel,
                          trailing: cookInFuelValue.toString() ?? "-",
                        ),
                        _buildRow(
                          leading: AppStrings.noOfFamilyMembersLabel,
                          trailing:
                          familyMemController.text.trim().toString() ??
                              "-",
                        ),
                        _buildCardWidget(
                            text: AppStrings.identificationProofLabel),
                        _buildRow(
                          leading: AppStrings.kycDoc1,
                          trailing: _kYCDoc1Value.title.toString() ?? "-",
                        ),
                        _buildRow(
                          leading: AppStrings.kycDoc1No,
                          trailing:
                          kYCDoc1NoController.text.trim().toString() ?? "-",
                        ),
                        _imageColumn(
                          leadingImg: CardImageWidget(
                            imgString: AppStrings.idFrontImgSide,
                            children: frontImageFile != null && frontImageFile.isNotEmpty
                                ? frontImageFile.split('.').last == "pdf"
                                ? _pdfImageWidget(frontImageFile)
                                : ImageCircle(
                              fileImage1:
                              File(frontImageFile.toString()),
                              pathImage: frontImageFile.toString(),
                            )
                                : _localBorderImg(),),
                          trailingImg: CardImageWidget(
                            imgString: AppStrings.idBackImgSide,
                            children: backImageFile != null && backImageFile.isNotEmpty
                                ? backImageFile.split('.').last == "pdf"
                                ? _pdfImageWidget(backImageFile)
                                : ImageCircle(
                              fileImage1:
                              File(backImageFile.toString()),
                              pathImage: backImageFile.toString(),
                            )
                                : _localBorderImg(),
                          ),
                        ),
                        _buildCardWidget(text: AppStrings.ownershipProofHeading),
                        _buildRow(
                          leading: AppStrings.kycDoc2No,
                          trailing: _kYCDoc2Value.title.toString() ?? "-",
                        ),
                        _buildRow(
                          leading: AppStrings.kycDoc2,
                          trailing: kYCDoc2NoController.text.toString() ?? "-",
                        ),
                        _imageColumn(
                          leadingImg: CardImageWidget(
                            imgString: AppStrings.electricBillFrontImgLabel,
                            children: electricBillFrontImgFile != null &&
                                electricBillFrontImgFile.isNotEmpty
                                ? electricBillFrontImgFile.split('.').last ==
                                "pdf"
                                ? _pdfImageWidget(electricBillFrontImgFile)
                                : ImageCircle(fileImage1: File(electricBillFrontImgFile.toString()),
                              pathImage:
                              electricBillFrontImgFile.toString(),
                            ) : _localBorderImg(),
                          ),
                          trailingImg:CardImageWidget(
                            imgString: AppStrings.electricBillBackImgLabel,
                            children:  electricBillBackImgFile != null &&
                                electricBillBackImgFile.isNotEmpty
                                ? electricBillBackImgFile.split('.').last ==
                                "pdf"
                                ? _pdfImageWidget(electricBillBackImgFile)
                                : ImageCircle(
                              fileImage1: File(
                                  electricBillBackImgFile.toString()),
                              pathImage:
                              electricBillBackImgFile.toString(),
                            )
                                : _localBorderImg(),
                          ),
                        ),
                        _buildCardWidget(text: AppStrings.nocDoc),
                        _buildRow(
                          leading: AppStrings.kYCDoc3,
                          trailing: _kYCDocument3Value.title.toString() ?? "-",
                        ),

                        _imageColumn(
                            leadingImg: CardImageWidget(
                              imgString: AppStrings.customerImgLabel,
                              children: uploadCustomerImgFile != null &&
                                  uploadCustomerImgFile.isNotEmpty
                                  ? uploadCustomerImgFile.split('.').last == "pdf"
                                  ? _pdfImageWidget(uploadCustomerImgFile)
                                  : ImageCircle(
                                fileImage1: File(
                                    uploadCustomerImgFile.toString()),
                                pathImage:
                                uploadCustomerImgFile.toString(),
                              )
                                  : _localBorderImg(),
                            ),
                            trailingImg: _kYCDocument3Value.id == '2'? CardImageWidget(
                              imgString: AppStrings.nocDoc,
                              children:nocFrontImgFile != null &&
                                  nocFrontImgFile.isNotEmpty
                                  ? nocFrontImgFile.split('.').last == "pdf"
                                  ? _pdfImageWidget(nocFrontImgFile)
                                  : ImageCircle(
                                fileImage1:
                                File(nocFrontImgFile.toString()),
                                pathImage: nocFrontImgFile.toString(),
                              )
                                  : _localBorderImg(),
                            ):CardImageWidget(
                              imgString: AppStrings.houseImgLabel,
                              children: uploadHouseImgFile != null &&
                                  uploadHouseImgFile.isNotEmpty
                                  ? uploadHouseImgFile.split('.').last == "pdf"
                                  ? _pdfImageWidget(uploadHouseImgFile)
                                  : ImageCircle(
                                  fileImage1:
                                  File(uploadHouseImgFile.toString()),
                                  pathImage:
                                  uploadHouseImgFile.toString())
                                  : _localBorderImg(),
                            ),
                        ),
                        _imageColumn(
                          leadingImg:_kYCDocument3Value.id == '1'? Container() :CardImageWidget(
                            imgString: AppStrings.houseImgLabel,
                            children: uploadHouseImgFile != null &&
                                uploadHouseImgFile.isNotEmpty
                                ? uploadHouseImgFile.split('.').last == "pdf"
                                ? _pdfImageWidget(uploadHouseImgFile)
                                : ImageCircle(
                                fileImage1:
                                File(uploadHouseImgFile.toString()),
                                pathImage:
                                uploadHouseImgFile.toString())
                                : _localBorderImg(),
                          ),
                          trailingImg: Container()
                        ),

                        Divider(),
                        _buildCardWidget(text: AppStrings.securityDepositLabel),
                        _buildRow(
                          leading: AppStrings.initialDepositStatusLabel,
                          trailing: depositStatusValue.title.toString() ?? "-",
                        ),
                        _depositStatusId != "1"
                            ? _buildRow(
                          leading: AppStrings.reasonDepositLabel,
                          trailing: reasonDepositStatusController.text
                              .trim()
                              .toString() ??
                              "-",
                        )
                            : Container(),
                        _buildRow(
                          leading: AppStrings.schemeTypeLable,
                          trailing: AppStrings.depositName.toString() ?? "-",
                        ),
                        _buildRow(
                          leading: AppStrings.depositAmountControllerLabel,
                          trailing:
                          depositAmountController.text.trim().toString() ??
                              "-",
                        ),
                        _buildRow(
                          leading: AppStrings.modeOfDepositLabel,
                          trailing: modeDepositValue.title.toString() ?? "-",
                        ),
                        if (modeOfDepositString == "1") ...[
                          Column(
                            children: [
                              _buildRow(
                                leading: AppStrings.chqNoLabel,
                                trailing:
                                chqNOController.text.trim().toString() ?? "-",
                              ),
                              _buildRow(
                                leading: AppStrings.depositDateLabel,
                                trailing:
                                chequeDateController.text.trim().toString() ??
                                    "-",
                              ),
                              _buildRow(
                                leading: AppStrings.payementBankNameLabel,
                                trailing: _payementBankValue.toString() ?? "-",
                              ),
                              _buildRow(
                                leading: AppStrings.chequeAccountNoLabel,
                                trailing:
                                chequeAccountNoController.text.toString() ??
                                    "-",
                              ),
                              _buildRow(
                                leading: AppStrings.chequeMICRNoLabel,
                                trailing:
                                chequeMICRNoController.text.toString() ?? "-",
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    // _imageNameWidget(imageName: AppStrings.chqPhotoLabel),
                                    chqPhotoFile != null &&
                                        chqPhotoFile.isNotEmpty
                                        ? chqPhotoFile.split('.').last == "pdf"
                                        ? _pdfImageWidget(chqPhotoFile)
                                        : ImageCircle(
                                      fileImage1:
                                      File(chqPhotoFile.toString()),
                                      pathImage:
                                      chqPhotoFile.toString(),
                                    )
                                        : _localBorderImg(),
                                    Text(AppStrings.chqPhotoLabel,style:TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12, color: Colors.black,decoration: TextDecoration.none,))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          Container()
                        ],
                        _buildRow(
                          leading: AppStrings.conversionPolicyLabel,
                          trailing: __acceptConversionPolicyValue.title ?? "-",
                        ),
                        _buildRow(
                          leading: AppStrings.fittingCostLabel,
                          trailing: acceptExtraFittingCostValue.title ?? "-",
                        ),
                      ] else ...[
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
                              textButton: "Save",
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
                ),
              ));
        });
  }

  Future<void> storeRecords() async {
    SaveCustomerRegistrationOfflineModel data =
    SaveCustomerRegistrationOfflineModel(
      interested: interestedId.toString(),
      schema: schema,
      dmaUserName: dmaUserName,
      dmaUserId: dmaId,
      // remarks : reasonInterestedController.text.trim().toString() ?? "",
      chargeArea: chargeAreaType.id.toString(),
      areaId: areaTypeValue.id.toString(),
      mobileNumber: mobileNoController.text.trim().toString(),
      alternateMobileNo: alternateMobileNoController.text.trim().toString(),
      firstName: firstNameController.text.trim().toString(),
      middleName: middleNameController.text.trim().toString(),
      lastName: lastNameController.text.trim().toString(),
      guardianType: guardianTypeValue.toString(),
      guardianName: guardianNameController.text.trim().toString(),
      houseNumber: houseNumberController.text.trim().toString(),
      colonySocietyApartment:
      colonySocietyApartmentController.text.trim().toString(),
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
      remarks: reasonDepositStatusController.text.trim().toString() ?? "",
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
      reasonForHold: landmarkController.text.trim().toString() ?? "",
      billingModel: billingModeId.toString(),
      nameOfBank:
      _customerBankValue != null ? _customerBankValue.toString() : "",
      bankAccountNumber: customerAccountNum.text.trim().toString(),
      bankIfscCode: customerIFSCController.text.trim().toString() ?? "",
      bankAddress: customerBankAddController.text.trim().toString(),
      acceptConversionPolicy: __acceptConversionPolicyValueId.toString(),
      acceptExtraFittingCost: __acceptExtraFittingCostValueId.toString(),
      initialDepositeStatus:
      interestedId == '1' ? _depositStatusId.toString() : "",
      depositeType: interestedId == '1' ? _depositTypeString : "",
      initialAmount: interestedId == '1'
          ? depositAmountController.text.trim().toString()
          : "",
      modeOfDeposite: interestedId == '1' ? modeDepositValue.id.toString() : "",
      chequeNumber:
      interestedId == '1' ? chqNOController.text.trim().toString() : "",
      initialDepositeDate: interestedId == '1'
          ? chequeDateController.text.trim().toString()
          : "",
      payementBankName:
      _payementBankValue != null ? _payementBankValue.toString() : "",
      chequeBankAccount: chequeAccountNoController.text.trim().toString() ?? "",
      micr: chequeMICRNoController.text.trim().toString() ?? "",
    );
    if (widget.isUpdate) {
      var box = await Hive.openBox<SaveCustomerRegistrationOfflineModel>(
          "saveCustRegDataBoxName");
      await box.putAt(widget.position, data);
      CustomToast.showToast('Great Success! Update Record Save');
    } else {
      var box = await Hive.openBox<SaveCustomerRegistrationOfflineModel>(
          "saveCustRegDataBoxName");
      var mmm = box.length;
      if (mmm <= 10) {
        var box = await Hive.openBox<SaveCustomerRegistrationOfflineModel>(
            "saveCustRegDataBoxName");
        await box.add(data);
        CustomToast.showToast('Great Success! Add Record Save');
      } else {
        CustomToast.showToast('Error !!!! \n Please Uploade Previous record');
      }
    }
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => RegistrationForm()), (r) => false);
  }

  Widget _interestedDropDown() {
    return ReusedDropDownOptionItem(
      star: AppStrings.star,
      textLabel: AppStrings.interestedLabel,
      hint: AppStrings.interestedLabel,
      items: interestedListItems,
      //  value: interestedValue,
      value: interestedValue,
      onChanged: (OptionItem value) {
        setState(() {
          interestedId = value.id;
          interestedValue = value;
          if (interestedId == '0') {
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
      star: AppStrings.star,
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
      star: AppStrings.star,
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
          return AppStrings.blankSpace;
        }
        return null;
      },
    );
  }

  Widget _chargeAreaDropDown() {
    return ReusedDropDownOptionItem(
      star: AppStrings.star,
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
          fetchArea(chargeAreaId ?? "");
        });
      },
    );
  }

  Widget _areaDropDown() {
    return ReusedDropDownOptionItem(
      star: AppStrings.star,
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
        star: AppStrings.star,
        headingLabel: AppStrings.mobileNoLabel,
        hintText: AppStrings.mobileNoLabel,
        controller: mobileNoController,
        textInputType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        maxLength: 10,
        validator: (value) {
          if (value != mobileNoController.text.trim()) {
            return AppStrings.blankSpace;
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

  Widget _alternateMobileWidget() {
    return TextFieldWidget(
      headingLabel: AppStrings.alternateMobileNoLabel,
      hintText: AppStrings.alternateMobileNoLabel,
      controller: alternateMobileNoController,
      textInputType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      maxLength: 10,

    );
  }

  Widget _firstNameWidget() {
    return TextFieldWidget(
      star: AppStrings.star,
      headingLabel: AppStrings.firstNameLabel,
      hintText: AppStrings.firstNameLabel,
      controller: firstNameController,
      textInputType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
      ],
      validator: (value) {
        if (value != firstNameController.text.trim()) {
          return AppStrings.blankSpace;
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
          return AppStrings.blankSpace;
        }
        return null;
      },
    );
  }

  Widget _lastNameWidget() {
    return TextFieldWidget(
      star: AppStrings.star,
      headingLabel: AppStrings.lastNameLabel,
      hintText: AppStrings.lastNameLabel,
      controller: lastNameController,
      textInputType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
      validator: (value) {
        if (value != lastNameController.text.trim()) {
          return AppStrings.blankSpace;
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
      star:interestedId == "1" ? AppStrings.star : "",
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
      star:interestedId == "1"? AppStrings.star : "",
      headingLabel:AppStrings.guardianNameNot,
      hintText: interestedId == "1" ? AppStrings.guardianNameS : AppStrings.guardianNameNot,
      controller: guardianNameController,
      textInputType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
      validator: (value) {
        if(interestedId == "1"){
          if (value != guardianNameController.text.trim()) {
            return AppStrings.blankSpace;
          } else if (value.isEmpty) {
            return "Please enter Guardian name";
          } else if (!RegExp('.*[A-Z].*').hasMatch(value ?? '')) {
            return 'Input should contain an uppercase letter A-Z.';
          } else if (value.length <= 2) {
            return "Enter a Guardian name 2+char long";
          }
          return null;
        }
      },
      onChanged: (v) {
        if(interestedId == "1"){
          formGlobalKey.currentState.validate();
        }
      },
    );
  }

  Widget _emailWidget() {
     final RegExp emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return TextFieldWidget(
      headingLabel: AppStrings.emailAddressLabel,
      hintText: "demo@gmail.com",
      controller: emailIdController,
      textCapitalization: TextCapitalization.none,
      textInputType: TextInputType.emailAddress,
       inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-z0-9@._-]")),
      ],
      validator: (value) {
        if(emailIdController.text.isNotEmpty){
          if (value != emailIdController.text.trim() ) {
            return AppStrings.blankSpace;
          } else if(!emailValid.hasMatch(value)){
            return "Enter Invalid format";
          }
          return null;
        }
        },
      onChanged: (v) {
        if(emailIdController.text.isNotEmpty){
          formGlobalKey.currentState.validate();
        }
      },
    );
  }

  Widget _propertyCategoryDropDown() {
    return ReusedDropDownOptionItem(
      star: AppStrings.star,
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
      star: AppStrings.star,
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
      star: AppStrings.star,
      enabled: false,
      headingLabel: AppStrings.depositAmountControllerLabel,
      hintText: AppStrings.depositAmountControllerLabel,
      controller: depositAmountController,
      textInputType: TextInputType.number,
      validator: (value) {
        if (value != depositAmountController.text.trim()) {
          return AppStrings.blankSpace;
        }
        return null;
      },
    );
  }

  Widget _depositTypeDropDown(String headingLabel,star) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 4,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(star ?? "", style: AppStyle.styleAlter(),),
                    Text(headingLabel ?? "", style: AppStyle.styleB(),),
                  ],
                ),
              ),
              DropdownButtonFormField<DepositItem>(
                style:  AppStyle.styleN(),
                isExpanded: true,
                isDense: false,

                iconEnabledColor:  AppColor.black,
                decoration: InputDecoration(
                  focusedBorder: AppStyle.border(color: AppColor.black),
                  disabledBorder: AppStyle.border(color: AppColor.grey),
                  enabledBorder: AppStyle.border(color: AppColor.black),
                  border: AppStyle.border(color: AppColor.black),
                  errorBorder:AppStyle.border(color: AppColor.red),
                  //label: Text(AppStrings.depositType),
                  hintText: AppStrings.schemeType,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                ),
                items: _depositTypeList,
                value: _depositTypeValue,
                hint: Text(
                    AppStrings.schemeTypeLable,
                    style:  AppStyle.styleN()),
                onChanged: (DepositItem value) {
                  setState(() {
                    _depositTypeValue = value;
                    _depositTypeString = _depositTypeValue.id.toString();
                    _schemeMonth = value.schememonth;
                    if (_schemeMonth > 0) {
                      _depositTypeValue = value;
                      depositAmountController.text = value.firstamount.toString();
                    } else {
                      _depositTypeValue = value;
                      depositAmountController.text = value.amount.toString();
                    }
                    AppStrings.depositName = value.title;
                    AppStrings.depositAmountController = value.amount.toString();
                    gasDepositAmountController = value.gas_amount;
                    schemeId = value.id;
                    AppStrings.schemeType = value.scheme_type.toString();
                    AppStrings.schemeCode = value.scheme_code.toString();
                    AppStrings.depositAmount = value.deposit_amount.toString();
                    AppStrings.equipmentDepositAmount =
                        value.equipment_deposit_amount.toString();
                    AppStrings.interestAmount = value.interest_amount.toString();
                    AppStrings.registrationGST =
                        value.registration_gst.toString();
                    AppStrings.interestTaxAmt = value.interest_tax_amt.toString();
                    AppStrings.totalAmount = value.totalAmount.toString();
                    AppStrings.nextCycleAmount = value.nextCycleAmount.toString();
                    AppStrings.registrationTaxName =
                        value.registration_tax_name.toString();
                    depositTotalAmount = value.total_amount;
                    AppStrings.interestTaxAmt = value.interest_tax_amt.toString();
                    AppStrings.regTax = value.reg_tax.toString();
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
              ),
            ],
          ),
        ),

        Flexible(
          flex: 2,
          child: ButtonWidget(
              textButton: "Detail",
              onPressed: () {
                _showdepositAmountControllerDialog(
                    AppStrings.msgSchemeDetail);
              }),
        )
      ],
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
      star: AppStrings.star,
      headingLabel: AppStrings.houseNumberLabel,
      hintText: AppStrings.houseNumberLabel,
      controller: houseNumberController,
      textInputType: TextInputType.text,
      validator: (value) {
        if (value != houseNumberController.text.trim()) {
          return AppStrings.blankSpace;
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

    );
  }

  Widget _apartmentWidget() {
    return TextFieldWidget(
      star: AppStrings.star,
      headingLabel: AppStrings.addressLabel,
      hintText: AppStrings.addressLabel,
      controller: colonySocietyApartmentController,
      textInputType: TextInputType.text,
      validator: (value) {
        if (value != colonySocietyApartmentController.text.trim()) {
          return AppStrings.blankSpace;
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
      star: AppStrings.star,
      headingLabel: AppStrings.streetNameLabel,
      hintText: AppStrings.streetNameLabel,
      controller: streetNameController,
      textInputType: TextInputType.text,
      validator: (value) {
        if (value != streetNameController.text.trim()) {
          return AppStrings.blankSpace;
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
    );
  }

  Widget _districtWidget() {
    return ReusedDropDownOptionItem(
      star: AppStrings.star,
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
        star: AppStrings.star,
        headingLabel: AppStrings.pinCodeLabel,
        hintText: AppStrings.pinCodeLabel,
        controller: pinCodeController,
        textInputType: TextInputType.number,
        maxLength: 6,
        validator: (value) {
          if (value != pinCodeController.text.trim()) {
            return AppStrings.blankSpace;
          } else if (value.isEmpty) {
            return "Please enter Pin Number";
          } else if (value.length <= 5) {
            return 'Pin Number must be of 6 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        });
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  latitudeController.text = position.latitude.toString();
                  longitudeController.text = position.longitude.toString();
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
        _width(),
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


  _kYCDoc1DropDown() {
    return ReusedDropDownOptionItem(
      star: AppStrings.star,
      textLabel: AppStrings.kycDoc1,
      hint: AppStrings.kycDoc1,
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
        star: AppStrings.star,
        maxLength: 20,
        headingLabel: AppStrings.chequeAccountNoLabel,
        hintText: AppStrings.chequeAccountNoLabel,
        controller: chequeAccountNoController,
        textInputType: TextInputType.text,
        validator: (value) {
          if (value != chequeAccountNoController.text.trim()) {
            return AppStrings.blankSpace;
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
        star: AppStrings.star,
        headingLabel: AppStrings.chequeMICRNoLabel,
        hintText: AppStrings.chequeMICRNoLabel,
        maxLength: 9,
        controller: chequeMICRNoController,
        textInputType: TextInputType.number,
        validator: (value) {
          if (value != chequeMICRNoController.text.trim()) {
            return AppStrings.blankSpace;
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


  Widget _frontImageWidget() {
    return CardImageWidget(
      star: AppStrings.star,
      imgString: AppStrings.idFrontImgSide,
      children: InkWell(
          onTap: () => _openFrontImageSource(
            context,
          ),
          child: frontImageFile != null && frontImageFile.isNotEmpty
              ? frontImageFile.split('.').last == "pdf"
              ? _pdfImageWidget(frontImageFile)
              : _fileImage(fileImage: File(frontImageFile))
              : _localBorderImg()),
    );
  }

  Widget _backImageWidget() {
    return CardImageWidget(

      imgString: AppStrings.idBackImgSide,
      children:InkWell(
          onTap: () => _openBackImageSource(context),
          child: backImageFile != null && backImageFile.isNotEmpty
              ? backImageFile.split('.').last == "pdf"
              ? _pdfImageWidget(backImageFile)
              : _fileImage(fileImage: File(backImageFile))
              : _localBorderImg()),
    );
  }

  Widget _electricBillFrontImgWidget() {
    return CardImageWidget(
      star: interestedId == "1" ? AppStrings.star : "",
      imgString: AppStrings.electricBillFrontImgLabel,
      children:InkWell(
          onTap: () => _openEleBillFrontSource(context),
          child: electricBillFrontImgFile != null &&
              electricBillFrontImgFile.isNotEmpty
              ? electricBillFrontImgFile.split('.').last == "pdf"
              ? _pdfImageWidget(electricBillFrontImgFile)
              : _fileImage(fileImage: File(electricBillFrontImgFile))
              : _localBorderImg()),
    );
  }

  Widget _electricBillBackImgWidget() {
    return CardImageWidget(
      imgString: AppStrings.electricBillBackImgLabel,
      children:InkWell(
          onTap: () => _openEleBackSource(context),
          child: electricBillBackImgFile != null &&
              electricBillBackImgFile.isNotEmpty
              ? electricBillBackImgFile.split('.').last == "pdf"
              ? _pdfImageWidget(electricBillBackImgFile)
              : _fileImage(fileImage: File(electricBillBackImgFile))
              : _localBorderImg()),
    );
  }

  Widget _nocFrontImageWidget() {
    return CardImageWidget(
      star: AppStrings.star,
      imgString: AppStrings.nocDoc,
      children:InkWell(
          onTap: () => _openNocFrontImgSource(context),
          child: nocFrontImgFile != null && nocFrontImgFile.isNotEmpty
              ? nocFrontImgFile.split('.').last == "pdf"
              ? _pdfImageWidget(nocFrontImgFile)
              : _fileImage(fileImage: File(nocFrontImgFile))
              : _localBorderImg()),
    );
  }

  Widget _nocBackImageWidget() {
    return CardImageWidget(
      imgString: AppStrings.nocBackImgLabel,
      children:InkWell(
          onTap: () => _openNocBackImgSource(context),
          child: nocBackImgFile != null && nocBackImgFile.isNotEmpty
              ? nocBackImgFile.split('.').last == "pdf"
              ? _pdfImageWidget(nocBackImgFile)
              : _fileImage(fileImage: File(nocBackImgFile))
              : _localBorderImg()),
    );
  }

  Widget _customerImageWidget() {
    return CardImageWidget(
      imgString: AppStrings.customerImgLabel,
      children:InkWell(
          onTap: () => _openCustomerImgSource(context),
          child: uploadCustomerImgFile != null &&
              uploadCustomerImgFile.isNotEmpty
              ? uploadCustomerImgFile.split('.').last == "pdf"
              ? _pdfImageWidget(uploadCustomerImgFile)
              : _fileImage(fileImage: File(uploadCustomerImgFile))
              : _localBorderImg()),
    );
  }

  Widget _rowWidget({Widget widget1, Widget widget2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: widget1),
        Flexible(
            child: widget2)],
    );
  }

  Widget _houseNumImageWidget() {
    return CardImageWidget(
      imgString: AppStrings.houseImgLabel,
      children:InkWell(
          onTap: () => _openHouseImgSource(context),
          child: uploadHouseImgFile != null && uploadHouseImgFile.isNotEmpty
              ? uploadHouseImgFile.split('.').last == "pdf"
              ? _pdfImageWidget(uploadHouseImgFile)
              : _fileImage(fileImage: File(uploadHouseImgFile))
              : _localBorderImg()),
    );
  }

  Widget _consentImageWidget() {
    return CardImageWidget(
      imgString: AppStrings.consentPhotoLabel,
      children:InkWell(
          onTap: () => _openOwnerConsentImgSource(context),
          child: ownerConsentImageFile != null &&
              ownerConsentImageFile.isNotEmpty
              ? ownerConsentImageFile.split('.').last == "pdf"
              ? _pdfImageWidget(ownerConsentImageFile)
              : _fileImage(fileImage: File(ownerConsentImageFile))
              : _localBorderImg()),
    );
  }

  Widget _cancelChqImageWidget() {
    return CardImageWidget(
      imgString: AppStrings.chqCancelledPhotoLabel,
      children:InkWell(
          onTap: () => _openChqCancelledImgSource(context),
          child: chqCancelledPhotoFile != null &&
              chqCancelledPhotoFile.isNotEmpty
              ? chqCancelledPhotoFile.split('.').last == "pdf"
              ? _pdfImageWidget(chqCancelledPhotoFile)
              : _fileImage(fileImage: File(chqCancelledPhotoFile))
              : _localBorderImg()),
    );
  }

  Widget _chequeImageWidget() {
    return CardImageWidget(
      star: AppStrings.star,
      imgString: AppStrings.chqPhotoLabel,
      children:InkWell(
          onTap: () => _openChqImgSource(context),
          child: chqPhotoFile != null && chqPhotoFile.isNotEmpty
              ? chqPhotoFile.split('.').last == "pdf"
              ? _pdfImageWidget(chqPhotoFile)
              : _fileImage(fileImage: File(chqPhotoFile))
              : _localBorderImg()),
    );
  }

  Widget _nocDocNumberController() {
    return TextFieldWidget(
      headingLabel: AppStrings.nocDocNumber,
      hintText: AppStrings.nocDocNumber,
      controller: kYCDoc3NoController,
      textInputType: TextInputType.text,
      maxLength: 20,
      validator: (value) {
        if (value != kYCDoc3NoController.text.trim()) {
          return AppStrings.blankSpace;
        }
        return null;
      },
    );
  }

  Widget _kYCDoc1NoWidget() {
    return TextFieldWidget(
      star: AppStrings.star,
      headingLabel: AppStrings.kycDoc1No,
      hintText: AppStrings.kycDoc1No,
      controller: kYCDoc1NoController,
      textInputType: TextInputType.text,
      maxLength: 20,
      validator: (value) {
        if (value != kYCDoc1NoController.text.trim()) {
          return AppStrings.blankSpace;
        } else if (value.isEmpty) {
          return "Please enter id proof no.";
        }
        return null;
      },
    );
  }

  Widget _kYCDoc2NoWidget() {
    return TextFieldWidget(
      star: interestedId == "1" ? AppStrings.star : "",
      headingLabel: AppStrings.kycDoc2No,
      hintText: AppStrings.kycDoc2No,
      controller: kYCDoc2NoController,
      textInputType: TextInputType.text,
      maxLength: 20,
      validator: (value) {
        if (value != kYCDoc2NoController.text.trim()) {
          return AppStrings.blankSpace;
        }
        return null;
      },
    );
  }

  Widget _kYCDoc2DropDown() {
    return ReusedDropDownOptionItem(
      star: interestedId == "1" ? AppStrings.star : "",
      textLabel: AppStrings.kycDoc2,
      hint: AppStrings.kycDoc2,
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
      star:AppStrings.star,
      textLabel: AppStrings.kYCDoc3,
      hint: AppStrings.kYCDoc3,
      items: _kycProofDropdownItems,
      value: _kYCDocument3Value,
      onChanged: (value) {
        log("_kYCDocument3Value-->${value.id}");
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
      items: _customerBankNameList != null
          ? _customerBankNameList.map((String item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList()
          : [],
      value: _customerBankValue,
      onChanged: (value) {
        setState(() {
          _customerBankValue = value;
          log("CustomerBankValue-->" + _customerBankValue);
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
            return AppStrings.blankSpace;
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
            return AppStrings.blankSpace;
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
          return AppStrings.blankSpace;
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
      textLabel: AppStrings.initialDepositStatusLabel,
      hint: AppStrings.initialDepositStatusLabel,
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
          return AppStrings.blankSpace;
        }
        return null;
      },
    );
  }

  Widget _modeDepositDropDown() {
    return ReusedDropDownOptionItem(
        star:AppStrings.star,
        textLabel: AppStrings.modeOfDepositLabel,
        hint: AppStrings.modeOfDepositLabel,
        items: modeOfDepositList,
        value: modeDepositValue,
        onChanged: (OptionItem item) {
          setState(() {
            modeOfDepositString = item.id;
            modeDepositValue = item;
            log("_modeOfDeposit-->" + modeOfDepositString.toString());
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
        star:AppStrings.star,
        headingLabel: AppStrings.chqNoLabel,
        hintText: AppStrings.chqNoLabel,
        controller: chqNOController,
        maxLength: 6,
        textInputType: TextInputType.number,
        validator: (value) {
          if (value != chqNOController.text.trim()) {
            return AppStrings.blankSpace;
          } else if (value.isEmpty) {
            return "Please enter Cheque Number";
          } else if (value.length <= 5) {
            return 'Cheque Number must be of 6 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        });
  }

  Widget _chequeDateWidget() {
    return TextFieldWidget(
      star:AppStrings.star,
      headingLabel: AppStrings.depositDateLabel,
      prefixIcon: Icon(Icons.calendar_today, color: AppColor.appColor1,),
      hintText: AppStrings.depositDateLabel,
      controller: chequeDateController,
      readOnly: true,
      textInputType: TextInputType.datetime,
      onTap: () => _selectDate(context),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        chequeDateController.text =
            DateFormat('yyyy-MM-dd').format(selectedDate);
      });
  }

  Widget _payementBankNameDropDown() {
    return ReusedDropDownString(
      star:AppStrings.star,
      textLabel: AppStrings.payementBankNameLabel,
      hint: AppStrings.payementBankNameLabel,
      items: _payementBankNameList.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      value: _payementBankValue,
      onChanged: (String value) {
        setState(() {
          _payementBankValue = value;
          log("_payementBankValue--->" + _payementBankValue);
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
          left: BorderSide(color: Colors.yellow.shade800, width: 8),
          right: BorderSide(color: Colors.green.shade800, width: 8),
        ),
        elevation: 5,
        shadowColor: Colors.lightBlueAccent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Text(
              text,
              textAlign: TextAlign.center,
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12, color: Colors.black,decoration: TextDecoration.none,)
          ),
        ),
      ),
    );
  }

  Widget _localBorderImg() {
    return CircleAvatar(
        radius: 41,
        backgroundColor:AppColor.appColor1,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: AppColor.white,
          child: Image.asset(AppIcon.imageCaptureIcon,fit :BoxFit.cover,width: 60,height: 60,),
        )
    );
  }

  /////////////////////////////  image 1 ///////////////////////////////////////
  Future<void> _openFrontImageSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  frontImageFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  frontImageFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openBackImageSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  backImageFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  backImageFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openEleBillFrontSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  electricBillFrontImgFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  electricBillFrontImgFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openEleBackSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  electricBillBackImgFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  electricBillBackImgFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openNocFrontImgSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  nocFrontImgFile = result.path;
                  log("nocFrontImgFile-->" + nocFrontImgFile);
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  nocFrontImgFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openNocBackImgSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  nocBackImgFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
              source: ImageSource.camera,
              maxHeight: 900,
              maxWidth: 1000,
              preferredCameraDevice: CameraDevice.rear,
            );
            try {
              if (pickerFile != null) {
                setState(() {
                  nocBackImgFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openCustomerImgSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  uploadCustomerImgFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  uploadCustomerImgFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openHouseImgSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  uploadHouseImgFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  uploadHouseImgFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openCustomerConsentImgSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  customerConsentImageFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  customerConsentImageFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openOwnerConsentImgSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  ownerConsentImageFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
              source: ImageSource.camera,
              maxHeight: 900,
              maxWidth: 1000,
            );
            try {
              if (pickerFile != null) {
                setState(() {
                  ownerConsentImageFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openChqCancelledImgSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  chqCancelledPhotoFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  chqCancelledPhotoFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Future<void> _openChqImgSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpenImageSource(
          onTapGallery: () async {
            Navigator.of(context).pop();
            try {
              final result = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 900,
                maxWidth: 1000,);
              if (result != null) {
                setState(() {
                  chqPhotoFile = result.path;
                });
              } else {
                log("User canceled the picker");
              }
            } catch (e) {
              log(e.toString());
            }
          },
          onTapCamera: () async {
            Navigator.of(context).pop();
            final pickerFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 900,
                maxWidth: 1000,
                preferredCameraDevice: CameraDevice.rear);
            try {
              if (pickerFile != null) {
                setState(() {
                  chqPhotoFile = pickerFile.path;
                });
              } else {
                log("Not picker any image");
              }
            } catch (e) {
              log(e.toString());
            }
          },
        );
      },
    );
  }

  Widget _pdfImageWidget(String fileName) {
    return Column(
      children: [
        CircleAvatar(
          radius: 41,
          backgroundColor: Colors.green.shade800,
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('assets/images/pdf_icon.png'),
                ),
              )),
        ),
        Text(fileName.split(Platform.pathSeparator).last),
      ],
    );
  }

  Widget _fileImage({
    File fileImage,
  }) {
    if (fileImage.path.isNotEmpty) {
      return CircleAvatar(
        radius: 41,
        backgroundColor: Colors.green.shade800,
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
          color: Colors.yellow.shade800,
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
              Flexible(
                  child: Text(
                      leading.toUpperCase(), style: AppStyle.styleB()
                  )),
              Flexible(
                  child: Text(trailing, style: AppStyle.styleN()
                  )
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }

  Widget _imageColumn({Widget leadingImg, Widget trailingImg}) {
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

  GetLabelModel getLabelModel;
  fetchLabel() {
    var resAllDistrict = prefs.getString(GlobalConstants.AllLEBELS);
    getLabelModel = GetLabelModel.fromJson(jsonDecode(resAllDistrict));
    return GetLabelModel.fromJson(jsonDecode(resAllDistrict));
  }



  List<GetAllDistrictModel> getAllDistrictModel;
  Future<List<GetAllDistrictModel>> fetchDistrictTest() async {
    final res = prefs.getString(SPrefsKey.getAllDistrict);
    if (res != null) {
      getAllDistrictModel = getAllDistrictModelFromJson(res);
      return getAllDistrictModelFromJson(res);
    }
    return getAllDistrictModel;
  }

  Future<void> fetchDistrict() async {
    var resAllDistrict = prefs.getString(GlobalConstants.AllDistrict);
    List dataChargeList = json.decode(resAllDistrict);
    List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
      dataChargeList.length,
          (i) => DropdownMenuItem(
        value: OptionItem(
            id: dataChargeList[i]['id'],
            title: dataChargeList[i]['district_name']),
        child: Text("${dataChargeList[i]['district_name']}"),
      ),
    );
    if (!mounted) return;
    setState(() {
      getAllDistrictItems = menuItems;
      if (widget.isUpdate == true) {
        if (widget.studentModel.districtId != null) {
          districtValue = getAllDistrictItems
              .firstWhere(
                  (element) =>
              element.value.id == widget.studentModel.districtId,
              orElse: null)
              .value;
        }
      }
    });
  }

  Future<void> fetchArea(String id) async {
    var resArea = prefs.getString(GlobalConstants.area);
    List outputList = json.decode(resArea);
    List dataList  = outputList.where((element) => element['charge_area_id'].toString() == id).toList();
    List<DropdownMenuItem<OptionItem>> menuItems = [];
    for (int i = 0; i < dataList.length; i++) {
      menuItems.add(DropdownMenuItem(
        value:
        OptionItem(id: dataList[i]['gid'], title: dataList[i]['area_name']),
        child: Text("${dataList[i]['area_name']}"),
      ));
      //  }
    }
    if (!mounted) return;
    setState(() {
      areaItems = menuItems;
      if (widget.isUpdate == true) {
        if (widget.studentModel.areaId != null) {
          areaTypeValue = areaItems
              .firstWhere(
                  (element) => element.value.id == widget.studentModel.areaId,
              orElse: null)
              .value;
        }
      }
    });
  }

  Future<void> fetchChargeAreaList() async {
    var resChargeAreaName = prefs.getString(GlobalConstants.chargeAreaName);
    List dataChargeList = json.decode(resChargeAreaName);
    List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
      dataChargeList.length,
          (i) => DropdownMenuItem(
        value: OptionItem(
            id: dataChargeList[i]['gid'],
            title: dataChargeList[i]['charge_area_name']),
        child: Text("${dataChargeList[i]['charge_area_name']}"),
      ),
    );
    if (!mounted) return;
    setState(() {
      chargeAreaItems = menuItems;
      if (widget.isUpdate == true) {
        if (widget.studentModel.chargeArea != null) {
          chargeAreaType = chargeAreaItems
              .firstWhere(
                  (element) =>
              element.value.id == widget.studentModel.chargeArea,
              orElse: null)
              .value;
        }
      }
    });
    if (widget.isUpdate == true) {
      await fetchArea(chargeAreaType.id);
    }
   /* else {
      await fetchArea(dataChargeList[0]['gid']);
    }*/
  }

  Future<void> interestedList() async {
    var resInterested = prefs.getString(GlobalConstants.Interested);
    final decoded = jsonDecode(resInterested) as Map;
    final map = decoded.values.toList()..sort();
    final listMap = map.asMap();
    listMap.forEach((k, v) {
      interestedListItems.add(DropdownMenuItem(
        value: OptionItem(id: k.toString(), title: v.toString()),
        child: Text(v),
      ));
    });
    setState(() {
      interestedValue = interestedListItems.last.value;
      interestedId = interestedValue.id;
      if (widget.isUpdate == true) {
        if (widget.studentModel.interested != null) {
          interestedValue = interestedListItems
              .firstWhere(
                  (element) =>
              element.value.id == widget.studentModel.interested,
              orElse: null)
              .value;
          interestedId = interestedValue.id;
        }
      }
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
    List dataList = jsonDecode(resPropertyCategory);
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
          propertyCategoryValue = propertyCategoryList
              .firstWhere(
                  (element) =>
              element.value.id ==
                  widget.studentModel.propertyCategoryId,
              orElse: null)
              .value;
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
          propertyClassValue = propertyClassList
              .firstWhere(
                  (element) =>
              element.value.id == widget.studentModel.propertyClassId,
              orElse: null)
              .value;
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
        _kYCDoc1Value = _kYCDoc1List
            .firstWhere((element) =>
        element.value.id == widget.studentModel.kycDocument1)
            .value;
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
        _kYCDocument3Value = _kycProofDropdownItems
            .firstWhere(
                (element) =>
            element.value.id == widget.studentModel.kycDocument3,
            orElse: null)
            .value;
      }
    }
    setState(() {});
  }

  Future<void> _getBankData() async {
    var resAllBanks = prefs.getString(GlobalConstants.AllBanks);
    final decoded = (jsonDecode(resAllBanks) as List<dynamic>).cast<String>();
    setState(() {
      _customerBankNameList = decoded;
      if (widget.isUpdate == true) {
        if (widget.studentModel.interested == "1") {
          if (widget.studentModel.nameOfBank != null) {
            _customerBankValue = _customerBankNameList.firstWhere(
                    (element) => element == widget.studentModel.nameOfBank,
                orElse: () => null);
          }else{
            _customerBankValue = null;
          }
        }
      }
    });
  }

  Future<void> _getPayementBankData() async {
    var resAllBanks = prefs.getString(GlobalConstants.AllBanks);
    final decoded = (jsonDecode(resAllBanks) as List<dynamic>).cast<String>();
    setState(() {
      _payementBankNameList = decoded;
    });
  }

  Future<void> _getBillingModeList() async {
    var resEbilling = prefs.getString(GlobalConstants.Ebilling);
    final decoded = jsonDecode(resEbilling) as Map;
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
          billingModeValue = billingModeList
              .firstWhere(
                  (element) =>
              element.value.id == widget.studentModel.billingModel,
              orElse: null)
              .value;
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
        __acceptConversionPolicyValue = _acceptConversionPolicyList
            .firstWhere(
                (element) =>
            element.value.id ==
                widget.studentModel.acceptConversionPolicy,
            orElse: null)
            .value;
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
        acceptExtraFittingCostValue = _acceptExtraFittingCostList
            .firstWhere(
                (element) =>
            element.value.id ==
                widget.studentModel.acceptExtraFittingCost,
            orElse: null)
            .value;
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
        if (widget.studentModel.interested == "1") {
          if (widget.studentModel.modeOfDeposite != null) {
            modeDepositValue = modeOfDepositList
                .firstWhere(
                    (element) =>
                element.value.id == widget.studentModel.modeOfDeposite,
                orElse: null)
                .value;
          }
        }
      }
      //   modeOfDepositString = modeDepositValue.id;
    });
  }

  Future<void> _getInitialDepositeStatusList() async {
    var resDepositeStatus = prefs.getString(GlobalConstants.DepositeStatus);
    final decoded = jsonDecode(resDepositeStatus) as Map;
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
        if (widget.studentModel.interested == "1") {
          if (widget.studentModel.initialDepositeStatus != null) {
            depositStatusValue = dropListDepositStatusList
                .firstWhere(
                    (element) =>
                element.value.id ==
                    widget.studentModel.initialDepositeStatus,
                orElse: null)
                .value;
          }
        }
      }
    });
  }

  Future<void> _getAllDepositScheme() async {
    var resSchemeType = prefs.getString(GlobalConstants.SchemeType);
    List dataList = json.decode(resSchemeType);
    List<DropdownMenuItem<DepositItem>> menuItems = [];
    List<DropdownMenuItem<DepositItem>> menuItems2 = [];
    /*menuItems.add(DropdownMenuItem(
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
    ));*/

    if (dataList != null) {
      for (int i = 0; i < dataList.length; i++) {
        try {
          menuItems2.add(DropdownMenuItem(
            value: DepositItem(
                id: dataList[i]['deposit_types_id'] ?? "",
                title: dataList[i]['deposit_name'] ?? "",
                firstamount: dataList[i]['firstDepositAmountWith'] ?? "",
                amount: dataList[i]['firstDepositAmountWith'] ?? "",
                schememonth: dataList[i]['scheme_month'] ?? "",
                gas_amount: dataList[i]['gas_deposit_amount'] ?? "",
                scheme_type: dataList[i]['scheme_type'] ?? "",
                scheme_code: dataList[i]['scheme_code'] ?? "",
                deposit_amount: dataList[i]['deposit_amount'] ?? "",
                equipment_deposit_amount:
                dataList[i]['equipment_deposit_amount'] ?? "",
                interest_amount: dataList[i]['interest_amount'] ?? "",
                registration_gst: dataList[i]['registration_gst'] ?? "",
                totalAmount: dataList[i]['totalAmount'] ?? "",
                nextCycleAmount: dataList[i]['nextCycleAmount'] ?? "",
                registration_tax_name:
                dataList[i]['registration_tax_name'] ?? "",
                interest_tax_amt: dataList[i]['interest_tax_amt'] ?? "",
                reg_tax: dataList[i]['reg_tax']),
            child: Text("${dataList[i]['deposit_name']}"),
          ));
        } catch (e) {
          log("e${e}");
        }
      }
    }
    menuItems.addAll(menuItems2);
    if (!mounted) return;
    setState(() {
      _depositTypeList = menuItems;
      if (widget.isUpdate) {
        if (widget.studentModel.interested == "1") {
          if (widget.studentModel.depositeType != null) {
            _depositTypeValue = _depositTypeList
                .firstWhere(
                    (element) =>
                element.value.id.toString() ==
                    widget.studentModel.depositeType,
                orElse: null)
                .value;
          }
        }
      }
    });
    return;
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
              Text(
                  "Your are connected to ${isWifiConnected ? "WIFI" : "MOBILE DATA"}"),
              Text(isWifiConnected ? "$wifiBSSID" : "Not Wifi"),
              Text("$wifiIP"),
              Text("$wifiName")
            ],
          ),
        ),
      ),
    );
  }

  _width(){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.03,
    );
  }
}
