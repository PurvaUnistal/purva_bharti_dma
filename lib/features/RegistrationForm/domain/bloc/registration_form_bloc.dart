import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/message_box_one_button_pop.dart';

class RegistrationFormBloc extends Bloc<RegistrationFormEvent, RegistrationFormState> {
  RegistrationFormBloc() : super(RegistrationFormInitialState()) {
    on<RegistrationFormPageLoadEvent>(_pageLoad);
    on<RegistrationFormSetInterestValue>(_setInterestValue);
    on<RegistrationFormSetConversionPolicyValue>(_setConversionPolicyValue);
    on<RegistrationFormSetExtraFittingValue>(_setExtraFittingValue);
    on<RegistrationFormSetSocietyAllowValue>(_setSocietyAllowValue);
    on<RegistrationFormSetChargeAreaValue>(_setChargeAreaValue);
    on<RegistrationFormSetAreaValue>(_setAreaValue);
    on<RegistrationFormSetGuardianTypeValue>(_setGuardianTypeValue);
    on<RegistrationFormSetPropertyCategoryValue>(_setPropertyCategoryValue);
    on<RegistrationFormSetPropertyClassValue>(_setPropertyClassValue);
    on<RegistrationFormSetDistrictValue>(_setDistrictValue);
    on<RegistrationFormSetLocation>(_btnLocation);
    on<RegistrationFormSetResidentStatusValue>(_setResidentStatusValue);
    on<RegistrationFormSetExistingCookingFuelValue>(_setExistingCookingFuelValue);
    on<RegistrationFormSetKycDoc1Value>(_setKycDoc1Value);
    on<RegistrationFormSetKycDoc2Value>(_setKycDoc2Value);
    on<RegistrationFormSetKycDoc3Value>(_setKycDoc3Value);
    on<RegistrationFormSetPreferredBillValue>(_setPreferredBillValue);
    on<RegistrationFormSetCustBankNameValue>(_setCustBankNameValue);
    on<RegistrationFormSetPaymentBankNameValue>(_setPaymentBankNameValue);
    on<RegistrationFormSetInitialDepositStatusValue>(_setInitialDepositStatusValue);
    on<RegistrationFormSetDepositTypeValue>(_setDepositTypeValue);
    on<RegistrationFormSetModeDepositValue>(_setModeDepositValue);
    on<RegistrationFormSetChequeDateEvent>(_setChequeDate);
    on<RegistrationFormPreviewPageEvent>(_previewPage);
    on<RegistrationFormSaveLocalDataEvent>(_saveLocalData);
    on<RegistrationFormLoadUpdateLocalDataEvent>(_updateLocalData);
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
    on<SchemeTypeDetailEvent>(_selectSchemeTypeDetail);
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

  CustRegSync saveCusRegData = CustRegSync();

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


  String schemeMonth = "";
  String equipmentAmt = "";
  String gasAmt = "";
  String firstDeposit = "";

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

  _pageLoad(RegistrationFormPageLoadEvent event, emit) async {
    emit(RegistrationFormPageLoadState());
    _isPageLoader = false;
    _isUpdate = false;
     schemeMonth = "";
     equipmentAmt = "";
     gasAmt = "";
     firstDeposit = "";
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
    listOfKycDoc = HiveDataBase.kycDocBox!.values.toSet().toList();
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

  _setInterestValue(RegistrationFormSetInterestValue event, emit) {
    interestValue = event.interestValue;
    _eventCompleted(emit);
  }

  _setConversionPolicyValue(RegistrationFormSetConversionPolicyValue event, emit) {
    conversionPolicyValue = event.conversionPolicyValue;
    _eventCompleted(emit);
  }

  _setExtraFittingValue(RegistrationFormSetExtraFittingValue event, emit) {
    extraFittingValue = event.extraFittingValue;
    _eventCompleted(emit);
  }

  _setSocietyAllowValue(RegistrationFormSetSocietyAllowValue event, emit) {
    societyAllowValue = event.societyAllowValue;
    _eventCompleted(emit);
  }

  _setChargeAreaValue(RegistrationFormSetChargeAreaValue event, emit) {
    chargeAreaValue = event.chargeAreaValue;
    _eventCompleted(emit);
  }

  _setAreaValue(RegistrationFormSetAreaValue event, emit) {
    areaValue = event.areaValue;
    _eventCompleted(emit);
  }

  _setGuardianTypeValue(RegistrationFormSetGuardianTypeValue event, emit) {
    guardianTypeValue = event.guardianTypeValue;
    _eventCompleted(emit);
  }

  _setPropertyCategoryValue(RegistrationFormSetPropertyCategoryValue event, emit) {
    propertyCategoryValue = event.propertyCategoryValue;
    _eventCompleted(emit);
  }

  _setPropertyClassValue(RegistrationFormSetPropertyClassValue event, emit) {
    propertyClassValue = event.propertyClassValue;
    _eventCompleted(emit);
  }

  _setDistrictValue(RegistrationFormSetDistrictValue event, emit) {
    allDistrictValue = event.allDistrictValue;
    _eventCompleted(emit);
  }

  _setResidentStatusValue(RegistrationFormSetResidentStatusValue event, emit) {
    residentStatusValue = event.residentStatusValue;
    _eventCompleted(emit);
  }

  _setExistingCookingFuelValue(RegistrationFormSetExistingCookingFuelValue event, emit) {
    existingCookingFuelValue = event.existingCookingFuelValue;
    _eventCompleted(emit);
  }

  _setKycDoc1Value(RegistrationFormSetKycDoc1Value event, emit) {
    kycDoc1Value = event.kycDoc1Value;
    _eventCompleted(emit);
  }

  _setKycDoc2Value(RegistrationFormSetKycDoc2Value event, emit) {
    kycDoc2Value = event.kycDoc2Value;
    _eventCompleted(emit);
  }

  _setKycDoc3Value(RegistrationFormSetKycDoc3Value event, emit) {
    kycDoc3Value = event.kycDoc3Value;
    _eventCompleted(emit);
  }

  _setPreferredBillValue(RegistrationFormSetPreferredBillValue event, emit) {
    preferredBillValue = event.preferredBillValue;
    _eventCompleted(emit);
  }

  _setCustBankNameValue(RegistrationFormSetCustBankNameValue event, emit) {
    custBankNameValue = event.custBankNameValue;
    _eventCompleted(emit);
  }

  _setPaymentBankNameValue(RegistrationFormSetPaymentBankNameValue event, emit) {
    paymentBankNameValue = event.paymentBankNameValue;
    _eventCompleted(emit);
  }

  _setInitialDepositStatusValue(RegistrationFormSetInitialDepositStatusValue event, emit) {
    initialDepositStatusValue = event.initialDepositStatusValue;
    _eventCompleted(emit);
  }

  _setDepositTypeValue(RegistrationFormSetDepositTypeValue event, emit) {
    depositTypeValue = event.depositTypeValue;
    schemeMonth = "";
    equipmentAmt = "";
    gasAmt = "";
    firstDeposit = "";
    depositAmountController.clear();
    if(depositTypeValue != null){
      depositAmountController.text = depositTypeValue!.firstDepositAmountWith.toString();
      schemeMonth = depositTypeValue!.schemeMonth.toString();
      equipmentAmt = depositTypeValue!.equipmentDepositAmount .toString();
      gasAmt = depositTypeValue!.gasDepositAmount.toString();
      firstDeposit = depositTypeValue!.firstDepositAmountWith.toString();
    }
    _eventCompleted(emit);
  }

  _setModeDepositValue(RegistrationFormSetModeDepositValue event, emit) {
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

  _btnLocation(RegistrationFormSetLocation event, emit){
    _setLocation();
    _eventCompleted(emit);
  }

  _setLocation() async {
    var getLocation = await DashboardHelper.getCurrentLocation();
    latController = TextEditingController(text: getLocation?.latitude.toString());
    longController = TextEditingController(text: getLocation?.longitude.toString());
    return getLocation;
  }

  _setChequeDate(RegistrationFormSetChequeDateEvent event, emit) async {
    DateTime? dateTime = await showDatePicker(context: event.context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());
    if (dateTime != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      chequeDateController.text = formattedDate.toString();
      _eventCompleted(emit);
    }
  }

  _selectSchemeTypeDetail(SchemeTypeDetailEvent event, emit) {
    if(depositTypeValue == null){
    return  Utils.errorSnackBar(msg: " This scheme type id is requirement", context: event.context);
    } else if(depositTypeValue != null){
     return showDialog(
          context: event.context,
          builder: (BuildContext context) => MessageBoxOneButtonPopWidget(
            child: Column(
              children: [
                RowWidget(
                  lText: "Deposit Name",
                  rText: depositTypeValue!.depositName.toString(),
                ),
                RowWidget(
                  lText: "Deposit Amount",
                  rText: depositAmountController.text.trim().toString(),
                ),
                RowWidget(
                  lText: "Scheme Month",
                  rText: schemeMonth,
                ),
                RowWidget(
                  lText: "Equipment Deposit Amount",
                  rText: equipmentAmt,
                ),
                RowWidget(
                  lText: "GAS Amount",
                  rText: gasAmt,
                ),
                RowWidget(
                  lText: "First Deposit Amount",
                  rText: firstDeposit,
                ),
              ],
            ),
          ));
    }

  }

  _previewPage(RegistrationFormPreviewPageEvent event, emit) async {
  //  try{
      var textFiledValidationCheck = await RegistrationFormHelper.textFieldValidationCheck(
        context: event.context,
        registrationType: interestValue?.value ?? "",
        reasonRegistration: reasonRegistrationController.text.toString(),
        chargeId: chargeAreaValue == null ? "": chargeAreaValue!.chargeAreaName,
        areaId: areaValue== null ? "": areaValue!.areaName!.toString(),
        mobileNumber: mobileController.text.trim().toString(),
        altMobileNo: altMobileController.text.trim().toString(),
        firstName: firstController.text.trim().toString(),
        middleName: middleController.text.trim().toString(),
        lastName: lastController.text.trim().toString(),
        guardianType: guardianTypeValue == null ? "" : guardianTypeValue!.value,
        guardianName: guardianNameController.text.trim().toString(),
        emailId: emailIdController.text.trim().toString(),
        propertyCategoryId: propertyCategoryValue == null ? "" : propertyCategoryValue!.id,
        propertyClassId: propertyClassValue == null ? "" : propertyClassValue!.id,
        buildingNumber: buildingNumberController.text.trim().toString(),
        houseNumber: houseNumberController.text.trim().toString(),
        colonySocietyApartment: colonyController.text.trim().toString(),
        streetName: streetController.text.trim().toString(),
        town: townController.text.trim().toString(),
        districtId: allDistrictValue == null ? "": allDistrictValue!.id,
        pinCode: pinCodeController.text.trim().toString(),
        noOfKitchen: numberKitchenController.text.trim().toString(),
        noOfBathroom: numberBathroomController.text.trim().toString(),
        existingCookingFuel: existingCookingFuelValue == null ? "": existingCookingFuelValue!.value,
        noOfFamilyMembers: familyMemberController.text.trim().toString(),
        latitude: latController.text.trim().toString(),
        longitude: longController.text.trim().toString(),
        nearestLandmark: nearestLandmarkController.text.trim().toString(),
        idProof: kycDoc1Value == null ? "" : kycDoc1Value!.value,
        idProofNo: kyc1NumberController.text.trim().toString(),
        idFrontPath: idFrontPath,
        idBackPath: idBackPath,
        addProof: kycDoc2Value == null ? "": kycDoc2Value!.value,
        addProofNo: kyc2NumberController.text.trim().toString(),
        addFrontPath: addFrontPath,
        addBackPath: addBackPath,
        ownershipProperty:kycDoc3Value == null ? "": kycDoc3Value!.value,
        ownerConsent: ownerConsentPath,
        housePath: uploadHousePath,
        customerPath: uploadCustomerPath,
        nocDocPath: nocDocPath,
        acceptConversionPolicy: conversionPolicyValue == null ? "" : conversionPolicyValue.toString(),
        acceptExtraFittingCost: extraFittingValue == null ? "" : extraFittingValue!.value,
        societyAllowedMdpe: societyAllowValue == null ? "" : societyAllowValue!.value,
        depositStatus: initialDepositStatusValue == null ? "" : initialDepositStatusValue!.value,
        reasonDeposit: reasonDepositStsController.text.trim().toString(),
        depositType: depositTypeValue == null ? "" : depositTypeValue.toString(),
        depositAmt: depositAmountController.text.trim().toString(),
        modeDeposit: modeDepositValue == null ? "" : modeDepositValue.toString(),
        chqNo: chequeNoController.text.trim().toString(),
        chqDate: chequeDateController.text.trim().toString(),
        chqBank: paymentBankNameValue.toString(),
        chequeAccountNo: chequeAccountNoController.text.trim().toString(),
        chequeMICRNo: chequeMicrNoController.text.trim().toString(),
        chequePath: chequePath,
        canceledCheque: canceledCheque,
        bankAccountNumber: custBankAccNumberController.text.trim().toString(),
        bankAddress: custBankAddController.text.trim().toString(),
        bankIfscCode: custIfscCodeController.text.trim().toString(),
        bankNameOfBank:custBankAccNumberController.text.trim().toString(),
        customerConsent: customerConsent,
        eBillingModel: preferredBillValue == null ? "" : preferredBillValue!.value,
        residentStatus: residentStatusValue == null ? "":residentStatusValue!.value,
      );
      _isPreviewLoader = true;
      _eventCompleted(emit);
      if (await textFiledValidationCheck == true) {
        _isPreviewLoader = false;
        _eventCompleted(emit);
        saveCusRegData = textFiledValidationCheck;
        log("saveCusRegData==>${saveCusRegData.toJson()}");
        return showDialog<void>(
          context: event.context,
          builder: (BuildContext context) {
            return CustomerRegistrationFormPreviewPopWidget(cusRegData: saveCusRegData);
          },
        );
      }
 /*   } catch(e){
      log("previewCheck-->${e.toString()}");
      return null;
    }*/
  }

  _saveLocalData(RegistrationFormSaveLocalDataEvent event, emit) async {
    _isSaveLoader = true;
    _eventCompleted(emit);
    await RegistrationFormHelper.addCustRegSyncLocalDB(
      context: event.context, custRegSyncStore: saveCusRegData, isUpdate:_isUpdate,
    );
    _isSaveLoader = false;
    _eventCompleted(emit);
  }

  _updateLocalData(RegistrationFormLoadUpdateLocalDataEvent event, emit) async {
  }

  _eventCompleted(Emitter<RegistrationFormState> emit) {
    emit(RegistrationFormGetAllDataState(
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
