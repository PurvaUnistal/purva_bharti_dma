// import 'package:flutter/material.dart';
// import 'package:hpcl_app/HiveDataStore/customer_reg_data_store.dart';
// import 'package:hpcl_app/models/save_customer_registration_offline_model.dart';
// import 'package:hpcl_app/utils/common_widgets/button_widget.dart';
// import 'package:hpcl_app/utils/common_widgets/photo_controller.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
//
// import '../ExportFile/export_file.dart';
// import '../utils/common_widgets/custom_app_bar.dart';
// import '../utils/common_widgets/open_image_source.dart';
//
// class MainRegisterPageUpdate extends StatefulWidget {
//   bool isUpdate;
//   int position = -1;
//   SaveCustomerRegistrationOfflineModel studentModel = null;
//
//   MainRegisterPageUpdate({this.isUpdate, this.position, this.studentModel});
//
//   @override
//   State<StatefulWidget> createState() {
//     return MainRegisterPageUpdateState();
//   }
// }
//
// class MainRegisterPageUpdateState extends BaseState<MainRegisterPageUpdate> {
//   Customer editedCustomer;
//   Position position;
//   int gasDepositAmountController, depositTotalAmount = 0, _schemeMonth = 0;
//
//   var wifiBSSID;
//   var wifiIP;
//   var wifiName;
//   bool isWifiConnected = false;
//   bool isInternetOn = true;
//
//   List<String> _bankDropdownItems = ([]);
//   String _bankValue;
//
//   List data = [];
//
//   List<String> _bankDropdownItems2 = [];
//   String _bankValue2;
//   List data2 = [];
//
//   //Area
//   List<DropdownMenuItem<OptionItem>> areaItems = [];
//   OptionItem areaTypeValue;
//   String _areaTypeId = '0';
//
//   //Charge Area
//   List<DropdownMenuItem<OptionItem>> chargeAreaItems = [];
//   OptionItem chargeAreaType;
//   String chargeAreaId = '0';
//
//   //getAllDistrict
//   List<DropdownMenuItem<OptionItem>> getAllDistrictItems = [];
//   OptionItem districtValue;
//   String getAllDistrictId = '0';
//
//   List<DropdownMenuItem<OptionItem>> dropListModelInterested = [];
//   OptionItem _isInterestedItem = OptionItem(id: "", title: "");
//   String _isInterestedId = '';
//   String schemeTypeLabel = '';
//
//   Box<SaveCustomerRegistrationOfflineModel> customerRegistrationBox;
//   List<SaveCustomerRegistrationOfflineModel> customerRegistrationList;
//
//   bool error = false;
//   String dateAndTime = '';
//   bool fDepositeSiteCheck = false;
//   bool fDepositeDate = false;
//
//   PhotoController ownerConsentImageController = PhotoController();
//   PhotoController frontImageController = PhotoController();
//   PhotoController backImageController = PhotoController();
//   PhotoController eleBillFrontImgController = PhotoController();
//   PhotoController eleBillBackImgController = PhotoController();
//   PhotoController nocFrontImgController = PhotoController();
//   PhotoController nocBackImgController = PhotoController();
//   PhotoController customerImgController = PhotoController();
//   PhotoController houseImgController = PhotoController();
//   PhotoController consentImageController = PhotoController();
//   PhotoController cancelChqImageController = PhotoController();
//   PhotoController chqImgController = PhotoController();
//   var ownerConsentImageFile = "",
//       frontImageFile = "",
//       backImageFile = "",
//       electricBillFrontImgFile = "",
//       electricBillBackImgFile = "",
//       nocFrontImgFile = "",
//       nocBackImgFile = "",
//       customerImgFile = "",
//       houseImgFile = "",
//       consentPhotoFile = "",
//       chqCancelledPhotoFile = "",
//       chqPhotoFile = "";
//
//   void removeSpace(TextEditingController controller) {
//     /* if (controller.text.trim() == "") {
//       setState(() => controller.text == '');
//     }
//     print("controller==>" + controller.text);*/
//   }
//
//   String schemeId = '0';
//   List<ChargeAreaModel> listChargeArea;
//
//   var checkDepositeDate;
//   String selectedDropDownValue = "";
//   ServerApi serverApi;
//
//   @override
//   void initState() {
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//     getLocalData();
//     serverApi = ServerApi();
//     // firstNameController.addListener(() => removeSpace(firstNameController));
//     //   firstNameController.addListener(() => firstNameController.text = firstNameController.text.replaceAll(RegExp(r"\s+"), " "));
//     //   firstNameController.addListener(() => firstNameController.text = firstNameController.text.replaceAll(" ", " "));
//     middleNameController.addListener(() => removeSpace(middleNameController));
//     lastNameController.addListener(() => removeSpace(lastNameController));
//     guardianNameController.addListener(() => removeSpace(guardianNameController));
//     reasonController.addListener(() => removeSpace(reasonController));
//     emailIdController.addListener(() => removeSpace(emailIdController));
//     colonySocietyApartmentController.addListener(() => removeSpace(colonySocietyApartmentController));
//     streetNameController.addListener(() => removeSpace(streetNameController));
//     townController.addListener(() => removeSpace(townController));
//     landmarkController.addListener(() => removeSpace(landmarkController));
//     IFSCController.addListener(() => removeSpace(IFSCController));
//     bank_address.addListener(() => removeSpace(bank_address));
//     longitudeController.addListener(() => removeSpace(longitudeController));
//     latitudeController.addListener(() => removeSpace(latitudeController));
//     ownershipController.addListener(() => removeSpace(ownershipController));
//     nocProofNoController.addListener(() => removeSpace(nocProofNoController));
//     reasonNoController.addListener(() => removeSpace(reasonNoController));
//     mICRCodeController.addListener(() => removeSpace(mICRCodeController));
//     initDepDateController.addListener(() => removeSpace(initDepDateController));
//     initDepDateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
//     print("SDFGHUIOKJHGFHJKL" + initDepDateController.text);
//     updateValue();
//     super.initState();
//   }
//
//   updateValue() {
//     if (widget.isUpdate) {
//       mobileNoController.text = widget.studentModel.mobileNumber;
//       firstNameController.text = widget.studentModel.firstName;
//       middleNameController.text = widget.studentModel.middleName;
//       lastNameController.text = widget.studentModel.lastName;
//       guardianNameController.text = widget.studentModel.guardianName;
//       reasonController.text = widget.studentModel.residentStatus;
//       emailIdController.text = widget.studentModel.emailId;
//       colonySocietyApartmentController.text = widget.studentModel.colonySocietyApartment;
//       streetNameController.text = widget.studentModel.streetName;
//       townController.text = widget.studentModel.town;
//       houseNumberController.text = widget.studentModel.houseNumber;
//       pinCodeController.text = widget.studentModel.pinCode;
//       kitchenController.text = widget.studentModel.noOfKitchen;
//       bathroomController.text = widget.studentModel.noOfBathroom;
//       familyMemController.text = widget.studentModel.noOfFamilyMembers;
//       landmarkController.text = widget.studentModel.reasonForHold;
//       longitudeController.text = widget.studentModel.longitude;
//       latitudeController.text = widget.studentModel.latitude;
//       idProofNoController.text = widget.studentModel.kycDocument1Number;
//       ownershipController.text = widget.studentModel.kycDocument2Number;
//       nocProofNoController.text = widget.studentModel.kycDocument3Number;
//       reasonNoController.text = widget.studentModel.remarks;
//
//       chqNOController.text = widget.studentModel.chequeNumber;
//       bankAccNoController.text = widget.studentModel.chequeBankAccount;
//       mICRCodeController.text = widget.studentModel.micr;
//       chqDateController.text = widget.studentModel.chequeNumber;
//       initDepDateController.text = widget.studentModel.initialDepositeDate;
//       customerAccountNum.text = widget.studentModel.bankAccountNumber;
//       IFSCController.text = widget.studentModel.bankIfscCode;
//       bank_address.text = widget.studentModel.bankAddress;
//       _isInterestedId = widget.studentModel.interested;
//       _residentStatusValue = widget.studentModel.residentStatus;
//       cookInFuelValue = widget.studentModel.existingCookingFuel;
//       backImageFile = widget.studentModel.backSidePhoto1;
//       electricBillBackImgFile = widget.studentModel.backSidePhoto2;
//       nocBackImgFile = widget.studentModel.backSidePhoto3;
//       frontImageFile = widget.studentModel.documentUploadsPhoto1;
//       electricBillFrontImgFile = widget.studentModel.documentUploadsPhoto2;
//       nocFrontImgFile = widget.studentModel.documentUploadsPhoto3;
//       consentPhotoFile = widget.studentModel.customerConsentPhoto;
//       chqCancelledPhotoFile = widget.studentModel.canceledChequePhoto;
//       chqPhotoFile = widget.studentModel.chequePhoto;
//       ownerConsentImageFile = widget.studentModel.ownerConsent;
//       houseImgFile = widget.studentModel.uploadHousePhoto;
//       customerImgFile = widget.studentModel.uploadCustomerPhoto;
//       buildingNumberController.text = widget.studentModel.buildingNumber;
//       ownerConsentController.text = widget.studentModel.ownerConsentText;
//       _bankValue = widget.studentModel.nameOfBank;
//       schema = widget.studentModel.schema;
//       dmaUserName = widget.studentModel.dmaUserName;
//       dmaId = widget.studentModel.dmaUserId;
//     }
//   }
//
//   final SaveCusRegHiveDataStore dataStore = SaveCusRegHiveDataStore();
//   ValueNotifier<bool> isUpdate = ValueNotifier<bool>(false);
//
//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget buildView(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(50),
//           child: CustomAppBar(
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back_ios_rounded),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForm()));
//               },
//             ),
//             titleAppBar: "Customer Input",
//             actions: [],
//           ),
//         ),
//         body: _buildLayout()
//     );
//   }
//
//   Future<Position> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied, we cannot request permissions.');
//     }
//     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }
//
//   TextEditingController mobileNoController = TextEditingController();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController middleNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController guardianNameController = TextEditingController();
//   TextEditingController reasonController = TextEditingController();
//   TextEditingController emailIdController = TextEditingController();
//   TextEditingController colonySocietyApartmentController = TextEditingController();
//   TextEditingController streetNameController = TextEditingController();
//   TextEditingController townController = TextEditingController();
//   TextEditingController buildingNumberController = TextEditingController();
//   TextEditingController houseNumberController = TextEditingController();
//   TextEditingController pinCodeController = TextEditingController();
//   TextEditingController kitchenController = TextEditingController(text: '1');
//   TextEditingController bathroomController = TextEditingController(text: "1");
//   TextEditingController familyMemController = TextEditingController(text: "4");
//   TextEditingController ownerConsentController = TextEditingController();
//   TextEditingController landmarkController = TextEditingController();
//   TextEditingController longitudeController = TextEditingController();
//   TextEditingController latitudeController = TextEditingController();
//   TextEditingController idProofNoController = TextEditingController();
//   TextEditingController ownershipController = TextEditingController();
//   TextEditingController nocProofNoController = TextEditingController();
//   TextEditingController reasonNoController = TextEditingController();
//   TextEditingController depositAmountController = TextEditingController();
//   TextEditingController chqNOController = TextEditingController();
//   TextEditingController bankAccNoController = TextEditingController();
//   TextEditingController mICRCodeController = TextEditingController();
//   TextEditingController chqDateController = TextEditingController();
//   TextEditingController initDepDateController = TextEditingController();
//   TextEditingController customerAccountNum = TextEditingController();
//   TextEditingController IFSCController = TextEditingController();
//   TextEditingController bank_address = TextEditingController();
//
//   OptionItem categoryValue;
//   OptionItem depositStatusValue;
//
//   List<DropdownMenuItem<OptionItem>> modeOfDepositList = [];
//   OptionItem modeDepositValue;
//   String modeOfDepositId;
//
//   DepositItem _depositCategoryType;
//
//   List<DropdownMenuItem<OptionItem>> dropListDepositStatusList = ([]);
//   List<DropdownMenuItem<OptionItem>> dropListChoiceStatusList = ([]);
//   List<DropdownMenuItem<OptionItem>> propertyCategoryList = [];
//   List<DropdownMenuItem<DepositItem>> _propertyDropdownItemsDeposit = [];
//   List<DropdownMenuItem<OptionItem>> idProofList = [];
//   List<DropdownMenuItem<OptionItem>> _addressProofDropdownItems = [];
//   List<DropdownMenuItem<OptionItem>> _kycProofDropdownItems = ([]);
//   List<DropdownMenuItem<String>> _cookingFuelDropdownItems = ([]);
//   List<DropdownMenuItem<OptionItem>> propertyClassList = [];
//   List<DropdownMenuItem<String>> guardianTypeDropdownItems = ([]);
//
//   String _depositStatusId = '';
//
//   bool isDepositCheq = false;
//
//   OptionItem idProofValue;
//   OptionItem _addressProofDropDownValue = OptionItem(id: "", title: "");
//   String _addressProofDropDownValueId = "";
//
//   OptionItem _kycProofDropDownValue;
//
//   // String _kycProofDropDownValueId = "";
//
//   DropListModel dropListModelarea = DropListModel([
//     OptionItem(id: "1", title: "A"),
//     OptionItem(id: "2", title: "B"),
//     OptionItem(id: "3", title: "C"),
//     OptionItem(id: "4", title: "D"),
//   ]);
//
//   String cookInFuelValue;
//
//   OptionItem propertyClassValue;
//
//   OptionItem guardianType;
//   String guardianTypeId = '0';
//
//   String guardianTypeValue;
//
//   DropListModel dropListModelpropertyCategory = DropListModel([
//     OptionItem(id: "1", title: "Domestic"),
//     OptionItem(id: "2", title: "Commercial"),
//     OptionItem(id: "3", title: "Industrial"),
//     OptionItem(id: "4", title: "SplDomestic"),
//   ]);
//   DropListModel dropListModelpropertyClass = DropListModel([
//     OptionItem(id: "1", title: "General"),
//     OptionItem(id: "2", title: "VIP"),
//     OptionItem(id: "3", title: "Govt"),
//   ]);
//   DropListModel dropListModelresidentStatus = DropListModel([
//     OptionItem(id: "1", title: "Owner"),
//     OptionItem(id: "2", title: "Tenant"),
//     OptionItem(id: "3", title: "Unoccupied"),
//   ]);
//   DropListModel dropListModelExistingCookingFuel = DropListModel([
//     OptionItem(id: "1", title: "Gas Cylinder"),
//     OptionItem(id: "2", title: "Electric"),
//     OptionItem(id: "3", title: "Kerosene"),
//     OptionItem(id: "4", title: "Coal"),
//     OptionItem(id: "5", title: "Wood"),
//   ]);
//   DropListModel dropListModelKycDoc = DropListModel([
//     OptionItem(id: "1", title: "Aadhaar"),
//     OptionItem(id: "2", title: "Voter"),
//     OptionItem(id: "3", title: "Ration"),
//     OptionItem(id: "4", title: "PAN"),
//     OptionItem(id: "5", title: "Passport"),
//     OptionItem(id: "5", title: "Owner ID"),
//   ]);
//   List<DropdownMenuItem<String>> _mdpeDropdownItems = ([]);
//   String _mdpeValue = '';
//
//   List<DropdownMenuItem<String>> _residentDropdownItems = ([]);
//   String _residentStatusValue = '';
//   String dmaId = "";
//   String dmaUserName = "";
//   String schema = "";
//   SharedPreferences prefs;
//
//   getLocalData() async {
//     prefs = await SharedPreferences.getInstance();
//     schema = prefs.getString(GlobalConstants.schema);
//     dmaId = prefs.getString(GlobalConstants.id);
//     dmaUserName = prefs.getString(GlobalConstants.name);
//     fetchLabels();
//     fetchDistrict();
//     fetchChargeAreaList();
//     interestedDorpdownList();
//     _getPropertyCategory();
//     _getPropertyClass();
//     _getSocietyAllow();
//     _getResidentStatus();
//     _getExistingCookingFuel();
//     _getGuardianType();
//     _getIdProofArray();
//     _getAddressProofArray();
//     _getKycProofArray();
//     _getBank();
//     _getBank2();
//     _getBillingModeList();
//     _getAcceptConversionPolicyList();
//     _getAcceptExtraFittingCostList();
//     _getMdeOfDeposite();
//     _getInitialDepositeStatusList();
//     _getAllDepositScheme();
//   }
//
//   PhotoController consentPhoto = PhotoController();
//   PhotoController chequePhoto = PhotoController();
//
//   List<DropdownMenuItem<OptionItem>> billingModeList = [];
//   OptionItem billingModeValue;
//   String billingModeId;
//
//   List<DropdownMenuItem<OptionItem>> _acceptConversionPolicyList = [];
//   OptionItem __acceptConversionPolicyValue = OptionItem(id: "0", title: "");
//   String __acceptConversionPolicyValueId;
//
//   List<DropdownMenuItem<OptionItem>> _acceptExtraFittingCostList = [];
//   OptionItem acceptExtraFittingCostValue = OptionItem(id: "0", title: "");
//   String __acceptExtraFittingCostValueId;
//
//   List<ImageSource> values = [];
//
//   String userId = "";
//   String depositSum = "";
//   final formGlobalKey = GlobalKey<FormState>();
//
//   _buildLayout() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Form(
//         key: formGlobalKey,
//         child: Column(
//           children: <Widget>[
//             _interestedDropDown(),
//             _conversionPolicyDropDown(),
//             _fittingCostDropDown(),
//             _isInterestedId == '1' ? _mdpeDropdown() : Container(),
//             _isInterestedId == '0' ? _reasonInterestedWidget() : Container(),
//             _chargeAreaDropDown(),
//             _areaDropDown(),
//             _mobileWidget(),
//             _firstNameWidget(),
//             _middleWidget(),
//             _lastNameWidget(),
//             _guardianTypeDropDown(),
//             _guardianNameWidget(),
//             _emailWidget(),
//             _isInterestedId == '1' ? _propertyCategoryDropDown() : Container(),
//             _isInterestedId == '1' ? _propertyClassDropDown() : Container(),
//             _buildingNumberWidget(),
//             _houseNumberWidget(),
//             _apartmentWidget(),
//             _streetNameWidget(),
//             _townWidget(),
//             _districtWidget(),
//             _pinCodeWidget(),
//             _isInterestedId == '1' ? _residentStatusDropdownWidget() : Container(),
//             _isInterestedId == '1' ? _noKitchenWidget() : Container(),
//             _isInterestedId == '1' ? _noBathroomWidget() : Container(),
//             _isInterestedId == '1' ? _fuelDropdownWidget() : Container(),
//             _isInterestedId == '1' ? _noFamilyWidget() : Container(),
//             //     _ownerConsentWidget(),
//             _locationWidget(),
//             _isInterestedId == '1' ? _landmarkWidget() : Container(),
//             _buildCardWidget(text: AppStrings.identificationProofLabel),
//             _docTypeDropDown(),
//             _idProofNoWidget(),
//             _rowWidget(
//               widget1: _frontImageWidget(),
//               widget2: _backImageWidget(),
//             ),
//             _buildCardWidget(text: AppStrings.ownershipProofHeading),
//             getDropDown2(),
//             _ownerProofNoWidget(),
//             _rowWidget(
//               widget1: _electricBillFrontImgWidget(),
//               widget2: _electricBillBackImgWidget(),
//             ),
//             _buildCardWidget(text: AppStrings.nocLabel),
//             getDropDown3(),
//             _nocProofNoWidget(),
//             _rowWidget(
//               widget1: _nocFrontImageWidget(),
//               widget2: _nocBackImageWidget(),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             _rowWidget(
//               widget1: _customerImageWidget(),
//               widget2: _houseNumImageWidget(),
//             ),
//             _ownerConsentImageWidget(),
//             _buildCardWidget(text: AppStrings.customerConsentLabel),
//             _rowWidget(
//               widget1: _consentImageWidget(),
//               widget2: _cancelChqImageWidget(),
//             ),
//             _billModeDropDown(),
//             _customerBankDropDown(),
//             _customerBackNoWidget(),
//             _customerIFSCCodeWidget(),
//             _customerBankAddWidget(),
//             _buildCardWidget(text: AppStrings.securityDepositLabel),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12.0, top: 12, right: 15),
//                   child: Text(AppStrings.securityDepositLabel),
//                 ),
//                 Flexible(child: _depositStatusDropDown())
//               ],
//             ),
//             _depositStatusId != "1" ? _reasonDepositStatusWidget() : Container(),
//             _modeDepositDropDown(),
//             getdepositTypeDropDown(),
//             _depositAmountWidget(),
//             Visibility(
//                 visible: isDepositCheq,
//                 child: Column(
//                   children: [
//                     _chqNoWidget(),
//                     _depositDateWidget(),
//                     _bankNameDropDown(),
//                     _backNameWidget(),
//                     _micrCodeWidget(),
//                     _chequeImageWidget(),
//                   ],
//                 )),
//
//             ButtonWidget(
//               textButton: !widget.isUpdate ? "Preview" : "Update",
//               onPressed: () {
//                 chargeAreaId = chargeAreaType == null ? chargeAreaId : chargeAreaType.id;
//                 _areaTypeId = areaTypeValue == null ? _areaTypeId : areaTypeValue.id;
//                 getAllDistrictId = districtValue == null ? getAllDistrictId : districtValue.id;
//                 modeOfDepositId = modeDepositValue == null ? modeOfDepositId : modeDepositValue.id;
//
//
//                 var textFieldValidationCheck = CustomerFormHelper.textFieldValidationCheck(
//                   titleLocation: latitudeController.text.trim().toString(),
//                   acceptConversionPolicyValueId: __acceptConversionPolicyValueId.toString(),
//                   acceptExtraFittingCostValueId: __acceptExtraFittingCostValueId.toString(),
//                   chargeAreaType: chargeAreaId.toString(),
//                   areaTypeId: _areaTypeId.toString(),
//                   mobileNoController: mobileNoController.text.toString(),
//                   firstNameController: firstNameController.text.toString(),
//                   lastNameController: lastNameController.text.toString(),
//                   guardianNameController: guardianNameController.text.toString(),
//                   propertyTypeId: categoryValue.toString(),
//                   propertyClassId: propertyClassValue.toString(),
//                   buildingNumberController: buildingNumberController.text.toString(),
//                   houseNumberController: houseNumberController.text.toString(),
//                   colonySocietyApartmentController: colonySocietyApartmentController.text.toString(),
//                   streetNameController: streetNameController.text.toString(),
//                   townController: townController.text.toString(),
//                   district: getAllDistrictId.toString(),
//                   pinCodeController: pinCodeController.text.toString(),
//                   noOfKitchen: kitchenController.text.toString(),
//                   noOfBathroom: bathroomController.text.toString(),
//                   cookInFuelValue: cookInFuelValue,
//                   noOfFamilyMembers: familyMemController.text.toString(),
//                   addressProofNo: idProofValue.id.toString(),
//                   idProofNo: idProofNoController.text.toString(),
//                   idFrontImage: frontImageFile.toString(),
//                   idBackImage: backImageFile,
//                   consentImage: consentPhotoFile,
//                   // customerBankName: _bankValue,
//                   // customerAccNo: customerAccountNum.text.trim().toString(),
//                   //  customerIfscCode: IFSCController.text.trim().toString(),
//                   //  customerBankAdd: bank_address.text.trim().toString(),
//                   modeOfDeposit: modeOfDepositId.toString(),
//                   chequeNo: modeOfDepositId == "1" ? chqNOController.text.trim().toString() : "",
//                   chequeDate: modeOfDepositId == "1" ? initDepDateController.text.trim().toString() : DateFormat('yyyy-MM-dd').format(DateTime.now()),
//                   payementBankName: _bankValue2.toString(),
//                   bankAccNo: bankAccNoController.text.trim().toString(),
//                   depositAmount: _depositCategoryType.id.toString(),
//                   micrCode: modeOfDepositId == "1" ? mICRCodeController.text.trim().toString() : "",
//                   chequePhoto: modeOfDepositId == "1" ? chqPhotoFile : null,
//                   mdpeValue: _mdpeValue,
//                   residentStatusValue: _residentStatusValue,
//                 );
//
//                 if (formGlobalKey.currentState.validate() == false) {
//                   CustomToast.showToast("Not allow black space. Please remove space");
//                 }else {
//                   formGlobalKey.currentState.save();
//                   if (textFieldValidationCheck == true) {
//                     _showDialog();
//                   }
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _showDialog() {
//     return showDialog(
//         context: context,
//         builder: (
//             context,
//             ) {
//           return Container(
//               height: 200,
//               color: Colors.white,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 18.0),
//                       child: Text("Customer Detail", textAlign: TextAlign.center,style: TextStyle(
//                           fontSize: 21, fontWeight: FontWeight.bold,color: Colors.blue.shade900
//                       ),
//                       ),
//                     ),
//                     _buildRow(
//                       leading: AppStrings.interestedLabel,
//                       trailing: _isInterestedItem.title,
//                     ),
//                     _buildRow(
//                       leading: AppStrings.reasonLabel,
//                       trailing: reasonController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.chargeAreaLabel,
//                       trailing: chargeAreaType.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.areaLabel,
//                       trailing: areaTypeValue.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.mobileNoLabel,
//                       trailing: mobileNoController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.firstNameLabel,
//                       trailing: firstNameController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.middleNameLabel,
//                       trailing: middleNameController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.lastNameLabel,
//                       trailing: lastNameController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.guardianTypeLabel,
//                       trailing: guardianTypeValue ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.guardianNameLabel,
//                       trailing: guardianNameController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.emailAddressLabel,
//                       trailing: emailIdController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.propertyCategoryLabel,
//                       trailing: categoryValue.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.propertyClassLabel,
//                       trailing: propertyClassValue.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.buildingNumberLabel,
//                       trailing: buildingNumberController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.houseNumberLabel,
//                       trailing: houseNumberController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.apartmentLabel,
//                       trailing: colonySocietyApartmentController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.streetNameLabel,
//                       trailing: streetNameController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.townLabel,
//                       trailing: townController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.pinCodeLabel,
//                       trailing: pinCodeController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.districtLabel,
//                       trailing: districtValue.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.mdpeAllowLabel,
//                       trailing: _mdpeValue ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.residentStatusLabel,
//                       trailing: _residentStatusValue ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.noOfKitchenLabel,
//                       trailing: kitchenController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.noOfBathroomLabel,
//                       trailing: bathroomController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.existingCookingFuelLabel,
//                       trailing: cookInFuelValue ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.noOfFamilyMembersLabel,
//                       trailing: familyMemController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.latitudeLabel,
//                       trailing: latitudeController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.longitudeLabel,
//                       trailing: longitudeController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.landmarkLabel,
//                       trailing: landmarkController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.identificationProofLabel,
//                       trailing: idProofValue.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.idProofNo,
//                       trailing: idProofNoController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.billingModeLabel,
//                       trailing: billingModeValue.title.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.customerAccountNoLabel,
//                       trailing: customerAccountNum.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.customerIfscCodeLabel,
//                       trailing: IFSCController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.conversionPolicyLabel,
//                       trailing: __acceptConversionPolicyValue.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.fittingCostLabel,
//                       trailing: acceptExtraFittingCostValue.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.depositStatusLabel,
//                       trailing: depositStatusValue.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.modeOfDepositLabel,
//                       trailing: modeDepositValue.title ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.depositTypeLabel,
//                       trailing: AppStrings.depositName.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.depositAmountControllerLabel,
//                       trailing: depositAmountController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.chqNoLabel,
//                       trailing: chqNOController.text.toString() ?? "-",
//                     ),
//                     _buildRow(
//                       leading: AppStrings.depositDateLabel,
//                       trailing: modeOfDepositId == "1" ? initDepDateController.text.trim().toString() : DateFormat('yyyy-MM-dd').format(DateTime.now()),
//                     ),
//                     _buildRow(
//                       leading: AppStrings.customerBankNameLabel,
//                       trailing: _bankValue.toString() ?? "-",
//                     ),
//                     Visibility(
//                       visible: isDepositCheq,
//                       child: Column(
//                         children: [
//                           _buildRow(
//                             leading: AppStrings.accountNoLabel,
//                             trailing: bankAccNoController.text.toString() ?? "-",
//                           ),
//                           _buildRow(
//                             leading: AppStrings.bankNameLabel,
//                             trailing: _bankValue2.toString() ?? "-",
//                           ),
//                           _buildRow(
//                             leading: AppStrings.mICRCodeLabel,
//                             trailing: mICRCodeController.text.toString() ?? "-",
//                           ),
//                         ],
//                       ),
//                     ),
//                     _imageColumn(
//                       leadingImg: Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.idFrontImgSide),
//                           frontImageFile != null && frontImageFile.isNotEmpty
//                               ? ImageCircle(
//                             fileImage1: File(frontImageFile),
//                             pathImage: frontImageFile,
//                           )
//                               : _localBorderImg()
//                         ],
//                       ),
//                       trailingImg: Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.idBackImgSide),
//                           backImageFile != null && backImageFile.isNotEmpty
//                               ? ImageCircle(
//                             fileImage1: File(backImageFile),
//                             pathImage: backImageFile,
//                           )
//                               : _localBorderImg()
//                         ],
//                       ),
//                     ),
//                     _imageColumn(
//                       leadingImg: Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.electricBillFrontImgLabel),
//                           electricBillFrontImgFile != null && electricBillFrontImgFile.isNotEmpty
//                               ? ImageCircle(
//                             fileImage1: File(electricBillFrontImgFile),
//                             pathImage: electricBillFrontImgFile,
//                           )
//                               : _localBorderImg()
//                         ],
//                       ),
//                       trailingImg:Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.electricBillBackImgLabel),
//                           electricBillBackImgFile != null && electricBillBackImgFile.isNotEmpty
//                               ? ImageCircle(
//                             fileImage1: File(electricBillBackImgFile),
//                             pathImage: electricBillBackImgFile,
//                           )
//                               : _localBorderImg()
//                         ],
//                       ),
//                     ),
//                     _imageColumn(
//                       leadingImg:  Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.nocFrontImgLabel),
//                           nocFrontImgFile != null && nocFrontImgFile.isNotEmpty
//                               ? ImageCircle(
//                             fileImage1: File(nocFrontImgFile),
//                             pathImage: nocFrontImgFile,
//                           )
//                               : _localBorderImg()
//                         ],
//                       ),
//                       trailingImg: Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.nocBackImgLabel),
//                           nocBackImgFile != null && nocBackImgFile.isNotEmpty
//                               ? ImageCircle(
//                             fileImage1: File(nocBackImgFile),
//                             pathImage: nocBackImgFile,
//                           )
//                               : _localBorderImg()
//                         ],
//                       ),
//                     ),
//                     _imageColumn(
//                       leadingImg:  Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.consentPhotoLabel),
//                           consentPhotoFile != null && consentPhotoFile.isNotEmpty
//                               ? ImageCircle(
//                             fileImage1: File(consentPhotoFile),
//                             pathImage: consentPhotoFile,
//                           )
//                               : _localBorderImg()
//                         ],
//                       ),
//                       trailingImg: Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.chqCancelledPhotoLabel),
//                           chqCancelledPhotoFile != null && chqCancelledPhotoFile.isNotEmpty
//                               ? ImageCircle(fileImage1: File(chqCancelledPhotoFile), pathImage: chqCancelledPhotoFile)
//                               : _localBorderImg()
//                         ],
//                       ),
//                     ),
//                     _imageColumn(
//                       leadingImg:  Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.customerImgLabel),
//                           customerImgFile != null && customerImgFile.isNotEmpty
//                               ? ImageCircle(
//                             fileImage1: File(customerImgFile),
//                             pathImage: customerImgFile,
//                           )
//                               : _localBorderImg()
//                         ],
//                       ),
//                       trailingImg: Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.houseImgLabel),
//                           houseImgFile != null && houseImgFile.isNotEmpty ? ImageCircle(fileImage1: File(houseImgFile), pathImage: houseImgFile) : _localBorderImg()
//                         ],
//                       ),
//                     ),
//                     _imageColumn(
//                       leadingImg: Column(
//                         children: [
//                           _imageNameWidget(imageName: AppStrings.ownerConsentLabel),
//                           ownerConsentImageFile != null && ownerConsentImageFile.isNotEmpty
//                               ? ImageCircle(fileImage1: File(ownerConsentImageFile), pathImage: ownerConsentImageFile)
//                               : _localBorderImg()
//                         ],
//                       ),
//                       trailingImg:Visibility(
//                         visible: isDepositCheq,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               _imageNameWidget(imageName: AppStrings.chqPhotoLabel),
//                               chqPhotoFile != null && chqPhotoFile.isNotEmpty
//                                   ? ImageCircle(
//                                 fileImage1: File(chqPhotoFile),
//                                 pathImage: chqPhotoFile,
//                               )
//                                   : _localBorderImg()
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Flexible(
//                           child: ButtonWidget(
//                             onPressed: () {
//                               storeRecords();
//                             },
//                             textButton:"Save",
//                           ),
//                         ),
//                         Flexible(
//                           child: ButtonWidget(
//                             textButton: "EDIT",
//                             onPressed: () {
//                               Navigator.pop(context, false);
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ));
//         });
//   }
//
//   Future<void> storeRecords() async {
//     SaveCustomerRegistrationOfflineModel data = SaveCustomerRegistrationOfflineModel(
//       interested: _isInterestedId.toString(),
//       areaId: areaTypeValue.id.toString(),
//       chargeArea: chargeAreaType.id.toString(),
//       mobileNumber: mobileNoController.text.toString(),
//       firstName: firstNameController.text.toString(),
//       middleName: middleNameController.text.toString(),
//       lastName: lastNameController.text.toString(),
//       guardianType: guardianTypeValue.toString(),
//       guardianName: guardianNameController.text.toString(),
//       emailId: emailIdController.text.toString(),
//       propertyCategoryId: categoryValue.id.toString(),
//       propertyClassId: propertyClassValue.id.toString(),
//       houseNumber: houseNumberController.text.toString(),
//       colonySocietyApartment: colonySocietyApartmentController.text.toString(),
//       streetName: streetNameController.text.toString(),
//       town: townController.text.toString(),
//       pinCode: pinCodeController.text.toString(),
//       districtId: districtValue.id.toString(),
//       societyAllowedMdpe: _mdpeValue == 'Yes' ? '1' : '0',
//       residentStatus: _residentStatusValue,
//       noOfKitchen: kitchenController.text.toString(),
//       noOfBathroom: bathroomController.text,
//       existingCookingFuel: cookInFuelValue,
//       noOfFamilyMembers: familyMemController.text.toString(),
//       latitude: latitudeController.text.toString(),
//       longitude: longitudeController.text.toString(),
//       remarks: landmarkController.text.toString(),
//       kycDocument1: idProofValue.id.toString(),
//       kycDocument1Number: idProofNoController.text.toString(),
//       backSidePhoto1: backImageFile,
//       backSidePhoto2: electricBillBackImgFile,
//       backSidePhoto3: nocBackImgFile,
//       documentUploadsPhoto1: frontImageFile,
//       documentUploadsPhoto2: electricBillFrontImgFile,
//       documentUploadsPhoto3: nocFrontImgFile,
//       customerConsentPhoto: consentPhotoFile,
//       canceledChequePhoto: chqCancelledPhotoFile,
//       chequePhoto: chqPhotoFile,
//       uploadCustomerPhoto: customerImgFile,
//       uploadHousePhoto: houseImgFile,
//       ownerConsent: ownerConsentImageFile,
//       reasonForHold: "",
//       kycDocument3: _kycProofDropDownValue.id,
//       kycDocument3Number: nocProofNoController.text.toString(),
//       kycDocument2: _addressProofDropDownValueId,
//       kycDocument2Number: ownershipController.text.toString(),
//       billingModel: billingModeId,
//       bankAccountNumber: customerAccountNum.text,
//       bankIfscCode: IFSCController.text.toString(),
//       bankAddress: bank_address.text.toString(),
//       acceptConversionPolicy: __acceptConversionPolicyValueId,
//       acceptExtraFittingCost: __acceptExtraFittingCostValueId,
//       modeOfDeposite: modeDepositValue.id.toString() ?? "",
//       initialDepositeStatus: _depositStatusId.toString(),
//       depositeType: _depositCategoryType.id.toString(),
//       initialAmount: depositAmountController.text.toString(),
//       chequeNumber: chqNOController.text.toString(),
//       initialDepositeDate: modeOfDepositId == "1" ? initDepDateController.text.trim().toString() : DateFormat('yyyy-MM-dd').format(DateTime.now()),
//       nameOfBank: _bankValue,
//       payementBankName: _bankValue2 ?? "",
//       chequeBankAccount: bankAccNoController.text.toString(),
//       micr: mICRCodeController.text.toString(),
//       schema: schema,
//       dmaUserName: dmaUserName,
//       dmaUserId: dmaId,
//       buildingNumber: buildingNumberController.text.trim().toString(),
//       ownerConsentText: ownerConsentController.text.trim().toString(),
//     );
//     print("initialDepositeDatefghj" + data.initialDepositeDate.toString());
//     if (widget.isUpdate) {
//       var box = await Hive.openBox<SaveCustomerRegistrationOfflineModel>("saveCustRegDataBoxName");
//       await  box.putAt(widget.position, data);
//       CustomToast.showToast('Great Success! Update Record Save');
//     } else {
//       var mmm = SaveCusRegHiveDataStore.box.length;
//       if (mmm <= 5) {
//         var box = await Hive.openBox<SaveCustomerRegistrationOfflineModel>("saveCustRegDataBoxName");
//         await box.add(data);
//         CustomToast.showToast('Great Success! Add Record Save');
//       } else {
//         CustomToast.showToast('Error !!!! \n Please Uploade Previous record');
//       }
//     }
//     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => RegistrationForm()), (r) => false);
//   }
//
//   Widget _interestedDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.interestedLabel,
//       hint: AppStrings.interestedLabel,
//       items: dropListModelInterested,
//       value: _isInterestedItem,
//       onChanged: (OptionItem value) {
//         setState(() {
//           _isInterestedId = value.id;
//           _isInterestedItem = value;
//           if (_isInterestedId == '0') {
//             familyMemController.text = '1';
//             bathroomController.text = '1';
//             kitchenController.text = '1';
//           } else {
//             familyMemController.text = '1';
//             bathroomController.text = '1';
//             kitchenController.text = '1';
//           }
//         });
//       },
//     );
//   }
//
//   Widget _conversionPolicyDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.conversionPolicyLabel,
//       hint: AppStrings.conversionPolicyLabel,
//       items: _acceptConversionPolicyList,
//       value: __acceptConversionPolicyValue,
//       onChanged: (value) {
//         setState(() {
//           __acceptConversionPolicyValueId = value.id;
//           __acceptConversionPolicyValue = value;
//         });
//       },
//     );
//   }
//
//   Widget _fittingCostDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.fittingCostLabel,
//       hint: AppStrings.fittingCostLabel,
//       items: _acceptExtraFittingCostList,
//       value: acceptExtraFittingCostValue,
//       onChanged: (value) {
//         setState(() {
//           __acceptExtraFittingCostValueId = value.id;
//           acceptExtraFittingCostValue = value;
//         });
//       },
//     );
//   }
//
//   Widget _mdpeDropdown() {
//     return ReusedDropDownString(
//       textLabel: AppStrings.mdpeAllowLabel,
//       hint: AppStrings.mdpeAllowLabel,
//       items: _mdpeDropdownItems,
//       value: _mdpeValue,
//       onChanged: (String value) {
//         setState(() => _mdpeValue = value);
//       },
//     );
//   }
//
//   Widget _reasonInterestedWidget() {
//     return TextFieldWidget(
//       enabled: true,
//       headingLabel: AppStrings.reasonLabel,
//       textInputType: TextInputType.text,
//       controller: reasonController,
//       hintText: AppStrings.reasonLabel,
//       validator: (value) {
//         if (value != reasonController.text.trim()) {
//           return "Not allow black Space";
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _chargeAreaDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.chargeAreaLabel,
//       hint: AppStrings.chargeAreaLabel,
//       items: chargeAreaItems,
//       value: chargeAreaType,
//       onChanged: (OptionItem value) {
//         setState(() {
//           chargeAreaId = value.id;
//           chargeAreaType = value;
//           areaTypeValue = null;
//           areaItems.clear();
//           fetchArea(value.id);
//         });
//       },
//     );
//   }
//
//   Widget _areaDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.areaLabel,
//       hint: AppStrings.areaLabel,
//       items: areaItems,
//       value: areaTypeValue,
//       onChanged: (OptionItem value) {
//         setState(() {
//           _areaTypeId = value.id;
//           areaTypeValue = value;
//         });
//       },
//     );
//   }
//
//   Widget _mobileWidget() {
//     return TextFieldWidget(
//         headingLabel: AppStrings.mobileNoLabel,
//         hintText: AppStrings.mobileNoLabel,
//         controller: mobileNoController,
//         textInputType: TextInputType.number,
//         inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
//         maxLength: 10,
//         validator: (value) {
//           if (value != mobileNoController.text.trim()) {
//             return "Not allow black Space";
//           } else if (value.isEmpty) {
//             return "Please enter Mobile Number";
//           } else if (value.length <= 9) {
//             return 'Mobile Number must be of 10 digit';
//           }
//           return null;
//         },
//         onChanged: (v) {
//           formGlobalKey.currentState.validate();
//         });
//   }
//
//   Widget _firstNameWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.firstNameLabel,
//       hintText: AppStrings.firstNameLabel,
//       controller: firstNameController,
//       textInputType: TextInputType.text,
//       inputFormatters: [
//         FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
//       ],
//       validator: (value) {
//         if (value != firstNameController.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
//           return "Enter First Name";
//         } else if (value.length <= 2) {
//           return "First Name must be of minimum 2+ Letters";
//         }
//         return null;
//       },
//       onChanged: (v) {
//         formGlobalKey.currentState.validate();
//       },
//     );
//   }
//
//   Widget _middleWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.middleNameLabel,
//       hintText: AppStrings.middleNameLabel,
//       controller: middleNameController,
//       textInputType: TextInputType.text,
//       inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
//       validator: (value) {
//         if (value != middleNameController.text.trim()) {
//           return "Not allow black Space";
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _lastNameWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.lastNameLabel,
//       hintText: AppStrings.lastNameLabel,
//       controller: lastNameController,
//       textInputType: TextInputType.text,
//       inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
//       validator: (value) {
//         if (value != lastNameController.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
//           return "Enter Last Name";
//         }
//         return null;
//       },
//       onChanged: (v) {
//         formGlobalKey.currentState.validate();
//       },
//     );
//   }
//
//   Widget _guardianTypeDropDown() {
//     return ReusedDropDownString(
//       textLabel: AppStrings.guardianTypeLabel,
//       onChanged: (String value) {
//         setState(() => guardianTypeValue = value);
//       },
//       items: guardianTypeDropdownItems,
//       value: guardianTypeValue,
//       hint: 'Select Relation Type',
//     );
//   }
//
//   Widget _guardianNameWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.guardianNameLabel,
//       hintText: AppStrings.guardianNameLabel,
//       controller: guardianNameController,
//       textInputType: TextInputType.text,
//       inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
//       validator: (value) {
//         if (value != guardianNameController.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty) {
//           return "Please enter Guardian name";
//         } else if (!RegExp('.*[A-Z].*').hasMatch(value ?? '')) {
//           return 'Input should contain an uppercase letter A-Z.';
//         } else if (value.length <= 2) {
//           return "Enter a Guardian name 2+char long";
//         }
//         return null;
//       },
//       onChanged: (v) {
//         formGlobalKey.currentState.validate();
//       },
//     );
//   }
//
//   Widget _emailWidget() {
//     final RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     return TextFieldWidget(
//       headingLabel: AppStrings.emailAddressLabel,
//       hintText: "demo@gmail.com",
//       controller: emailIdController,
//       textCapitalization: TextCapitalization.none,
//       textInputType: TextInputType.emailAddress,
//       inputFormatters: [
//         FilteringTextInputFormatter.allow(RegExp("[a-z0-9@._-]")),
//       ],
//       validator: (value) {
//         if (value != emailIdController.text.trim()) {
//           return "Not allow black Space";
//         }
//         /* else if(!emailValid.hasMatch(value)){
//           return "demo@gmail.com";
//         }*/
//         return null;
//       },
//     );
//   }
//
//   Widget _propertyCategoryDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.propertyCategoryLabel,
//       onChanged: (OptionItem value) {
//         setState(() {
//           categoryValue = value;
//         });
//       },
//       items: propertyCategoryList,
//       value: categoryValue,
//       hint: 'Select Property Category',
//     );
//   }
//
//   Widget _propertyClassDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.propertyClassLabel,
//       onChanged: (OptionItem value) {
//         setState(() {
//           propertyClassValue = value;
//         });
//       },
//       items: propertyClassList,
//       value: propertyClassValue,
//       hint: 'Select Property Class',
//     );
//   }
//
//   Widget _depositAmountWidget() {
//     return TextFieldWidget(
//       enabled: false,
//       headingLabel: AppStrings.depositAmountControllerLabel,
//       hintText: AppStrings.depositAmountControllerLabel,
//       controller: depositAmountController,
//       textInputType: TextInputType.number,
//       validator: (value) {
//         if (value != depositAmountController.text.trim()) {
//           return "Not allow black Space";
//         }
//         return null;
//       },
//     );
//   }
//
//   getdepositTypeDropDown() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, left: 12, bottom: 0, right: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(
//             flex: 4,
//             child: DropdownButtonFormField<DepositItem>(
//               style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12),
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(4)),
//                   borderSide: BorderSide(width: 1, color: Colors.green),
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(4)),
//                   borderSide: BorderSide(width: 1, color: Colors.grey),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(4)),
//                   borderSide: BorderSide(width: 1, color: Colors.green),
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(4)),
//                     borderSide: BorderSide(
//                       width: 1,
//                     )),
//                 errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(width: 1, color: Colors.red)),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10),
//               ),
//               items: _propertyDropdownItemsDeposit,
//               value: _depositCategoryType,
//               hint: Text(
//                 AppStrings.depositTypeLabel,
//                 style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontWeight: FontWeight.normal),
//               ),
//               onChanged: (DepositItem value) {
//                 setState(() {
//                   _depositCategoryType = value;
//                   _schemeMonth = value.schememonth;
//                   print("_schemeMonth-->" + _schemeMonth.toString());
//                   if (_schemeMonth > 0) {
//                     _depositCategoryType = value;
//                     depositAmountController.text = value.firstamount.toString();
//                     print(depositAmountController.text.toString());
//                   } else {
//                     _depositCategoryType = value;
//                     depositAmountController.text = value.amount.toString();
//                     print(depositAmountController.text.toString());
//                   }
//                   AppStrings.depositName = value.title;
//                   AppStrings.depositAmountController = value.amount;
//                   gasDepositAmountController = value.gas_amount;
//                   schemeId = value.id;
//                   AppStrings.schemeType = value.scheme_type;
//                   AppStrings.schemeCode = value.scheme_code;
//                   AppStrings.depositAmount = value.deposit_amount;
//                   AppStrings.equipmentDepositAmount = value.equipment_deposit_amount;
//                   AppStrings.interestAmount = value.interest_amount;
//                   AppStrings.registrationGST = value.registration_gst;
//                   AppStrings.interestTaxAmt = value.interest_tax_amt;
//                   AppStrings.totalAmount = value.totalAmount;
//                   AppStrings.nextCycleAmount = value.nextCycleAmount;
//                   AppStrings.registrationTaxName = value.registration_tax_name;
//                   depositTotalAmount = value.total_amount;
//                   AppStrings.interestTaxAmt = value.interest_tax_amt;
//                   AppStrings.regTax = value.reg_tax;
//                   AppStrings.msgSchemeDetail = "Deposit Name = " +
//                       AppStrings.depositName +
//                       "\nDeposit Amount = " +
//                       AppStrings.depositAmountController.toString() +
//                       "\nSchemeMonth = " +
//                       _schemeMonth.toString() +
//                       "\nEquipment Deposit Amount = " +
//                       AppStrings.equipmentDepositAmount +
//                       "\nGAS Amount = " +
//                       gasDepositAmountController.toString() +
//                       "\nFirst Deposit Amount = " +
//                       value.firstamount.toString();
//                 });
//               },
//               isExpanded: true,
//               isDense: true,
//             ),
//           ),
//           Flexible(
//             flex: 2,
//             child: ButtonWidget(
//                 textButton: "Detail",
//                 onPressed: () {
//                   _showdepositAmountControllerDialog(AppStrings.msgSchemeDetail);
//                 }),
//           )
//         ],
//       ),
//     );
//   }
//
//   getDepositDetailButton(title, {alignment}) {
//     return ButtonWidget(
//         textButton: title,
//         onPressed: () {
//           _showdepositAmountControllerDialog(AppStrings.msgSchemeDetail);
//         });
//   }
//
//   _showdepositAmountControllerDialog(String _msg) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Description'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: [Text((_msg))],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _houseNumberWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.houseNumberLabel,
//       hintText: AppStrings.houseNumberLabel,
//       controller: houseNumberController,
//       textInputType: TextInputType.text,
//       validator: (value) {
//         if (value != houseNumberController.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty) {
//           return "Please enter house number";
//         }
//         return null;
//       },
//       onChanged: (v) {
//         formGlobalKey.currentState.validate();
//       },
//     );
//   }
//
//   Widget _buildingNumberWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.buildingNumberLabel,
//       hintText: AppStrings.buildingNumberLabel,
//       controller: buildingNumberController,
//       textInputType: TextInputType.text,
//       validator: (value) {
//         if (value != buildingNumberController.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty) {
//           return "Please enter building number";
//         }
//         return null;
//       },
//       onChanged: (v) {
//         formGlobalKey.currentState.validate();
//       },
//     );
//   }
//
//   Widget _apartmentWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.addressLabel,
//       hintText: AppStrings.addressLabel,
//       controller: colonySocietyApartmentController,
//       textInputType: TextInputType.text,
//       validator: (value) {
//         if (value != colonySocietyApartmentController.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty) {
//           return "Please enter Colony/Society/Apartment";
//         }
//         return null;
//       },
//       onChanged: (v) {
//         formGlobalKey.currentState.validate();
//       },
//     );
//   }
//
//   Widget _streetNameWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.streetNameLabel,
//       hintText: AppStrings.streetNameLabel,
//       controller: streetNameController,
//       textInputType: TextInputType.text,
//       validator: (value) {
//         if (value != streetNameController.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty) {
//           return "Please enter street name";
//         }
//         return null;
//       },
//       onChanged: (v) {
//         formGlobalKey.currentState.validate();
//       },
//     );
//   }
//
//   Widget _townWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.townLabel,
//       hintText: AppStrings.townLabel,
//       controller: townController,
//       textInputType: TextInputType.name,
//       inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
//       validator: (value) {
//         if (value != townController.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty) {
//           return "Please enter the town";
//         }
//         return null;
//       },
//       onChanged: (v) {
//         formGlobalKey.currentState.validate();
//       },
//     );
//   }
//
//   Widget _districtWidget() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.districtLabel,
//       items: getAllDistrictItems,
//       value: districtValue,
//       hint: AppStrings.districtLabel,
//       onChanged: (OptionItem value) {
//         setState(() {
//           getAllDistrictId = value.id;
//           districtValue = value;
//         });
//       },
//     );
//   }
//
//   Widget _pinCodeWidget() {
//     return TextFieldWidget(
//         headingLabel: AppStrings.pinCodeLabel,
//         hintText: AppStrings.pinCodeLabel,
//         controller: pinCodeController,
//         textInputType: TextInputType.number,
//         maxLength: 6,
//         validator: (value) {
//           if (value != pinCodeController.text.trim()) {
//             return "Not allow black Space";
//           } else if (value.isEmpty) {
//             return "Please enter Pin Number";
//           } else if (value.length <= 5) {
//             return 'Pin Number must be of 6 digit';
//           }
//           return null;
//         },
//         onChanged: (v) {
//           formGlobalKey.currentState.validate();
//         });
//   }
//
//   Widget _noKitchenWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.noOfKitchenLabel,
//       hintText: AppStrings.noOfKitchenLabel,
//       controller: kitchenController,
//       textInputType: TextInputType.number,
//       maxLength: 2,
//     );
//   }
//
//   Widget _noBathroomWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.noOfBathroomLabel,
//       hintText: AppStrings.noOfBathroomLabel,
//       controller: bathroomController,
//       textInputType: TextInputType.number,
//       maxLength: 2,
//     );
//   }
//
//   Widget _noFamilyWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.noOfFamilyMembersLabel,
//       hintText: AppStrings.noOfFamilyMembersLabel,
//       controller: familyMemController,
//       textInputType: TextInputType.number,
//       maxLength: 2,
//     );
//   }
//
//   Widget _ownerConsentWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Flexible(
//           flex: 4,
//           child: TextFieldWidget(
//             headingLabel: AppStrings.ownerConsentLabel,
//             hintText: AppStrings.ownerConsentLabel,
//             controller: ownerConsentController,
//             textInputType: TextInputType.text,
//             inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
//             validator: (value) {
//               if (value != ownerConsentController.text.trim()) {
//                 return "Not allow black Space";
//               }
//               return null;
//             },
//           ),
//         ),
//         Flexible(
//           flex: 4,
//           child: _ownerConsentImageWidget(),
//         ),
//       ],
//     );
//   }
//
//   Widget _locationWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Flexible(
//           flex: 4,
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 12.0, top: 8),
//               child: ButtonWidget(
//                 textButton: AppStrings.getLocationLabel,
//                 onPressed: () async {
//                   Position position = await _getCurrentLocation();
//                   latitudeController.text = position.latitude.toStringAsFixed(3);
//                   longitudeController.text = position.longitude.toStringAsFixed(3);
//                 },
//               ),
//             ),
//           ),
//         ),
//         Flexible(
//             flex: 3,
//             child: TextFieldWidget(
//               enabled: false,
//               headingLabel: AppStrings.locationLat,
//               hintText: AppStrings.locationLat,
//               controller: latitudeController,
//             )),
//         Flexible(
//           flex: 3,
//           child: TextFieldWidget(
//             enabled: false,
//             headingLabel: AppStrings.locationLong,
//             hintText: AppStrings.locationLong,
//             controller: longitudeController,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _landmarkWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.landmarkLabel,
//       hintText: AppStrings.landmarkLabel,
//       controller: landmarkController,
//       textInputType: TextInputType.text,
//       validator: (value) {
//         if (value != landmarkController.text.trim()) {
//           return "Not allow black Space";
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _fuelDropdownWidget() {
//     return ReusedDropDownString(
//       textLabel: AppStrings.existingCookingFuelLabel,
//       onChanged: (String value) {
//         setState(() => cookInFuelValue = value);
//       },
//       items: _cookingFuelDropdownItems,
//       value: cookInFuelValue,
//       hint: 'Select Existing Cooking Fuel',
//     );
//   }
//
//   _residentStatusDropdownWidget() {
//     return ReusedDropDownString(
//       textLabel: AppStrings.residentStatusLabel,
//       items: _residentDropdownItems,
//       value: _residentStatusValue,
//       hint: AppStrings.residentStatusLabel,
//       onChanged: (String value) {
//         setState(() => _residentStatusValue = value);
//       },
//     );
//   }
//
//   _docTypeDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.docTypeLabel,
//       hint: AppStrings.docTypeLabel,
//       items: idProofList,
//       value: idProofValue,
//       onChanged: (OptionItem value) {
//         setState(() {
//           idProofValue = value;
//         });
//       },
//     );
//   }
//
//   Widget _backNameWidget() {
//     return TextFieldWidget(
//         maxLength: 20,
//         headingLabel: AppStrings.customerAccountNoLabel,
//         hintText: AppStrings.customerAccountNoLabel,
//         controller: bankAccNoController,
//         textInputType: TextInputType.text,
//         validator: (value) {
//           if (value != bankAccNoController.text.trim()) {
//             return "Not allow black Space";
//           } else if (value.isEmpty) {
//             return "Please enter bank account number";
//           } else if (value.length <= 7) {
//             return 'bank account number must be of 6 digit';
//           }
//           return null;
//         },
//         onChanged: (v) {
//           formGlobalKey.currentState.validate();
//         });
//   }
//
//   Widget _micrCodeWidget() {
//     return TextFieldWidget(
//         headingLabel: AppStrings.mICRCodeLabel,
//         hintText: AppStrings.mICRCodeLabel,
//         maxLength: 9,
//         controller: mICRCodeController,
//         textInputType: TextInputType.number,
//         validator: (value) {
//           if (value != mICRCodeController.text.trim()) {
//             return "Not allow black Space";
//           } else if (value.isEmpty) {
//             return "Please enter MICR Code";
//           } else if (value.length <= 8) {
//             return 'MICR Code must be of 9 digit';
//           }
//           return null;
//         },
//         onChanged: (v) {
//           formGlobalKey.currentState.validate();
//         });
//   }
//
//   /////////////////////////////  image 1 ///////////////////////////////////////
//   Future<void> _openOwnerConsentImageSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getOwnerConsentImage(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getOwnerConsentImage(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getOwnerConsentImage({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           ownerConsentImageFile = pickedFile.path;
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openFrontImageSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () async {
//             Navigator.of(context).pop();
//             await getFrontImage(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () async {
//             Navigator.of(context).pop();
//             await getFrontImage(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getFrontImage({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           frontImageFile = pickedFile.path;
//           //   photoController.frontImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openBackImageSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getBackImage(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getBackImage(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getBackImage({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           backImageFile = pickedFile.path;
//           //  photoController.backImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openEleBillFrontSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getEleBillFrontImage(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getEleBillFrontImage(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getEleBillFrontImage({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           electricBillFrontImgFile = pickedFile.path;
//           // photoController.electricBillFrontImg = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openEleBackSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getEleBackImage(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getEleBackImage(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getEleBackImage({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           electricBillBackImgFile = pickedFile.path;
//           // photoController.electricBillBackImg = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openNocFrontImgSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getNocFrontImgImage(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getNocFrontImgImage(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getNocFrontImgImage({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           nocFrontImgFile = pickedFile.path;
//           // photoController.nocFrontImg = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openNocBackImgSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getNocBackImgImage(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getNocBackImgImage(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getNocBackImgImage({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           nocBackImgFile = pickedFile.path;
//           //  photoController.nocBackImg = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openCustomerImgSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getCustomerImage(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getCustomerImage(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getCustomerImage({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           customerImgFile = pickedFile.path;
//           //  photoController.nocBackImg = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openHouseImgSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getHouseImg(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getHouseImg(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getHouseImg({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           houseImgFile = pickedFile.path;
//           //  photoController.nocBackImg = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openConsentImgSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getConsentImgImage(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getConsentImgImage(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getConsentImgImage({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           consentPhotoFile = pickedFile.path;
//           // photoController.consentPhoto = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openChqCancelledImgSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getChqCancelledImg(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getChqCancelledImg(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getChqCancelledImg({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           chqCancelledPhotoFile = pickedFile.path;
//           //  photoController.chqCancelledPhoto = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Future<void> _openChqImgSource({BuildContext context, PhotoController controller}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return OpenImageSource(
//           onTapGallery: () {
//             Navigator.of(context).pop();
//             getChqImg(photoController: controller, imageSource: ImageSource.gallery);
//           },
//           onTapCamera: () {
//             Navigator.of(context).pop();
//             getChqImg(photoController: controller, imageSource: ImageSource.camera);
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> getChqImg({PhotoController photoController, ImageSource imageSource}) async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: imageSource, maxHeight: 480, maxWidth: 640, imageQuality: 25);
//       if (pickedFile != null || photoController != null) {
//         setState(() {
//           chqPhotoFile = pickedFile.path;
//           //  photoController.chqPhoto = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       CustomToast.showToast(e.toString());
//     }
//   }
//
//   Widget _ownerConsentImageWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.ownerConsentLabel),
//         InkWell(
//             onTap: () => _openOwnerConsentImageSource(context: context, controller: ownerConsentImageController),
//             child: ownerConsentImageFile != null && ownerConsentImageFile.isNotEmpty ? _fileImage(fileImage: File(ownerConsentImageFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _frontImageWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.idFrontImgSide),
//         InkWell(
//             onTap: () => _openFrontImageSource(context: context, controller: frontImageController),
//             child: frontImageFile != null && frontImageFile.isNotEmpty ? _fileImage(fileImage: File(frontImageFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _backImageWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.idBackImgSide),
//         InkWell(
//             onTap: () => _openBackImageSource(context: context, controller: backImageController),
//             child: backImageFile != null && backImageFile.isNotEmpty ? _fileImage(fileImage: File(backImageFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _electricBillFrontImgWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.electricBillFrontImgLabel),
//         InkWell(
//             onTap: () => _openEleBillFrontSource(context: context, controller: eleBillFrontImgController),
//             child: electricBillFrontImgFile != null && electricBillFrontImgFile.isNotEmpty ? _fileImage(fileImage: File(electricBillFrontImgFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _electricBillBackImgWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.electricBillBackImgLabel),
//         InkWell(
//             onTap: () => _openEleBackSource(context: context, controller: eleBillBackImgController),
//             child: electricBillBackImgFile != null && electricBillBackImgFile.isNotEmpty ? _fileImage(fileImage: File(electricBillBackImgFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _nocFrontImageWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.nocFrontImgLabel),
//         InkWell(
//             onTap: () => _openNocFrontImgSource(context: context, controller: nocFrontImgController),
//             child: nocFrontImgFile != null && nocFrontImgFile.isNotEmpty ? _fileImage(fileImage: File(nocFrontImgFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _nocBackImageWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.nocBackImgLabel),
//         InkWell(
//             onTap: () => _openNocBackImgSource(context: context, controller: nocBackImgController),
//             child: nocBackImgFile != null && nocBackImgFile.isNotEmpty ? _fileImage(fileImage: File(nocBackImgFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _customerImageWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.customerImgLabel),
//         InkWell(
//             onTap: () => _openCustomerImgSource(context: context, controller: customerImgController),
//             child: customerImgFile != null && customerImgFile.isNotEmpty ? _fileImage(fileImage: File(customerImgFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _rowWidget({Widget widget1, Widget widget2}) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, left: 12, bottom: 0, right: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [widget1, widget2],
//       ),
//     );
//   }
//
//   Widget _houseNumImageWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.houseImgLabel),
//         InkWell(
//             onTap: () => _openHouseImgSource(context: context, controller: houseImgController),
//             child: houseImgFile != null && houseImgFile.isNotEmpty ? _fileImage(fileImage: File(houseImgFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _consentImageWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.consentPhotoLabel),
//         InkWell(
//             onTap: () => _openConsentImgSource(context: context, controller: consentImageController),
//             child: consentPhotoFile != null && consentPhotoFile.isNotEmpty ? _fileImage(fileImage: File(consentPhotoFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _cancelChqImageWidget() {
//     return Column(
//       children: [
//         _imageNameWidget(imageName: AppStrings.chqCancelledPhotoLabel),
//         InkWell(
//             onTap: () => _openChqCancelledImgSource(context: context, controller: cancelChqImageController),
//             child: chqCancelledPhotoFile != null && chqCancelledPhotoFile.isNotEmpty ? _fileImage(fileImage: File(chqCancelledPhotoFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _chequeImageWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         _imageNameWidget(imageName: AppStrings.chqPhotoLabel),
//         InkWell(
//             onTap: () => _openChqImgSource(context: context, controller: chqImgController),
//             child: chqPhotoFile != null && chqPhotoFile.isNotEmpty ? _fileImage(fileImage: File(chqPhotoFile)) : _localBorderImg()),
//       ],
//     );
//   }
//
//   Widget _nocProofNoWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.nocProofNoLabel,
//       hintText: AppStrings.nocProofNoLabel,
//       controller: nocProofNoController,
//       textInputType: TextInputType.text,
//       maxLength: 20,
//       validator: (value) {
//         if (value != nocProofNoController.text.trim()) {
//           return "Not allow black Space";
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _idProofNoWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.idProofNo,
//       hintText: AppStrings.idProofNo,
//       controller: idProofNoController,
//       textInputType: TextInputType.text,
//       maxLength: 20,
//       inputFormatters: [
//         FilteringTextInputFormatter.allow(RegExp(
//           "[a-zA-Z-0-9\u0900-\u097F]",
//         ))
//       ],
//       validator: (value) {
//         if (value != idProofNoController.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty) {
//           return "Please enter id proof no.";
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _ownerProofNoWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.ownershipProofNo,
//       hintText: AppStrings.ownershipProofNo,
//       controller: ownershipController,
//       textInputType: TextInputType.text,
//       maxLength: 20,
//       validator: (value) {
//         if (value != ownershipController.text.trim()) {
//           return "Not allow black Space";
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget getDropDown2() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.docTypeLabel,
//       hint: AppStrings.docTypeLabel,
//       items: _addressProofDropdownItems,
//       value: _addressProofDropDownValue,
//       onChanged: (OptionItem value) {
//         log(value.id);
//         setState(() {
//           _addressProofDropDownValueId = value.id;
//           _addressProofDropDownValue = value;
//         });
//       },
//     );
//   }
//
//   Widget getDropDown3() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.docTypeLabel,
//       hint: AppStrings.docTypeLabel,
//       items: _kycProofDropdownItems,
//       value: _kycProofDropDownValue,
//       onChanged: (value) {
//         log(value.id);
//         setState(() {
//           _kycProofDropDownValue = value;
//         });
//       },
//     );
//   }
//
//   Widget _billModeDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: AppStrings.billingModeLabel,
//       hint: AppStrings.billingModeLabel,
//       items: billingModeList,
//       value: billingModeValue,
//       onChanged: (value) {
//         setState(() {
//           billingModeId = value.id;
//           billingModeValue = value;
//         });
//       },
//     );
//   }
//
//   Widget _customerBankDropDown() {
//     return ReusedDropDownString(
//       textLabel: AppStrings.customerBankNameLabel,
//       hint: AppStrings.customerBankNameLabel,
//       items: _bankDropdownItems.map((String item) {
//         return DropdownMenuItem<String>(value: item, child: Text(item));
//       }).toList(),
//       value: _bankValue,
//       onChanged: (value) {
//         setState(() {
//           _bankValue = value;
//           print("_bankValue-->" + _bankValue);
//         });
//       },
//     );
//   }
//
//   Widget _customerBackNoWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.customerAccountNoLabel,
//       hintText: AppStrings.customerAccountNoLabel,
//       controller: customerAccountNum,
//       textInputType: TextInputType.text,
//       maxLength: 20,
//       /*  validator: (value) {
//           if (value != customerAccountNum.text.trim()) {
//             return "Not allow black Space";
//           } else if (value.isEmpty) {
//             return "Please enter Customer Account Number";
//           } else if (value.length <= 16) {
//             return "Customer Account Number must be of 17 digit";
//           }
//           return null;
//         },
//         onChanged: (v) {
//           formGlobalKey.currentState.validate();
//         }*/
//     );
//   }
//
//   Widget _customerIFSCCodeWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.customerIfscCodeLabel,
//       hintText: AppStrings.customerIfscCodeLabel,
//       controller: IFSCController,
//       textInputType: TextInputType.text,
//       maxLength: 11,
//       /*  validator: (value) {
//           if (value != IFSCController.text.trim()) {
//             return "Not allow black Space";
//           } else if (value.isEmpty) {
//             return "Please enter Customer Ifsc Code";
//           } else if (value.length <= 10) {
//             return "Customer Ifsc Code must be of 11 digit";
//           }
//           return null;
//         },
//         onChanged: (v) {
//           formGlobalKey.currentState.validate();
//         }*/
//     );
//   }
//
//   Widget _customerBankAddWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.customerBankAddress,
//       hintText: AppStrings.customerBankAddress,
//       controller: bank_address,
//       textInputType: TextInputType.text,
//       /*  validator: (value) {
//         if (value != bank_address.text.trim()) {
//           return "Not allow black Space";
//         } else if (value.isEmpty) {
//           return "Please enter the customer bank address";
//         }
//         return null;
//       },
//       onChanged: (v) {
//         formGlobalKey.currentState.validate();
//       },*/
//     );
//   }
//
//   Widget _depositStatusDropDown() {
//     return ReusedDropDownOptionItem(
//       textLabel: "",
//       hint: AppStrings.depositStatusLabel,
//       items: dropListDepositStatusList,
//       value: depositStatusValue,
//       onChanged: (value) {
//         setState(() {
//           _depositStatusId = value.id;
//           depositStatusValue = value;
//           if (_depositStatusId != '2') {
//             reasonNoController.text = '';
//           }
//         });
//       },
//     );
//   }
//
//   Widget _reasonDepositStatusWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.reasonLabel,
//       hintText: AppStrings.reasonLabel,
//       controller: reasonNoController,
//       textInputType: TextInputType.text,
//       validator: (value) {
//         if (value != reasonNoController.text.trim()) {
//           return "Not allow black Space";
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _modeDepositDropDown() {
//     return ReusedDropDownOptionItem(
//         textLabel: AppStrings.modeOfDepositLabel,
//         hint: AppStrings.modeOfDepositLabel,
//         items: modeOfDepositList,
//         value: modeDepositValue,
//         onChanged: (OptionItem item) {
//           setState(() {
//             modeOfDepositId = item.id;
//             modeDepositValue = item;
//             print("_modeOfDeposit-->" + modeOfDepositId.toString());
//           });
//
//           if (modeDepositValue.id == "2") {
//             setState(() {
//               isDepositCheq = false;
//               modeOfDepositId = item.id;
//               modeDepositValue.id = item.id;
//               chqNOController.clear();
//               bankAccNoController.text = "";
//               mICRCodeController.text = "";
//               mICRCodeController.clear();
//               initDepDateController.clear();
//               chqDateController.text = "";
//             });
//           } else if (modeDepositValue.id == "1") {
//             setState(() {
//               modeOfDepositId = item.id;
//               modeDepositValue.id = item.id;
//               isDepositCheq = true;
//             });
//           }
//         });
//   }
//
//   Widget _chqNoWidget() {
//     return TextFieldWidget(
//       headingLabel: AppStrings.chqNoLabel,
//       hintText: AppStrings.chqNoLabel,
//       controller: chqNOController,
//       maxLength: 5,
//       textInputType: TextInputType.number,
//       validator: (value) {
//         if (value != chqNOController.text.trim()) {
//           return "Not allow black Space";
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _depositDateWidget() {
//     return TextFieldWidget(
//       prefixIcon: Icon(Icons.calendar_today),
//       hintText: AppStrings.depositDateLabel,
//       controller: initDepDateController,
//       readOnly: true,
//       textInputType: TextInputType.datetime,
//       onTap: () => _selectDate(context),
//     );
//   }
//
//   DateTime selectedDate = DateTime.now();
//   Future _selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015), lastDate: DateTime(2101));
//     if (picked != null)
//       setState(() {
//         selectedDate = picked;
//         initDepDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
//       });
//   }
//
//   Widget _bankNameDropDown() {
//     return ReusedDropDownString(
//       textLabel: AppStrings.bankNameLabel,
//       hint: AppStrings.bankNameLabel,
//       items: _bankDropdownItems2 != null
//           ? _bankDropdownItems2.map((String item) {
//         return DropdownMenuItem<String>(
//           value: item,
//           child: Text(item),
//         );
//       }).toList()
//           : [],
//       value: _bankValue2,
//       onChanged: (String value) {
//         setState(() {
//           _bankValue2 = value;
//           print("_bankValue2--->" + _bankValue2);
//         });
//       },
//     );
//   }
//
//   Widget _buildCardWidget({String text}) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//       child: Card(
//         shape: Border(
//           left: BorderSide(color: Colors.red, width: 8),
//           right: BorderSide(color: Colors.blue.shade900, width: 8),
//         ),
//         elevation: 5,
//         shadowColor: Colors.lightBlueAccent,
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
//           child: Text(
//             text,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _localBorderImg() {
//     return CircleAvatar(
//       radius: 41,
//       backgroundColor: Colors.blue.shade900,
//       child: CircleAvatar(
//           radius: 40,
//           backgroundColor: Colors.white,
//           child: ClipRRect(
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Image.asset('assets/images/place_holder.png'),
//             ),
//           )),
//     );
//   }
//
//   Widget _fileImage({
//     File fileImage,
//   }) {
//     if (fileImage.path.isNotEmpty) {
//       return CircleAvatar(
//         radius: 41,
//         backgroundColor: Colors.blue.shade900,
//         child: CircleAvatar(
//           radius: 40,
//           backgroundImage: FileImage(fileImage),
//         ),
//       );
//     } else {
//       return CircleAvatar(
//         radius: 41,
//         child: CircleAvatar(
//           backgroundImage: FileImage(fileImage),
//           radius: 40,
//         ),
//       );
//     }
//   }
//
//   Widget _imageNameWidget({String imageName}) {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//         margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//         ),
//         child: Text(
//           imageName,
//           style: TextStyle(color: Colors.white),
//         ));
//   }
//
//   Widget _buildRow({String leading, String trailing}) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Flexible(child: Text(leading.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),)),
//               Flexible(child: Text(trailing,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12)))
//             ],
//           ),
//         ),
//         Divider()
//       ],
//     );
//   }
//
//   Widget _imageColumn({Widget leadingImg, Widget trailingImg}){
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               leadingImg,
//               trailingImg
//             ],
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }
//
//   Future<void> fetchDistrict() async {
//     var resAllDistrict = prefs.getString(GlobalConstants.AllDistrict);
//     List dataChargeList = json.decode(resAllDistrict);
//     List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
//       dataChargeList.length,
//           (i) => DropdownMenuItem(
//         value: OptionItem(id: dataChargeList[i]['id'], title: dataChargeList[i]['district_name']),
//         child: Text("${dataChargeList[i]['district_name']}"),
//       ),
//     );
//     if (!mounted) return;
//     setState(() {
//       getAllDistrictItems = menuItems;
//       if (widget.isUpdate == true) {
//         if (widget.studentModel.districtId != null) {
//           districtValue = getAllDistrictItems.firstWhere((element) => element.value.id == widget.studentModel.districtId, orElse: null).value;
//         }
//       }
//     });
//   }
//
//   Future<void> fetchArea(String id) async {
//     var resArea = prefs.getString(GlobalConstants.area);
//     List dataList = json.decode(resArea);
//     List<DropdownMenuItem<OptionItem>> menuItems = [];
//     for (int i = 0; i < dataList.length; i++) {
//       if (dataList[i]['charge_area_id'] == id) {
//         menuItems.add(DropdownMenuItem(
//           value: OptionItem(id: dataList[i]['gid'], title: dataList[i]['area_name']),
//           child: Text("${dataList[i]['area_name']}"),
//         ));
//       }
//     }
//     if (!mounted) return;
//     setState(() {
//       areaItems = menuItems;
//       if (widget.isUpdate == true) {
//         if (widget.studentModel.areaId != null) {
//           areaTypeValue = areaItems.firstWhere((element) => element.value.id == widget.studentModel.areaId, orElse: null).value;
//         }
//       }
//     });
//   }
//
//   Future<void> fetchChargeAreaList() async {
//     var resChargeAreaName = prefs.getString(GlobalConstants.chargeAreaName);
//     List dataChargeList = json.decode(resChargeAreaName);
//     //   _toastMsg(dataList.toString());
//     log(dataChargeList.toString());
//     List<DropdownMenuItem<OptionItem>> menuItems = List.generate(
//       dataChargeList.length,
//           (i) => DropdownMenuItem(
//         value: OptionItem(id: dataChargeList[i]['gid'], title: dataChargeList[i]['charge_area_name']),
//         child: Text("${dataChargeList[i]['charge_area_name']}"),
//       ),
//     );
//     if (!mounted) return;
//     setState(() {
//       chargeAreaItems = menuItems;
//       //  chargeAreaId = chargeAreaType.title.toString();
//       if (widget.isUpdate == true) {
//         if (widget.studentModel.chargeArea != null) {
//           chargeAreaType = chargeAreaItems.firstWhere((element) => element.value.id == widget.studentModel.chargeArea, orElse: null).value;
//         }
//       }
//     });
//     if (widget.isUpdate == true) {
//       fetchArea(chargeAreaType.id);
//     } else {
//       fetchArea(dataChargeList[0]['gid']);
//     }
//   }
//
//   Future<void> interestedDorpdownList() async {
//     var resInterested = prefs.getString(GlobalConstants.Interested);
//     final decoded = jsonDecode(resInterested) as Map;
//     decoded.forEach((k, v) {
//       dropListModelInterested.add(DropdownMenuItem(
//         value: OptionItem(id: k, title: v),
//         child: Text(v),
//       ));
//     });
//     setState(() {
//       _isInterestedItem = dropListModelInterested.first.value;
//       _isInterestedId = _isInterestedItem.id;
//     });
//   }
//
//   Future<void> _getSocietyAllow() async {
//     var resSociatyAllow = prefs.getString(GlobalConstants.sociaty_allow);
//     final decoded = jsonDecode(resSociatyAllow) as Map;
//     decoded.forEach((k, v) {
//       _mdpeDropdownItems.add(DropdownMenuItem(
//         value: v,
//         child: Text(v),
//       ));
//     });
//     _mdpeValue = decoded.values.first;
//     setState(() {});
//   }
//
//   Future<void> _getExistingCookingFuel() async {
//     var resCookingFuel = prefs.getString(GlobalConstants.CookingFuel);
//     final decoded = jsonDecode(resCookingFuel) as Map;
//     for (final name in decoded.values) {
//       _cookingFuelDropdownItems.add(DropdownMenuItem(
//         value: name,
//         child: Text(name),
//       ));
//     }
//     cookInFuelValue = decoded.values.first;
//     setState(() {});
//   }
//
//   Future<void> _getGuardianType() async {
//     var resGuardianType = prefs.getString(GlobalConstants.GuardianType);
//     final decoded = jsonDecode(resGuardianType) as Map;
//     for (final name in decoded.values) {
//       guardianTypeDropdownItems.add(DropdownMenuItem(
//         value: name,
//         child: Text(name),
//       ));
//     }
//     guardianTypeValue = decoded.values.first;
//     setState(() {});
//   }
//
//   Future<void> _getResidentStatus() async {
//     var resResidentStatus = prefs.getString(GlobalConstants.ResidentStatus);
//     final decoded = jsonDecode(resResidentStatus) as Map;
//     for (final name in decoded.values) {
//       _residentDropdownItems.add(DropdownMenuItem(
//         value: name,
//         child: Text(name),
//       ));
//     }
//     _residentStatusValue = decoded.values.first;
//     setState(() {});
//   }
//
//   Future<void> _getPropertyCategory() async {
//     var resPropertyCategory = prefs.getString(GlobalConstants.PropertyCategory);
//     List dataList = json.decode(resPropertyCategory);
//     List<DropdownMenuItem<OptionItem>> menuItems = [];
//     menuItems.add(DropdownMenuItem(
//       value: OptionItem(id: '0', title: 'Select Property Category'),
//       child: Text('Select Property Category'),
//     ));
//     menuItems = List.generate(
//       dataList.length,
//           (i) => DropdownMenuItem(
//         value: OptionItem(id: dataList[i]['id'], title: dataList[i]['name']),
//         child: Text("${dataList[i]['name']}"),
//       ),
//     );
//     if (!mounted) return;
//     setState(() {
//       propertyCategoryList = menuItems;
//       categoryValue = menuItems.first.value;
//       if (widget.isUpdate == true) {
//         if (widget.studentModel.propertyCategoryId != null) {
//           categoryValue = propertyCategoryList.firstWhere((element) => element.value.id == widget.studentModel.propertyCategoryId, orElse: null).value;
//         }
//       }
//     });
//   }
//
//   Future<void> _getPropertyClass() async {
//     var resPropertyClass = prefs.getString(GlobalConstants.propertyclass);
//     List dataList = json.decode(resPropertyClass);
//     List<DropdownMenuItem<OptionItem>> menuItems = [];
//     menuItems = List.generate(
//       dataList.length,
//           (i) => DropdownMenuItem(
//         value: OptionItem(id: dataList[i]['id'], title: dataList[i]['name']),
//         child: Text("${dataList[i]['name']}"),
//       ),
//     );
//     if (!mounted) return;
//     setState(() {
//       propertyClassList = menuItems;
//       propertyClassValue = menuItems.first.value;
//       if (widget.isUpdate == true) {
//         if (widget.studentModel.propertyClassId != null) {
//           propertyClassValue = propertyClassList.firstWhere((element) => element.value.id == widget.studentModel.propertyClassId, orElse: null).value;
//         }
//       }
//     });
//   }
//
//   Future<void> _getIdProofArray() async {
//     var resIdentityProof = prefs.getString(GlobalConstants.IdentityProof);
//     final decoded = jsonDecode(resIdentityProof) as Map;
//     decoded.forEach((k, v) {
//       idProofList.add(DropdownMenuItem(
//         value: OptionItem(id: k, title: v),
//         child: Text(v),
//       ));
//     });
//     idProofValue = idProofList.first.value;
//     if (widget.isUpdate == true) {
//       if (widget.studentModel.kycDocument1 != null) {
//         idProofValue = idProofList.firstWhere((element) => element.value.id == widget.studentModel.kycDocument1).value;
//       }
//     }
//     setState(() {});
//   }
//
//   Future<void> _getAddressProofArray() async {
//     var resOwnershipProof = prefs.getString(GlobalConstants.OwnershipProof);
//     final decoded = jsonDecode(resOwnershipProof) as Map;
//     decoded.forEach((k, v) {
//       _addressProofDropdownItems.add(DropdownMenuItem(
//         value: OptionItem(id: k, title: v),
//         child: Text(v),
//       ));
//     });
//     _addressProofDropDownValue = _addressProofDropdownItems.first.value;
//     _addressProofDropDownValueId = _addressProofDropDownValue.id;
//
//     setState(() {});
//   }
//
//   Future<void> _getKycProofArray() async {
//     var resKycDoc = prefs.getString(GlobalConstants.KycDoc);
//     final decoded = jsonDecode(resKycDoc) as Map;
//     decoded.forEach((k, v) {
//       _kycProofDropdownItems.add(DropdownMenuItem(
//         value: OptionItem(id: k, title: v),
//         child: Text(v),
//       ));
//     });
//     _kycProofDropDownValue = _kycProofDropdownItems.first.value;
//     if (widget.isUpdate == true) {
//       if (widget.studentModel.kycDocument3 != null) {
//         _kycProofDropDownValue = _kycProofDropdownItems.firstWhere((element) => element.value.id == widget.studentModel.kycDocument3, orElse: null).value;
//       }
//     }
//     setState(() {});
//   }
//
//   Future<void> _getBank() async {
//     var resAllBanks = prefs.getString(GlobalConstants.AllBanks);
//     final decoded = (jsonDecode(resAllBanks) as List<dynamic>).cast<String>();
//     log("getBankGetBank---> $resAllBanks");
//     setState(() {
//       _bankDropdownItems = decoded;
//     });
//   }
//
//   Future<void> _getBank2() async {
//     var resAllBanks = prefs.getString(GlobalConstants.AllBanks);
//     final decoded = (jsonDecode(resAllBanks) as List<dynamic>).cast<String>();
//     log("getBankGetBank2--> $resAllBanks");
//     setState(() {
//       _bankDropdownItems2 = decoded;
//       if (widget.isUpdate == true) {
//         if (widget.studentModel.payementBankName != null && widget.studentModel.payementBankName.isNotEmpty) {
//           _bankValue2 = widget.studentModel.payementBankName;
//         }
//       }
//     });
//   }
//
//   Future<void> _getBillingModeList() async {
//     var resEbilling = prefs.getString(GlobalConstants.Ebilling);
//     final decoded = jsonDecode(resEbilling) as Map;
//     log("Ebilling --> $resEbilling");
//     decoded.forEach((k, v) {
//       billingModeList.add(DropdownMenuItem(
//         value: OptionItem(id: k, title: v),
//         child: Text(v),
//       ));
//     });
//     setState(() {
//       billingModeValue = billingModeList.first.value;
//       billingModeId = billingModeValue.id;
//       if (widget.isUpdate == true) {
//         if (widget.studentModel.billingModel != null) {
//           billingModeValue = billingModeList.firstWhere((element) => element.value.id == widget.studentModel.billingModel, orElse: null).value;
//         }
//       }
//     });
//   }
//
//   Future<void> _getAcceptConversionPolicyList() async {
//     var resConversionPolicy = prefs.getString(GlobalConstants.ConversionPolicy);
//     final decoded = jsonDecode(resConversionPolicy) as Map;
//     decoded.forEach((k, v) {
//       _acceptConversionPolicyList.add(DropdownMenuItem(
//         value: OptionItem(id: k, title: v),
//         child: Text(v),
//       ));
//     });
//     __acceptConversionPolicyValue = _acceptConversionPolicyList.first.value;
//     __acceptConversionPolicyValueId = __acceptConversionPolicyValue.id;
//     if (widget.isUpdate == true) {
//       if (widget.studentModel.acceptConversionPolicy != null) {
//         __acceptConversionPolicyValue = _acceptConversionPolicyList.firstWhere((element) => element.value.id == widget.studentModel.acceptConversionPolicy, orElse: null).value;
//       }
//     }
//     setState(() {});
//   }
//
//   Future<void> _getAcceptExtraFittingCostList() async {
//     var resExtraFittingCost = prefs.getString(GlobalConstants.ExtraFittingCost);
//     final decoded = jsonDecode(resExtraFittingCost) as Map;
//     decoded.forEach((k, v) {
//       _acceptExtraFittingCostList.add(DropdownMenuItem(
//         value: OptionItem(id: k, title: v),
//         child: Text(v),
//       ));
//     });
//     acceptExtraFittingCostValue = _acceptExtraFittingCostList.first.value;
//     __acceptExtraFittingCostValueId = acceptExtraFittingCostValue.id;
//     if (widget.isUpdate == true) {
//       if (widget.studentModel.acceptExtraFittingCost != null) {
//         acceptExtraFittingCostValue = _acceptExtraFittingCostList.firstWhere((element) => element.value.id == widget.studentModel.acceptExtraFittingCost, orElse: null).value;
//       }
//     }
//     setState(() {});
//   }
//
//   Future<void> _getMdeOfDeposite() async {
//     var resMdeOfDeposite = prefs.getString(GlobalConstants.MdeOfDeposite);
//     final decoded = jsonDecode(resMdeOfDeposite) as Map;
//     decoded.forEach((k, v) {
//       modeOfDepositList.add(DropdownMenuItem(
//         value: OptionItem(id: k, title: v),
//         child: Text(v),
//       ));
//     });
//     setState(() {
//       if (widget.isUpdate == true) {
//         if (widget.studentModel.modeOfDeposite != null) {
//           modeDepositValue = modeOfDepositList.firstWhere((element) => element.value.id == widget.studentModel.modeOfDeposite, orElse: null).value;
//         }
//       }
//       modeOfDepositId = modeDepositValue.id;
//     });
//   }
//
//   Future<void> _getInitialDepositeStatusList() async {
//     var resDepositeStatus = prefs.getString(GlobalConstants.DepositeStatus);
//     final decoded = jsonDecode(resDepositeStatus) as Map;
//     log("_getInitialDepositeStatusList$resDepositeStatus");
//     decoded.forEach((k, v) {
//       dropListDepositStatusList.add(DropdownMenuItem(
//         value: OptionItem(id: k, title: v),
//         child: Text(v),
//       ));
//     });
//     setState(() {
//       depositStatusValue = dropListDepositStatusList.first.value;
//       _depositStatusId = depositStatusValue.id;
//       if (widget.isUpdate == true) {
//         if (widget.studentModel.initialDepositeStatus != null) {
//           depositStatusValue = dropListDepositStatusList.firstWhere((element) => element.value.id == widget.studentModel.initialDepositeStatus, orElse: null).value;
//         }
//       }
//     });
//   }
//
//   Future<void> _getAllDepositScheme() async {
//     var resSchemeType = prefs.getString(GlobalConstants.SchemeType);
//     List dataList = json.decode(resSchemeType);
//     List<DropdownMenuItem<DepositItem>> menuItems = [];
//     List<DropdownMenuItem<DepositItem>> menuItems2 = [];
//     menuItems.add(DropdownMenuItem(
//       value: DepositItem(
//           id: "0",
//           title: "Select Deposit Type",
//           firstamount: 0,
//           amount: '0.0',
//           schememonth: 0,
//           gas_amount: 0,
//           scheme_type: '',
//           scheme_code: '',
//           deposit_amount: '',
//           equipment_deposit_amount: '',
//           interest_amount: '',
//           registration_gst: '',
//           totalAmount: '',
//           nextCycleAmount: '',
//           registration_tax_name: '',
//           interest_tax_amt: '',
//           reg_tax: ''),
//       child: Text('Select Deposit Type'),
//     ));
//     menuItems2 = List.generate(
//       dataList.length,
//           (i) => DropdownMenuItem(
//         value: DepositItem(
//             id: dataList[i]['deposit_types_id'],
//             title: dataList[i]['deposit_name'],
//             firstamount: dataList[i]['firstDepositAmount'],
//             amount: dataList[i]['totalAmount'],
//             schememonth: dataList[i]['scheme_month'],
//             gas_amount: dataList[i]['gas_deposit_amount'],
//             scheme_type: dataList[i]['scheme_type'],
//             scheme_code: dataList[i]['scheme_code'],
//             deposit_amount: dataList[i]['deposit_amount'],
//             equipment_deposit_amount: dataList[i]['equipment_deposit_amount'],
//             interest_amount: dataList[i]['interest_amount'],
//             registration_gst: dataList[i]['registration_gst'],
//             totalAmount: dataList[i]['totalAmount'],
//             nextCycleAmount: dataList[i]['nextCycleAmount'],
//             registration_tax_name: dataList[i]['registration_tax_name'],
//             interest_tax_amt: dataList[i]['interest_tax_amt'],
//             reg_tax: dataList[i]['reg_tax']),
//         child: Text("${dataList[i]['deposit_name']}"),
//       ),
//     );
//     menuItems.addAll(menuItems2);
//     if (!mounted) return;
//     setState(() {
//       _propertyDropdownItemsDeposit = menuItems;
//       if (widget.isUpdate) {
//         depositAmountController.text = widget.studentModel.initialAmount;
//         if (widget.studentModel.depositeType != null) {
//           _depositCategoryType = _propertyDropdownItemsDeposit.firstWhere((element) => element.value.id.toString() == widget.studentModel.depositeType, orElse: null).value;
//           depositAmountController.text = _depositCategoryType.amount.toString();
//         }
//       }
//     });
//     return;
//   }
//
//   Future<void> fetchLabels() async {
//     String strUrl = GlobalConstants.getLabels;
//     final response = await http.get(
//       Uri.parse(strUrl),
//     );
//     var album = HpclLabals.fromJson(json.decode(response.body));
//     var registration = album.deposit;
//     // AppStrings.mobileNoLabel = album.steps.mobile;
//     // AppStrings.firstNameLabel = album.steps.firstname;
//     //  AppStrings.middleNameLabel = album.steps.middlename;
//     // AppStrings.lastNameLabel = album.steps.lastname;
//     //  AppStrings.btnLabel = album.steps.button;
//     AppStrings.feeChargeLabel = "fee charge";
//     //  AppStrings.depositStatusLabel = registration.depositSta;
//     //   AppStrings.reasonLabel = registration.reason;
//     //   AppStrings.modeOfDepositLabel = registration.modeOfDep;
//     //   AppStrings.depositDateLabel = registration.depositDate;
//     //  schemeTypeLabel = registration.depositType;
//     //  AppStrings.depositAmountControllerLabel = registration.depositAmt;
//     //   AppStrings.chqNoLabel = registration.chqNum;
//     //   AppStrings.chqBankLabel = registration.chqBank;
//     //  AppStrings.accountNoLabel = registration.bankAcc;
//     //  AppStrings.chqPhotoLabel = registration.chqPhoto;
//     //  AppStrings.formStatusLabel = registration.payStatus;
//     if (!mounted) return;
//   }
//
//   ConnectivityResult connectionStatus = ConnectivityResult.none;
//   final Connectivity _connectivity = Connectivity();
//   StreamSubscription<ConnectivityResult> _connectivitySubscription;
//
//   Future<void> initConnectivity() async {
//     ConnectivityResult result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await _connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       log('Couldn\'t check connectivity status', error: e);
//       return;
//     }
//     if (!mounted) {
//       return Future.value(null);
//     }
//     return _updateConnectionStatus(result);
//   }
//
//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     setState(() {
//       connectionStatus = result;
//     });
//   }
//
//   AlertDialog buildAlertDialog() {
//     return AlertDialog(
//       title: Center(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text("Your are connected to ${isWifiConnected ? "WIFI" : "MOBILE DATA"}"),
//               Text(isWifiConnected ? "$wifiBSSID" : "Not Wifi"),
//               Text("$wifiIP"),
//               Text("$wifiName")
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
