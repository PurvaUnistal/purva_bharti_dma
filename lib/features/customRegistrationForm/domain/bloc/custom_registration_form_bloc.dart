import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/Model/CustRegSyncModel.dart';


class CustomRegistrationFormBloc extends Bloc<CustomRegistrationFormEvent, CustomRegistrationFormState> {
  CustomRegistrationFormBloc() : super(CustomRegistrationFormInitialState()) {
    on<CustomRegistrationFormPageLoadEvent>(_pageLoad);
    on<CustomRegistrationFormSetInterestValue>(_setInterestValue);
    on<CustomRegistrationFormSetConversionPolicyValue>(_setConversionPolicyValue);
    on<CustomRegistrationFormSetExtraFittingValue>(_setExtraFittingValue);
    on<CustomRegistrationFormSetSocietyAllowValue>(_setSocietyAllowValue);
    on<CustomRegistrationFormSetChargeAreaValue>(_setChargeAreaValue);
    on<CustomRegistrationFormSetAreaValue>(_setAreaValue);
    on<CustomRegistrationFormSetGuardianTypeValue>(_setGuardianTypeValue);
    on<CustomRegistrationFormSetPropertyCategoryValue>(_setPropertyCategoryValue);
    on<CustomRegistrationFormSetPropertyClassValue>(_setPropertyClassValue);
    on<CustomRegistrationFormSetDistrictValue>(_setDistrictValue);
    on<CustomRegistrationFormSetLocation>(_btnLocation);
    on<CustomRegistrationFormSetResidentStatusValue>(_setResidentStatusValue);
    on<CustomRegistrationFormSetExistingCookingFuelValue>(_setExistingCookingFuelValue);
    on<CustomRegistrationFormSetKycDoc1Value>(_setKycDoc1Value);
    on<CustomRegistrationFormSetKycDoc2Value>(_setKycDoc2Value);
    on<CustomRegistrationFormSetKycDoc3Value>(_setKycDoc3Value);
    on<CustomRegistrationFormSetPreferredBillValue>(_setPreferredBillValue);
    on<CustomRegistrationFormSetCustBankNameValue>(_setCustBankNameValue);
    on<CustomRegistrationFormSetPaymentBankNameValue>(_setPaymentBankNameValue);
    on<CustomRegistrationFormSetInitialDepositStatusValue>(_setInitialDepositStatusValue);
    on<CustomRegistrationFormSetDepositTypeValue>(_setDepositTypeValue);
    on<CustomRegistrationFormSetModeDepositValue>(_setModeDepositValue);
    on<CustomRegistrationFormSetChequeDateEvent>(_setChequeDate);
    on<CustomRegistrationFormPreviewPageEvent>(_previewPage);
    on<CustomRegistrationFormSaveLocalDataEvent>(_saveLocalData);
    on<CustomRegistrationFormLoadUpdateLocalDataEvent>(_updateLocalData);
    on<SelectIdFrontCameraCapture>(_selectIdFrontCameraCapture);
    on<SelectIdFrontGalleryCapture>(_selectIdFrontGalleryCapture);
    on<SelectIdBackCameraCapture>(_selectIdBackCameraCapture);
    on<SelectIdBackGalleryCapture>(_selectIdBackGalleryCapture);
    on<SelectAddFrontCameraCapture>(_selectAddFrontCameraCapture);
    on<SelectAddFrontGalleryCapture>(_selectAddFrontGalleryCapture);
    on<SelectAddBackCameraCapture>(_selectAddBackCameraCapture);
    on<SelectAddBackGalleryCapture>(_selectAddBackGalleryCapture);
    on<SelectNocDocCameraCapture>(_selectNocDocCameraCapture);
    on<SelectNocDocBackGalleryCapture>(_selectNocDocBackGalleryCapture);
    on<SelectCustomerCameraCapture>(_selectCustomerCameraCapture);
    on<SelectCustomerGalleryCapture>(_selectCustomerGalleryCapture);
    on<SelectHouseCameraCapture>(_selectHouseCameraCapture);
    on<SelectHouseGalleryCapture>(_selectHouseGalleryCapture);
    on<SelectChqCameraCapture>(_selectChqCameraCapture);
    on<SelectChqGalleryCapture>(_selectChqGalleryCapture);
  }
  bool _isUpdate = false;
  bool get isUpdate => _isUpdate;

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isPreviewLoader = false;
  bool get isPreviewLoader => _isPreviewLoader;

  bool _isSaveLoader = false;
  bool get isSaveLoader => _isSaveLoader;


  GetChargeAreaListModel? chargeAreaValue;
  GetAllAreaModel? areaValue;
  GetPropertyCategoryModel? propertyCategoryValue;
  GetPropertyClassModel? propertyClassValue;
  GetAllDistrictModel? allDistrictValue;
  GetAllDepositOfflineModel? depositTypeValue;
  GetNotInterestedModel? interestValue;
  GetAcceptConversionPolicyModel? conversionPolicyValue;
  GetAcceptExtraFittingCostModel? extraFittingValue;
  GetSocietyAllowModel? societyAllowValue;
  GetGuardianTypeModel? guardianTypeValue;
  GetResidentStatusModel? residentStatusValue;
  GetExistingCookingFuelModel? existingCookingFuelValue;
  GetIdentityProofModel? kycDoc1Value;
  GetOwnershipProofModel? kycDoc2Value;
  GetKycDocModel? kycDoc3Value;
  GetEBillingModel? preferredBillValue;
  GetLabelModel? custBankNameValue;
  GetLabelModel? paymentBankNameValue;
  GetInitialDepositStatusModel? initialDepositStatusValue;
  GetModeOfDepositModel? modeDepositValue;

  GetLabelModel getLabelModel = GetLabelModel();
  GetNotInterestedModel getNotInterestedModel = GetNotInterestedModel();
  GetInitialDepositStatusModel getInitialDepositStatusModel = GetInitialDepositStatusModel();
  GetAcceptExtraFittingCostModel getAcceptExtraFittingCostModel = GetAcceptExtraFittingCostModel();
  GetAcceptConversionPolicyModel getAcceptConversionPolicyModel = GetAcceptConversionPolicyModel();
  GetResidentStatusModel getResidentStatusModel = GetResidentStatusModel();
  GetModeOfDepositModel getModeOfDepositModel = GetModeOfDepositModel();
  GetEBillingModel getEBillingModel = GetEBillingModel();
  GetAllDepositOfflineModel getAllDepositOfflineModel = GetAllDepositOfflineModel();
  GetKycDocModel getKycDocModel = GetKycDocModel();
  GetOwnershipProofModel getOwnershipProofModel = GetOwnershipProofModel();
  GetIdentityProofModel getIdentityProofModel = GetIdentityProofModel();
  GetGuardianTypeModel getGuardianTypeModel = GetGuardianTypeModel();
  GetExistingCookingFuelModel getExistingCookingFuelModel = GetExistingCookingFuelModel();
  GetSocietyAllowModel getSocietyAllowModel = GetSocietyAllowModel();

  List<GetLabelModel> listOfAllLabel = [];
  List<GetNotInterestedModel> listOfNotInterested = [];
  List<GetInitialDepositStatusModel> listOfInitialDepositStatus = [];
  List<GetAcceptExtraFittingCostModel> listOfExtraFittingCost = [];
  List<GetAcceptConversionPolicyModel> listOfConversionPolicy = [];
  List<GetAllDistrictModel> listOfAllDistrict = [];
  List<GetResidentStatusModel> listOfResidentStatus = [];
  List<GetModeOfDepositModel> listOfModeOfDeposit = [];
  List<GetEBillingModel> listOfEBilling = [];
  List<GetKycDocModel> listOfKycDoc = [];
  List<GetOwnershipProofModel> listOfOwnershipProof = [];
  List<GetIdentityProofModel> listOfIdentityProof = [];
  List<GetGuardianTypeModel> listOfGuardianType = [];
  List<GetExistingCookingFuelModel> listOfCookingFuel = [];
  List<GetSocietyAllowModel> listOfSocietyAllow = [];
  List<GetPropertyClassModel> listOfProClass = [];
  List<GetPropertyCategoryModel> listOfProCategory = [];
  List<GetAllAreaModel> listOfAllArea = [];
  List<GetChargeAreaListModel> listOfChargeArea = [];
  List<GetAllDepositOfflineModel> listOfDepositOffline = [];
  List listOfCustBankName = [];
  List listOfChqBankName = [];

  CustRegSync _saveCusRegData = CustRegSync();
  CustRegSync get saveCusRegData => _saveCusRegData;

  File customerConsent = File("");
  File canceledCheque = File("");
  File idFrontPath = File("");
  File idBackPath = File("");
  File addFrontPath = File("");
  File addBackPath = File("");
  File nocDocPath = File("");
  File nocFrontPath = File("");
  File nocBackPath = File("");
  File uploadCustomerPath = File("");
  File uploadHousePath = File("");
  File ownerConsentPath = File("");
  File customerConsentPath = File("");
  File cancelChequePath = File("");
  File chequePath = File("");



  TextEditingController reasonRegistrationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController altMobileController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController middleController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController buildingNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController colonyController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController numberKitchenController = TextEditingController(text: "1");
  TextEditingController numberBathroomController = TextEditingController(text: "1");
  TextEditingController familyMemberController = TextEditingController(text: "4");
  TextEditingController nearestLandmarkController = TextEditingController();
  TextEditingController kyc1NumberController = TextEditingController();
  TextEditingController kyc2NumberController = TextEditingController();
  TextEditingController kyc3NumberController = TextEditingController();
  TextEditingController custBankAccNumberController = TextEditingController();
  TextEditingController custIfscCodeController = TextEditingController();
  TextEditingController custBankAddController = TextEditingController();
  TextEditingController reasonDepositStsController = TextEditingController();
  TextEditingController depositAmountController = TextEditingController();
  TextEditingController chequeNoController = TextEditingController();
  TextEditingController chequeDateController = TextEditingController();
  TextEditingController chequeAccountNoController = TextEditingController();
  TextEditingController chequeMicrNoController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();





  _pageLoad(CustomRegistrationFormPageLoadEvent event, emit) async {
    emit(CustomRegistrationFormPageLoadState());
    await SharedPreferences.getInstance();
    _isPageLoader = false;
    _isUpdate = false;
    listOfAllLabel = [];
    listOfNotInterested = [];
    listOfInitialDepositStatus = [];
    listOfExtraFittingCost = [];
    listOfConversionPolicy = [];
    listOfAllDistrict = [];
    listOfResidentStatus = [];
    listOfModeOfDeposit = [];
    listOfEBilling = [];
    listOfKycDoc = [];
    listOfOwnershipProof = [];
    listOfIdentityProof = [];
    listOfGuardianType = [];
    listOfCookingFuel = [];
    listOfSocietyAllow = [];
    listOfProClass = [];
    listOfProCategory = [];
    listOfAllArea = [];
    listOfChargeArea = [];
    listOfDepositOffline = [];
    listOfCustBankName = [];
    listOfChqBankName = [];
    getLabelModel = GetLabelModel();
    getNotInterestedModel = GetNotInterestedModel();
    idBackPath = File("");
    idFrontPath =  File("");
    addBackPath =  File("");
    addFrontPath =  File("");
    nocDocPath =  File("");
    nocFrontPath =  File("");
    nocBackPath =  File("");
    uploadCustomerPath =  File("");
    uploadHousePath =  File("");
    ownerConsentPath =  File("");
    customerConsentPath =  File("");
    cancelChequePath =  File("");
    chequePath = File("");
    canceledCheque = File("");
    customerConsent = File("");
    await fetchBackNameListApi(context: event.context);
    await _setLocation();
    listOfAllLabel = HiveDataBase.allLabelBox!.values.toSet().toList();
    listOfNotInterested =HiveDataBase.notInterestedBox!.values.toSet().toList();
    listOfInitialDepositStatus =HiveDataBase.initDepositStatusBox!.values.toSet().toList();
    listOfExtraFittingCost =HiveDataBase.acceptExtraFittingCostBox!.values.toSet().toList();
    listOfConversionPolicy =HiveDataBase.acceptConversionPolicyBox!.values.toSet().toList();
    listOfAllDistrict =HiveDataBase.allDistrictBox!.values.toSet().toList();
    listOfResidentStatus =HiveDataBase.resStatusBox!.values.toSet().toList();
    listOfModeOfDeposit =HiveDataBase.modeOfDepositBox!.values.toSet().toList();
    listOfEBilling =HiveDataBase.eBillingBox!.values.toSet().toList();
    listOfKycDoc =HiveDataBase.kycDocBox!.values.toSet().toList();
    listOfOwnershipProof =HiveDataBase.ownershipProofBox!.values.toSet().toList();
    listOfIdentityProof =HiveDataBase.idProofBox!.values.toSet().toList();
    listOfGuardianType =HiveDataBase.guardianTypeBox!.values.toSet().toList();
    listOfCookingFuel =HiveDataBase.cookingFuelBox!.values.toSet().toList();
    listOfSocietyAllow =HiveDataBase.societyAllowBox!.values.toSet().toList();
    listOfProClass =HiveDataBase.proClassBox!.values.toSet().toList();
    listOfProCategory =HiveDataBase.proCateBox!.values.toSet().toList();
    listOfAllArea =HiveDataBase.allAreaBox!.values.toSet().toList();
    listOfChargeArea =HiveDataBase.chargeAreaListBox!.values.toSet().toList();
    listOfDepositOffline =HiveDataBase.allDepositOfflineBox!.values.toSet().toList();
    listOfCustBankName =HiveDataBase.allLabelBox!.values.toSet().toList();
    listOfChqBankName =HiveDataBase.allLabelBox!.values.toSet().toList();
    interestValue = listOfNotInterested.first;
    conversionPolicyValue = listOfConversionPolicy.first;
    extraFittingValue = listOfExtraFittingCost.first;
    societyAllowValue = listOfSocietyAllow.first;
    guardianTypeValue = listOfGuardianType.first;
    propertyCategoryValue = listOfProCategory.first;
    propertyClassValue = listOfProClass.first;
    existingCookingFuelValue = listOfCookingFuel.first;
    kycDoc1Value = listOfIdentityProof.first;
    kycDoc2Value = listOfOwnershipProof.first;
    kycDoc3Value = listOfKycDoc.first;
    preferredBillValue = listOfEBilling.first;
    initialDepositStatusValue = listOfInitialDepositStatus.first;
    _eventCompleted(emit);
  }

  _setInterestValue(CustomRegistrationFormSetInterestValue event, emit) {
    interestValue = event.interestValue;
    _eventCompleted(emit);
  }

  _setConversionPolicyValue(CustomRegistrationFormSetConversionPolicyValue event, emit) {
    conversionPolicyValue = event.conversionPolicyValue;
    _eventCompleted(emit);
  }

  _setExtraFittingValue(CustomRegistrationFormSetExtraFittingValue event, emit) {
    extraFittingValue = event.extraFittingValue;
    _eventCompleted(emit);
  }

  _setSocietyAllowValue(CustomRegistrationFormSetSocietyAllowValue event, emit) {
    societyAllowValue = event.societyAllowValue;
    _eventCompleted(emit);
  }

  _setChargeAreaValue(CustomRegistrationFormSetChargeAreaValue event, emit) {
    chargeAreaValue = event.chargeAreaValue;
    _eventCompleted(emit);
  }

  _setAreaValue(CustomRegistrationFormSetAreaValue event, emit) {
    areaValue = event.areaValue;
    _eventCompleted(emit);
  }

  _setGuardianTypeValue(CustomRegistrationFormSetGuardianTypeValue event, emit) {
    guardianTypeValue = event.guardianTypeValue;
    _eventCompleted(emit);
  }

  _setPropertyCategoryValue(CustomRegistrationFormSetPropertyCategoryValue event, emit) {
    propertyCategoryValue = event.propertyCategoryValue;
    _eventCompleted(emit);
  }

  _setPropertyClassValue(CustomRegistrationFormSetPropertyClassValue event, emit) {
    propertyClassValue = event.propertyClassValue;
    _eventCompleted(emit);
  }

  _setDistrictValue(CustomRegistrationFormSetDistrictValue event, emit) {
    allDistrictValue = event.allDistrictValue;
    _eventCompleted(emit);
  }

  _setResidentStatusValue(CustomRegistrationFormSetResidentStatusValue event, emit) {
    residentStatusValue = event.residentStatusValue;
    _eventCompleted(emit);
  }

  _setExistingCookingFuelValue(CustomRegistrationFormSetExistingCookingFuelValue event, emit) {
    existingCookingFuelValue = event.existingCookingFuelValue;
    _eventCompleted(emit);
  }

  _setKycDoc1Value(CustomRegistrationFormSetKycDoc1Value event, emit) {
    kycDoc1Value = event.kycDoc1Value;
    _eventCompleted(emit);
  }

  _setKycDoc2Value(CustomRegistrationFormSetKycDoc2Value event, emit) {
    kycDoc2Value = event.kycDoc2Value;
    _eventCompleted(emit);
  }

  _setKycDoc3Value(CustomRegistrationFormSetKycDoc3Value event, emit) {
    kycDoc3Value = event.kycDoc3Value;
    _eventCompleted(emit);
  }

  _setPreferredBillValue(CustomRegistrationFormSetPreferredBillValue event, emit) {
    preferredBillValue = event.preferredBillValue;
    _eventCompleted(emit);
  }

  _setCustBankNameValue(CustomRegistrationFormSetCustBankNameValue event, emit) {
    custBankNameValue = event.custBankNameValue;
    _eventCompleted(emit);
  }

  _setPaymentBankNameValue(CustomRegistrationFormSetPaymentBankNameValue event, emit) {
    paymentBankNameValue = event.paymentBankNameValue;
    _eventCompleted(emit);
  }

  _setInitialDepositStatusValue(CustomRegistrationFormSetInitialDepositStatusValue event, emit) {
    initialDepositStatusValue = event.initialDepositStatusValue;
    _eventCompleted(emit);
  }

  _setDepositTypeValue(CustomRegistrationFormSetDepositTypeValue event, emit) {
    depositTypeValue = event.depositTypeValue;
    depositAmountController.clear();
    depositAmountController.text = depositTypeValue!.depositAmount.toString();
    _eventCompleted(emit);
  }

  _setModeDepositValue(CustomRegistrationFormSetModeDepositValue event, emit) {
    modeDepositValue = event.modeDepositValue;
    _eventCompleted(emit);
  }

  _selectIdFrontCameraCapture(SelectIdFrontCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      idFrontPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectIdFrontGalleryCapture(SelectIdFrontGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      idFrontPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectIdBackCameraCapture(SelectIdBackCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      idBackPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectIdBackGalleryCapture(SelectIdBackGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      idBackPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectAddFrontCameraCapture(SelectAddFrontCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      addFrontPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectAddFrontGalleryCapture(SelectAddFrontGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      addFrontPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectAddBackCameraCapture(SelectAddBackCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      addBackPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectAddBackGalleryCapture(SelectAddBackGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      addBackPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectNocDocCameraCapture(SelectNocDocCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      nocDocPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectNocDocBackGalleryCapture(SelectNocDocBackGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      nocDocPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectCustomerCameraCapture(SelectCustomerCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      uploadCustomerPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectCustomerGalleryCapture(SelectCustomerGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      uploadCustomerPath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectHouseCameraCapture(SelectHouseCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      uploadHousePath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectHouseGalleryCapture(SelectHouseGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      uploadHousePath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectChqCameraCapture(SelectChqCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      chequePath  = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectChqGalleryCapture(SelectChqGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if(photoPath != null){
      chequePath  = photoPath;
    }
    _eventCompleted(emit);
  }

  fetchBackNameListApi({required BuildContext context}) async {
    var bankNameListRes = await DashboardHelper.getBankNameListApi(context: context);
    if (bankNameListRes != null) {
      listOfCustBankName.clear();
      listOfChqBankName.clear();
      listOfCustBankName = bankNameListRes;
      listOfChqBankName = bankNameListRes;
    }
  }

  _btnLocation(CustomRegistrationFormSetLocation event, emit){
    _setLocation();
    _eventCompleted(emit);
  }

  _setLocation() async {
    var getLocation = await DashboardHelper.getCurrentLocation();
    latController = TextEditingController(text: getLocation?.latitude.toString());
    longController = TextEditingController(text: getLocation?.longitude.toString());
    return getLocation;
  }

  _setChequeDate(CustomRegistrationFormSetChequeDateEvent event, emit) async {
    DateTime? dateTime = await showDatePicker(context: event.context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());
    if (dateTime != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      chequeDateController.text = formattedDate.toString();
      _eventCompleted(emit);
    }
  }

  _previewPage(CustomRegistrationFormPreviewPageEvent event, emit) async {
    var textFiledValidationCheck = await CustomRegistrationFormHelper.textFieldValidationCheck(
      context: event.context,
      registrationType: interestValue?.value ?? "",
      reasonRegistration: reasonRegistrationController.text.toString(),
      chargeId: chargeAreaValue!.chargeAreaName.toString(),
      areaId: areaValue!.areaName,
      mobileNumber: mobileController.text.trim().toString(),
      altMobileNo: altMobileController.text.trim().toString(),
      firstName: firstController.text.trim().toString(),
      middleName: middleController.text.trim().toString(),
      lastName: lastController.text.trim().toString(),
      guardianType: guardianTypeValue?.value ?? "",
      guardianName: guardianNameController.text.trim().toString(),
      emailId: emailIdController.text.trim().toString(),
      propertyCategoryId: propertyCategoryValue!.id,
      propertyClassId: propertyClassValue!.id,
      buildingNumber: buildingNumberController.text.trim().toString(),
      houseNumber: houseNumberController.text.trim().toString(),
      colonySocietyApartment: colonyController.text.trim().toString(),
      streetName: streetController.text.trim().toString(),
      town: townController.text.trim().toString(),
      districtId: allDistrictValue!.id,
      pinCode: pinCodeController.text.toString(),
      noOfKitchen: numberKitchenController.text.toString(),
      noOfBathroom: numberBathroomController.text.toString(),
      existingCookingFuel: existingCookingFuelValue!.value?? "",
      noOfFamilyMembers: familyMemberController.text.trim().toString(),
      latitude: latController.text.trim().toString(),
      longitude: longController.text.trim().toString(),
      nearestLandmark: nearestLandmarkController.text.trim().toString(),
      idProof: kycDoc1Value!.value,
      idProofNo: kyc1NumberController.text.trim().toString(),
      idFrontPath: idFrontPath.path,
      idBackPath: idBackPath.path.toString(),
      addProof: kycDoc2Value!.value,
      addProofNo: kyc2NumberController.text.trim().toString(),
      addFrontPath: addFrontPath.path.toString(),
      addBackPath: addBackPath.path.toString(),
      ownershipProperty: kycDoc3Value!.value,
      ownerConsent: ownerConsentPath.path.toString(),
      housePath: uploadHousePath.path.toString(),
      customerPath: uploadCustomerPath.path.toString(),
      nocDocPath: nocDocPath.path.toString(),
      acceptConversionPolicy: conversionPolicyValue.toString(),
      acceptExtraFittingCost: extraFittingValue!.value,
      societyAllowedMdpe: societyAllowValue!.value,
      depositStatus: initialDepositStatusValue!.value,
      reasonDeposit: reasonDepositStsController.text.trim().toString(),
      depositType: depositTypeValue.toString(),
      depositAmt: depositAmountController.text.trim().toString(),
      modeDeposit: modeDepositValue.toString(),
      chqNo: chequeNoController.text.trim().toString(),
      chqDate: chequeDateController.text.trim().toString(),
      chqBank: paymentBankNameValue.toString(),
      chequeAccountNo: chequeAccountNoController.text.trim().toString(),
      chequeMICRNo: chequeMicrNoController.text.trim().toString(),
      chequePath: chequePath.path.toString(),
      canceledCheque: canceledCheque.path.toString(),
      bankAccountNumber: custBankAccNumberController.text.trim().toString(),
      bankAddress: custBankAddController.text.trim().toString(),
      bankIfscCode: custIfscCodeController.text.trim().toString(),
      bankNameOfBank:custBankAccNumberController.text.trim().toString(),
      customerConsent: customerConsent.path.trim(),
      eBillingModel:preferredBillValue!.value,
      residentStatus: residentStatusValue!.value,
    );
    _isPreviewLoader = true;
    _eventCompleted(emit);
    if (textFiledValidationCheck != null) {
      _isPreviewLoader = false;
      _eventCompleted(emit);
      _saveCusRegData = textFiledValidationCheck;
      log("_saveCusRegData==>${_saveCusRegData.toJson()}");
      return showDialog<void>(
        context: event.context,
        builder: (BuildContext context) {
          return CustomerRegistrationFormPreviewPopWidget(cusRegData: saveCusRegData);
        },
      );
    }
  }

  _saveLocalData(CustomRegistrationFormSaveLocalDataEvent event, emit) async {
    _isSaveLoader = true;
    _eventCompleted(emit);
    await CustomRegistrationFormHelper.addCustRegSyncLocalDB(
      context: event.context, custRegSyncStore: saveCusRegData, isUpdate:_isUpdate,
    );
    _isSaveLoader = false;
    _eventCompleted(emit);
  }

  _updateLocalData(CustomRegistrationFormLoadUpdateLocalDataEvent event, emit) async {
  }

  _eventCompleted(Emitter<CustomRegistrationFormState> emit) {
    emit(CustomRegistrationFormGetAllDataState(
      isPageLoader : isPageLoader,
      isUpdate : isUpdate,
      labelModel: getLabelModel,
      interestValue: interestValue,
      getNotInterestedList: listOfNotInterested,
      conversionPolicyValue: conversionPolicyValue,
      conversionPolicyList: listOfConversionPolicy,
      extraFittingValue: extraFittingValue,
      extraFittingCostList: listOfExtraFittingCost,
      societyAllowValue: societyAllowValue,
      societyAllowList: listOfSocietyAllow,
      getNotInterestedModel: getNotInterestedModel,
      getAcceptConversionPolicyModel: getAcceptConversionPolicyModel,
      getAcceptExtraFittingCostModel: getAcceptExtraFittingCostModel,
      getSocietyAllowModel: getSocietyAllowModel,
      chargeAreaValue: chargeAreaValue,
      getChargeAreaListModel: listOfChargeArea,
      areaValue: areaValue,
      getAllAreaModel: listOfAllArea,
      guardianTypeValue: guardianTypeValue,
      getGuardianTypeList: listOfGuardianType,
      propertyCategoryValue: propertyCategoryValue,
      propertyClassValue: propertyClassValue,
      identityProofValue: kycDoc1Value,
      identityProofList: listOfIdentityProof,
      getIdentityProofModel: getIdentityProofModel,
      ownershipProofValue: kycDoc2Value,
      ownershipProofList: listOfOwnershipProof,
      getOwnershipProofModel: getOwnershipProofModel,
      kycDoc3Value: kycDoc3Value,
      kycDocList: listOfKycDoc,
      getKycDocModel: getKycDocModel,
      getGuardianTypeModel: getGuardianTypeModel,
      existingCookingFuelValue: existingCookingFuelValue,
      existingCookingFuelList: listOfCookingFuel,
      getExistingCookingFuelModel: getExistingCookingFuelModel,
      residentStatusValue: residentStatusValue,
      getResidentStatusList: listOfResidentStatus,
      getResidentStatusModel: getResidentStatusModel,
      getPropertyClassModel: listOfProClass,
      getPropertyCategoryModel: listOfProCategory,
      eBillingValue: preferredBillValue,
      eBillingList: listOfEBilling,
      getEBillingModel: getEBillingModel,
      initialDepositStatusValue: initialDepositStatusValue,
      initialDepositStatusList: listOfInitialDepositStatus,
      depositOfflineValue: depositTypeValue,
      getAllDepositOfflineModel: getAllDepositOfflineModel,
      getAllDepositOfflineList: listOfDepositOffline,
      modeDepositValue: modeDepositValue,
      modeDepositList: listOfModeOfDeposit,
      getInitialDepositStatusModel: getInitialDepositStatusModel,
      getModeOfDepositModel: getModeOfDepositModel,
      reasonRegistrationController: reasonRegistrationController,
      mobileController: mobileController,
      altMobileController: altMobileController,
      firstController: firstController,
      middleController: middleController,
      lastController: lastController,
      guardianNameController: guardianNameController,
      emailIdController: emailIdController,
      buildingNumberController: buildingNumberController,
      houseNumberController: houseNumberController,
      colonyController: colonyController,
      streetController: streetController,
      townController: townController,
      pinCodeController: pinCodeController,
      numberKitchenController: numberKitchenController,
      numberBathroomController: numberBathroomController,
      familyMemberController: familyMemberController,
      nearestLandmarkController: nearestLandmarkController,
      kyc1NumberController: kyc1NumberController,
      kyc2NumberController: kyc2NumberController,
      kyc3NumberController: kyc3NumberController,
      custBankAccNumberController: custBankAccNumberController,
      custIfscCodeController: custIfscCodeController,
      custBankAddController: custBankAddController,
      reasonDepositStsController: reasonDepositStsController,
      depositAmountController: depositAmountController,
      allDistrictValue: allDistrictValue,
      getAllDistrictModel: listOfAllDistrict,
      latitudeController: latController,
      longitudeController: longController,
      chequeNoController: chequeNoController,
      chequeDateController: chequeDateController,
      chequeAccountNoController: chequeAccountNoController,
      chequeMicrNoController: chequeMicrNoController,
      custBankNameValue: custBankNameValue,
      paymentBankNameValue: paymentBankNameValue,
      custBankNameList: listOfCustBankName,
      paymentBankNameList: listOfChqBankName,
      idBackFilePath: idBackPath,
      idFrontFilePath: idFrontPath,
      eleBillFrontPath: addFrontPath,
      eleBillBackPath: addBackPath,
      nocDocPath: nocDocPath,
      nocFrontPath: nocFrontPath,
      nocBackPath: nocBackPath,
      uploadCustomerPath: uploadCustomerPath,
      uploadHousePath: uploadHousePath,
      customerConsentPath: customerConsentPath,
      ownerConsentPath: ownerConsentPath,
      cancelChequePath: cancelChequePath,
      chequePath: chequePath,
      isPreviewLoader: isPreviewLoader,
      isSaveLoader: isSaveLoader,
    ));
  }
}
