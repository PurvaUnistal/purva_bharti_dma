import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/RegistrationForm/presentation/widgets/DepositOfflinePop.dart';
import 'package:pbg_app/features/RegistrationForm/presentation/widgets/pop_widget.dart';

class RegistrationFormBloc
    extends Bloc<RegistrationFormEvent, RegistrationFormState> {
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
    on<RegistrationFormSetExistingCookingFuelValue>(
        _setExistingCookingFuelValue);
    on<RegistrationFormSetKycDoc1Value>(_setKycDoc1Value);
    on<RegistrationFormSetKycDoc2Value>(_setKycDoc2Value);
    on<RegistrationFormSetKycDoc3Value>(_setKycDoc3Value);
    on<RegistrationFormSetPreferredBillValue>(_setPreferredBillValue);
    on<RegistrationFormSetCustBankNameValue>(_setCustBankNameValue);
    on<RegistrationFormSetPaymentBankNameValue>(_setPaymentBankNameValue);
    on<RegistrationFormSetInitialDepositStatusValue>(
        _setInitialDepositStatusValue);
    on<RegistrationFormSchemeTypeValue>(_setSchemeTypeValue);
    on<RegistrationFormSetModeDepositValue>(_setModeDepositValue);
    on<RegistrationFormSetChequeDateEvent>(_setChequeDate);
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
    on<RegistrationFormPreviewPageEvent>(_previewPage);
    on<RegistrationFormSaveLocalDataEvent>(_saveLocalData);
    on<UpdateLocalDataEvent>(_updateLocalData);
  }

  bool isUpdate = false;
  int index = 0;
  bool isPageLoader = false;
  bool isPreviewLoader = false;
  bool isSaveLoader = false;

  SaveRegistrationFormModel localData = SaveRegistrationFormModel();

  GetChargeAreaListModel chargeAreaValue = GetChargeAreaListModel();
  GetAllAreaModel areaValue = GetAllAreaModel();
  GetPropertyCategoryModel propertyCategoryValue = GetPropertyCategoryModel();
  GetPropertyClassModel propertyClassValue = GetPropertyClassModel();
  GetAllDistrictModel allDistrictValue = GetAllDistrictModel();
  GetAllDepositOfflineModel schemeTypeValue = GetAllDepositOfflineModel();
  GetNotInterestedModel registrationTypeValue = GetNotInterestedModel();
  GetAcceptConversionPolicyModel conversionPolicyValue =
      GetAcceptConversionPolicyModel();
  GetAcceptExtraFittingCostModel extraFittingValue =
      GetAcceptExtraFittingCostModel();
  GetSocietyAllowModel societyAllowValue = GetSocietyAllowModel();
  GetGuardianTypeModel guardianTypeValue = GetGuardianTypeModel();
  GetResidentStatusModel residentStatusValue = GetResidentStatusModel();
  GetExistingCookingFuelModel existingCookingFuelValue =
      GetExistingCookingFuelModel();
  GetIdentityProofModel kycDoc1Value = GetIdentityProofModel();
  GetOwnershipProofModel kycDoc2Value = GetOwnershipProofModel();
  GetKycDocModel kycDoc3Value = GetKycDocModel();
  GetEBillingModel preferredBillValue = GetEBillingModel();
  String custBankNameValue = "";
  String paymentBankNameValue = "";
  GetInitialDepositStatusModel initialDepositStatusValue =
      GetInitialDepositStatusModel();
  GetModeOfDepositModel modeDepositValue = GetModeOfDepositModel();

  GetLabelModel getLabelModel = GetLabelModel();
  GetNotInterestedModel getNotInterestedModel = GetNotInterestedModel();
  GetInitialDepositStatusModel getInitialDepositStatusModel =
      GetInitialDepositStatusModel();
  GetAcceptExtraFittingCostModel getAcceptExtraFittingCostModel =
      GetAcceptExtraFittingCostModel();
  GetAcceptConversionPolicyModel getAcceptConversionPolicyModel =
      GetAcceptConversionPolicyModel();
  GetResidentStatusModel getResidentStatusModel = GetResidentStatusModel();
  GetModeOfDepositModel getModeOfDepositModel = GetModeOfDepositModel();
  GetEBillingModel getEBillingModel = GetEBillingModel();
  GetAllDepositOfflineModel getAllDepositOfflineModel =
      GetAllDepositOfflineModel();
  GetKycDocModel getKycDocModel = GetKycDocModel();
  GetOwnershipProofModel getOwnershipProofModel = GetOwnershipProofModel();
  GetIdentityProofModel getIdentityProofModel = GetIdentityProofModel();
  GetGuardianTypeModel getGuardianTypeModel = GetGuardianTypeModel();
  GetExistingCookingFuelModel getExistingCookingFuelModel =
      GetExistingCookingFuelModel();
  GetSocietyAllowModel getSocietyAllowModel = GetSocietyAllowModel();
  BankNameListModel bankNameListModel = BankNameListModel();

  List<GetLabelModel> listOfAllLabel = [];
  List<GetNotInterestedModel> listOfRegistrationType = [];
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
  List<String> listOfCustBankName = [];
  List<String> paymentBankNameList = [];

  /* SaveRegistrationFormModel saveCusRegData = SaveRegistrationFormModel();*/

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
  TextEditingController numberKitchenController =
      TextEditingController(text: "1");
  TextEditingController numberBathroomController =
      TextEditingController(text: "1");
  TextEditingController familyMemberController =
      TextEditingController(text: "4");
  TextEditingController nearestLandmarkController = TextEditingController();
  TextEditingController kyc1NumberController = TextEditingController();
  TextEditingController kyc2NumberController = TextEditingController();
  TextEditingController kyc3NumberController = TextEditingController();
  TextEditingController custBankAccNumberController = TextEditingController();
  TextEditingController custIfscCodeController = TextEditingController();
  TextEditingController custBankAddController = TextEditingController();
  TextEditingController reasonDepositStsController = TextEditingController();
  TextEditingController schemeAmountController = TextEditingController();
  TextEditingController chequeNoController = TextEditingController();
  TextEditingController chequeDateController = TextEditingController();
  TextEditingController chequeAccountNoController = TextEditingController();
  TextEditingController chequeMicrNoController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();

  _pageLoad(RegistrationFormPageLoadEvent event, emit) async {
    emit(RegistrationFormInitialState());
    _initializeStateVariables();
    _resetControllers();
    _initializeFilePaths();
    await _fetchHiveData();
    _setDependentData();
    await _setLocation();
    _eventCompleted(emit);
  }

// Helper methods

  void _initializeStateVariables() {
    isUpdate = false;
    isPageLoader = false;
    isPreviewLoader = false;
    isSaveLoader = false;

    schemeMonth = "";
    equipmentAmt = "";
    gasAmt = "";
    firstDeposit = "";

    chargeAreaValue = GetChargeAreaListModel();
    areaValue = GetAllAreaModel();
    propertyCategoryValue = GetPropertyCategoryModel();
    propertyClassValue = GetPropertyClassModel();
    allDistrictValue = GetAllDistrictModel();
    schemeTypeValue = GetAllDepositOfflineModel();
    registrationTypeValue = GetNotInterestedModel();
    conversionPolicyValue = GetAcceptConversionPolicyModel();
    extraFittingValue = GetAcceptExtraFittingCostModel();
    societyAllowValue = GetSocietyAllowModel();
    guardianTypeValue = GetGuardianTypeModel();
    residentStatusValue = GetResidentStatusModel();
    existingCookingFuelValue = GetExistingCookingFuelModel();
    kycDoc1Value = GetIdentityProofModel();
    kycDoc2Value = GetOwnershipProofModel();
    kycDoc3Value = GetKycDocModel();
    preferredBillValue = GetEBillingModel();
    custBankNameValue = "";
    paymentBankNameValue = "";
    initialDepositStatusValue = GetInitialDepositStatusModel();
    modeDepositValue = GetModeOfDepositModel();

    listOfAllLabel = [];
    listOfRegistrationType = [];
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
    paymentBankNameList = [];
  }

  void _resetControllers() {
    reasonRegistrationController.text = "";
    mobileController.text = "";
    altMobileController.text = "";
    firstController.text = "";
    middleController.text = "";
    lastController.text = "";
    guardianNameController.text = "";
    emailIdController.text = "";
    buildingNumberController.text = "";
    houseNumberController.text = "";
    colonyController.text = "";
    streetController.text = "";
    townController.text = "";
    pinCodeController.text = "";
    numberKitchenController.text = "1";
    numberBathroomController.text = "1";
    familyMemberController.text = "4";
    nearestLandmarkController.text = "";
    kyc1NumberController.text = "";
    kyc2NumberController.text = "";
    kyc3NumberController.text = "";
    custBankAccNumberController.text = "";
    custIfscCodeController.text = "";
    custBankAddController.text = "";
    reasonDepositStsController.text = "";
    schemeAmountController.text = "";
    chequeNoController.text = "";
    chequeDateController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    chequeAccountNoController.text = "";
    chequeMicrNoController.text = "";
    latController.text = "";
    longController.text = "";
  }

  void _initializeFilePaths() {
    idBackPath = File("");
    idFrontPath = File("");
    addBackPath = File("");
    addFrontPath = File("");
    nocDocPath = File("");
    nocFrontPath = File("");
    nocBackPath = File("");
    uploadCustomerPath = File("");
    uploadHousePath = File("");
    ownerConsentPath = File("");
    customerConsentPath = File("");
    cancelChequePath = File("");
    chequePath = File("");
    canceledCheque = File("");
    customerConsent = File("");
  }

  Future<void> _fetchHiveData() async {
    listOfAllLabel = HiveDataBase.allLabelBox?.values.toSet().toList() ?? [];
    listOfRegistrationType =
        HiveDataBase.notInterestedBox?.values.toSet().toList() ?? [];
    listOfInitialDepositStatus =
        HiveDataBase.initDepositStatusBox?.values.toSet().toList() ?? [];
    listOfExtraFittingCost =
        HiveDataBase.acceptExtraFittingCostBox?.values.toSet().toList() ?? [];
    listOfConversionPolicy =
        HiveDataBase.acceptConversionPolicyBox?.values.toSet().toList() ?? [];
    listOfAllDistrict =
        HiveDataBase.allDistrictBox?.values.toSet().toList() ?? [];
    listOfResidentStatus =
        HiveDataBase.resStatusBox?.values.toSet().toList() ?? [];
    listOfModeOfDeposit =
        HiveDataBase.modeOfDepositBox?.values.toSet().toList() ?? [];
    listOfEBilling = HiveDataBase.eBillingBox?.values.toSet().toList() ?? [];
    listOfKycDoc = HiveDataBase.kycDocBox?.values.toSet().toList() ?? [];
    listOfOwnershipProof =
        HiveDataBase.ownershipProofBox?.values.toSet().toList() ?? [];
    listOfIdentityProof =
        HiveDataBase.idProofBox?.values.toSet().toList() ?? [];
    listOfGuardianType =
        HiveDataBase.guardianTypeBox?.values.toSet().toList() ?? [];
    listOfCookingFuel =
        HiveDataBase.cookingFuelBox?.values.toSet().toList() ?? [];
    listOfSocietyAllow =
        HiveDataBase.societyAllowBox?.values.toSet().toList() ?? [];
    listOfProClass = HiveDataBase.proClassBox?.values.toSet().toList() ?? [];
    listOfProCategory = HiveDataBase.proCateBox?.values.toSet().toList() ?? [];
    listOfChargeArea =
        HiveDataBase.chargeAreaListBox?.values.toSet().toList() ?? [];
    listOfCustBankName =
        HiveDataBase.getAllBanksBox?.values.toSet().toList() ?? [];
    paymentBankNameList =
        HiveDataBase.getAllBanksBox?.values.toSet().toList() ?? [];
  }

  void _setDependentData() {
    initialDepositStatusValue = (listOfInitialDepositStatus.isNotEmpty
        ? listOfInitialDepositStatus.first
        : null)!;
    registrationTypeValue = (listOfRegistrationType.isNotEmpty
        ? listOfRegistrationType.first
        : null)!;
    conversionPolicyValue = (listOfConversionPolicy.isNotEmpty
        ? listOfConversionPolicy.first
        : null)!;
    extraFittingValue = (listOfExtraFittingCost.isNotEmpty
        ? listOfExtraFittingCost.first
        : null)!;
    societyAllowValue =
        (listOfSocietyAllow.isNotEmpty ? listOfSocietyAllow.first : null)!;
    guardianTypeValue =
        (listOfGuardianType.isNotEmpty ? listOfGuardianType.first : null)!;
    propertyCategoryValue =
        (listOfProCategory.isNotEmpty ? listOfProCategory.first : null)!;
    propertyClassValue =
        (listOfProClass.isNotEmpty ? listOfProClass.first : null)!;
    existingCookingFuelValue =
        (listOfCookingFuel.isNotEmpty ? listOfCookingFuel.first : null)!;
    kycDoc1Value =
        (listOfIdentityProof.isNotEmpty ? listOfIdentityProof.first : null)!;
    kycDoc2Value =
        (listOfOwnershipProof.isNotEmpty ? listOfOwnershipProof.first : null)!;
    kycDoc3Value = (listOfKycDoc.isNotEmpty ? listOfKycDoc.first : null)!;
    preferredBillValue =
        (listOfEBilling.isNotEmpty ? listOfEBilling.first : null)!;

    if (propertyCategoryValue.id != null) {
      listOfDepositOffline = HiveDataBase.allDepositOfflineBox?.values
              .where((element) =>
                  element.propertyCategoryId == propertyCategoryValue.id)
              .toSet()
              .toList() ??
          [];
    }
  }

  _setInterestValue(RegistrationFormSetInterestValue event, emit) {
    registrationTypeValue = event.registrationTypeValue;
    _eventCompleted(emit);
  }

  _setConversionPolicyValue(
      RegistrationFormSetConversionPolicyValue event, emit) {
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
    areaValue = GetAllAreaModel();
    listOfAllArea = [];
    if (chargeAreaValue.gid != null) {
      List<GetAllAreaModel> dataList =
          HiveDataBase.allAreaBox?.values.toSet().toList() ?? [];
      listOfAllArea = dataList
          .where((element) => chargeAreaValue.gid == element.chargeAreaId)
          .toList();
    }
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

  _setPropertyCategoryValue(
      RegistrationFormSetPropertyCategoryValue event, emit) {
    propertyCategoryValue = event.propertyCategoryValue;
    listOfDepositOffline = [];
    schemeTypeValue = GetAllDepositOfflineModel();
    schemeAmountController.clear();
    if (propertyCategoryValue.id != null) {
      List<GetAllDepositOfflineModel> dataList =
          HiveDataBase.allDepositOfflineBox?.values.toSet().toList() ?? [];
      listOfDepositOffline = dataList
          .where((element) =>
              propertyCategoryValue.id == element.propertyCategoryId)
          .toList();
    }
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

  _setExistingCookingFuelValue(
      RegistrationFormSetExistingCookingFuelValue event, emit) {
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

  _setPaymentBankNameValue(
      RegistrationFormSetPaymentBankNameValue event, emit) {
    paymentBankNameValue = event.paymentBankNameValue;
    _eventCompleted(emit);
  }

  _setInitialDepositStatusValue(
      RegistrationFormSetInitialDepositStatusValue event, emit) {
    initialDepositStatusValue = event.initialDepositStatusValue;
    _eventCompleted(emit);
  }

  _setSchemeTypeValue(RegistrationFormSchemeTypeValue event, emit) {
    schemeAmountController.text = "";
    schemeTypeValue = event.schemeTypeValue;
    if(schemeTypeValue.depositTypesId != null){
      schemeAmountController.text =
          schemeTypeValue.firstDepositAmountWith.toString();
    }
    _eventCompleted(emit);
  }

  _selectSchemeTypeDetail(SchemeTypeDetailEvent event, emit) {
    if (schemeTypeValue.depositTypesId == null) {
      return Utils.errorSnackBar(
          msg: "The New Scheme Type field is requirement", context: event.context);
    } else if (schemeTypeValue.depositTypesId != null) {
      return showDialog(
          context: event.context,
          builder: (BuildContext context) =>
              DepositPop(schemeTypeValue: schemeTypeValue));
    }
  }

  _setModeDepositValue(RegistrationFormSetModeDepositValue event, emit) {
    modeDepositValue = event.modeDepositValue;
    _eventCompleted(emit);
  }

  _selectIdFrontCameraCapture(SelectIdFrontCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      idFrontPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectIdFrontGalleryCapture(SelectIdFrontGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      idFrontPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectIdBackCameraCapture(SelectIdBackCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      idBackPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectIdBackGalleryCapture(SelectIdBackGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      idBackPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectAddFrontCameraCapture(SelectAddFrontCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      addFrontPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectAddFrontGalleryCapture(
      SelectAddFrontGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      addFrontPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectAddBackCameraCapture(SelectAddBackCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      addBackPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectAddBackGalleryCapture(SelectAddBackGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      addBackPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectNocDocCameraCapture(SelectNocDocCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      nocDocPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectNocDocBackGalleryCapture(
      SelectNocDocBackGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      nocDocPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectCustomerCameraCapture(SelectCustomerCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      uploadCustomerPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectCustomerGalleryCapture(
      SelectCustomerGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      uploadCustomerPath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectHouseCameraCapture(SelectHouseCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      uploadHousePath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectHouseGalleryCapture(SelectHouseGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      uploadHousePath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectChqCameraCapture(SelectChqCameraCapture event, emit) async {
    var photoPath = await DashboardHelper.cameraCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      chequePath = photoPath;
    }
    _eventCompleted(emit);
  }

  _selectChqGalleryCapture(SelectChqGalleryCapture event, emit) async {
    var photoPath = await DashboardHelper.galleryCapture();
    log("photo-->${photoPath}");
    if (photoPath != null) {
      chequePath = photoPath;
    }
    _eventCompleted(emit);
  }

  _btnLocation(RegistrationFormSetLocation event, emit) {
    _setLocation();
    _eventCompleted(emit);
  }

  _setLocation() async {
    var getLocation = await DashboardHelper.getCurrentLocation();
    latController =
        TextEditingController(text: getLocation?.latitude.toString());
    longController =
        TextEditingController(text: getLocation?.longitude.toString());
    return getLocation;
  }

  _setChequeDate(RegistrationFormSetChequeDateEvent event, emit) async {
    DateTime? dateTime = await showDatePicker(
        context: event.context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (dateTime != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
      chequeDateController.text = formattedDate.toString();
      _eventCompleted(emit);
    }
  }


  Future _performFieldValidation(RegistrationFormPreviewPageEvent event) async {
    return await RegistrationFormHelper.textFieldValidationCheck(
      context: event.context,
      registrationType: registrationTypeValue.key ?? "",
      reasonRegistration: reasonRegistrationController.text.trim(),
      chargeId: chargeAreaValue.gid ?? "",
      areaId: areaValue.gid ?? "",
      mobileNumber: mobileController.text.trim(),
      altMobileNo: altMobileController.text.trim(),
      firstName: firstController.text.trim(),
      middleName: middleController.text.trim(),
      lastName: lastController.text.trim(),
      guardianType: guardianTypeValue.key ?? "",
      guardianName: guardianNameController.text.trim(),
      emailId: emailIdController.text.trim(),
      propertyCategoryId: propertyCategoryValue.id ?? "",
      propertyClassId: propertyClassValue.id ?? "",
      buildingNumber: buildingNumberController.text.trim(),
      houseNumber: houseNumberController.text.trim(),
      colonySocietyApartment: colonyController.text.trim(),
      streetName: streetController.text.trim(),
      town: townController.text.trim(),
      districtId: allDistrictValue.id ?? "",
      pinCode: pinCodeController.text.trim(),
      noOfKitchen: numberKitchenController.text.trim(),
      noOfBathroom: numberBathroomController.text.trim(),
      existingCookingFuel: existingCookingFuelValue.key ?? "",
      noOfFamilyMembers: familyMemberController.text.trim(),
      latitude: latController.text.trim(),
      longitude: longController.text.trim(),
      nearestLandmark: nearestLandmarkController.text.trim(),
      idProof: kycDoc1Value.key ?? "",
      idProofNo: kyc1NumberController.text.trim(),
      idFrontPath: idFrontPath.path.isEmpty ? File("") : idFrontPath,
      idBackPath: idBackPath.path.isEmpty ? File("") : idBackPath,
      addProof: kycDoc2Value.key ?? "",
      addProofNo: kyc2NumberController.text.trim(),
      addFrontPath: addFrontPath.path.isEmpty ? File("") : addFrontPath,
      addBackPath: addBackPath.path.isEmpty ? File("") : addBackPath,
      ownershipProperty: kycDoc3Value.key ?? "",
      ownerConsent: ownerConsentPath.path.isEmpty ? File("") : ownerConsentPath,
      housePath: uploadHousePath.path.isEmpty ? File("") : uploadHousePath,
      customerPath:
          uploadCustomerPath.path.isEmpty ? File("") : uploadCustomerPath,
      nocDocPath: nocDocPath.path.isEmpty ? File("") : nocDocPath,
      acceptConversionPolicy: conversionPolicyValue.key ?? "",
      acceptExtraFittingCost: extraFittingValue.key ?? "",
      societyAllowedMdpe: societyAllowValue.key ?? "",
      depositStatus: initialDepositStatusValue.key ?? "",
      reasonDeposit: reasonDepositStsController.text.trim(),
      schemeType: schemeTypeValue.depositTypesId ?? "",
      depositAmt: schemeAmountController.text.trim(),
      modeDepositValue: modeDepositValue.key ?? "",
      chqNo: chequeNoController.text.trim(),
      chqDate: chequeDateController.text.trim(),
      chqBank: paymentBankNameValue.toString(),
      chequeAccountNo: chequeAccountNoController.text.trim(),
      chequeMICRNo: chequeMicrNoController.text.trim(),
      chequePath: chequePath.path.isEmpty ? File("") : chequePath,
      canceledCheque: canceledCheque.path.isEmpty ? File("") : canceledCheque,
      bankAccountNumber: custBankAccNumberController.text.trim(),
      bankAddress: custBankAddController.text.trim(),
      bankIfscCode: custIfscCodeController.text.trim(),
      bankNameOfBank: custBankAccNumberController.text.trim(),
      customerConsent:
          customerConsent.path.isEmpty ? File("") : customerConsent,
      eBillingModel: preferredBillValue.key ?? "",
      residentStatus: residentStatusValue.key ?? "",
    );
  }

  _previewPage(RegistrationFormPreviewPageEvent event, emit) async {
    try {
      var validationResult = await _performFieldValidation(event);
      if (validationResult == null) return;
      isPreviewLoader = true;
      _eventCompleted(emit);
      localData = validationResult;
      log("saveCusRegData==>${localData}");
      // Show preview dialog
      await _showPreviewDialog(event.context);
      isPreviewLoader = false;
      _eventCompleted(emit);
    } catch (e) {
      log("previewCheck-->${e.toString()}");
    }
  }

  Future<void> _showPreviewDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarWidget(
              boolLeading: true,
              title: "Customer Detail",
            ),
          ),
          body: Container(
            color: AppColor.white,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildPreviewItems(context: context),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 8,
                  right: 8,
                  child: _buildBottomActions(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildPreviewItems({required BuildContext context}) {
    return [
      _buildPopItem(AppString.registrationType, registrationTypeValue.value),
      registrationTypeValue.key == "0"
          ? PopWidget.itemBuilder(
              textName: AppString.reasonRegistration,
              textValue: reasonRegistrationController.text)
          : Container(),
      _buildPopItem(AppString.conversionPolicy, conversionPolicyValue.value),
      _buildPopItem(AppString.fittingCost, extraFittingValue.value),
      registrationTypeValue.key == "1"
          ? _buildPopItem(AppString.mdpeAllow, societyAllowValue.value)
          : Container(),
      _buildPopItem(AppString.chargeArea, chargeAreaValue.chargeAreaName),
      _buildPopItem(AppString.area, areaValue.areaName),
      _buildPopItem(AppString.mobileNo, mobileController.text),
      _buildPopItem(AppString.alternateMobileNo, altMobileController.text),
      _buildPopItem(AppString.firstName, firstController.text),
      _buildPopItem(AppString.middleName, middleController.text),
      _buildPopItem(AppString.lastName, lastController.text),
      _buildPopItem(AppString.lastName, lastController.text),
      PopWidget.itemBuilder(
          star: registrationTypeValue.value != "Future Registration"
              ? AppString.star
              : "",
          textName: AppString.guardianType,
          textValue:
              guardianTypeValue.key == null ? "" : guardianTypeValue.value),
      PopWidget.itemBuilder(
          star: registrationTypeValue.value != "Future Registration"
              ? AppString.star
              : "",
          textName: AppString.guardianName,
          textValue: guardianNameController.text.isEmpty
              ? ""
              : guardianNameController.text),
      _buildPopItem(AppString.emailAddress, emailIdController.text),
      registrationTypeValue.key == "1"
          ? _buildPopItem(
              AppString.propertyCategory, propertyCategoryValue.name)
          : Container(),
      registrationTypeValue.key == "1"
          ? _buildPopItem(AppString.propertyClass, propertyClassValue.name)
          : Container(),
      _buildPopItem(AppString.buildingNumber, buildingNumberController.text),
      _buildPopItem(AppString.houseNumber, houseNumberController.text),
      _buildPopItem(AppString.colony, colonyController.text),
      _buildPopItem(AppString.streetName, streetController.text),
      _buildPopItem(AppString.town, townController.text),
      _buildPopItem(AppString.district, allDistrictValue.districtName),
      _buildPopItem(AppString.pinCode, pinCodeController.text),
      _buildPopItem(AppString.noOfKitchen, numberKitchenController.text),
      _buildPopItem(AppString.noOfBathroom, numberBathroomController.text),
      _buildPopItem(AppString.fuel, existingCookingFuelValue.value),
      _buildPopItem(AppString.noOfFamilyMembers, familyMemberController.text),
      _buildPopItem(AppString.locationLat, latController.text),
      _buildPopItem(AppString.locationLong, longController.text),
      _buildPopItem(AppString.idProof, kycDoc1Value.value),
      _buildPopItem(AppString.idProofNo, kyc1NumberController.text),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageWidget(
            star: AppString.star,
            title: AppString.idProofFront,
            imgFile:
                idFrontPath.path.isEmpty ? File("") : File(idFrontPath.path),
            onPressed: () {},
          ),
          ImageWidget(
            // star: AppString.star,
            title: AppString.idProofBack,
            imgFile: idBackPath.path.isEmpty ? File("") : File(idBackPath.path),
            onPressed: () {},
          ),
        ],
      ),
      PopWidget.divider(),
      PopWidget.itemBuilder(
          star: registrationTypeValue.value != "Future Registration"
              ? AppString.star
              : "",
          textName: AppString.addProof,
          textValue: kycDoc2Value.key == "" ? "-" : kycDoc2Value.value),
      PopWidget.itemBuilder(
          star: registrationTypeValue.value != "Future Registration"
              ? AppString.star
              : "",
          textName: AppString.addProofNo,
          textValue: kyc2NumberController.text.isEmpty
              ? ""
              : kyc2NumberController.text),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageWidget(
            star: registrationTypeValue.value != "Future Registration"
                ? AppString.star
                : "",
            title: AppString.addProofFront,
            imgFile:
                addFrontPath.path.isEmpty ? File("") : File(addFrontPath.path),
            onPressed: () {},
          ),
          ImageWidget(
            title: AppString.addProofBack,
            imgFile:
                addBackPath.path.isEmpty ? File("") : File(addBackPath.path),
            onPressed: () {},
          ),
        ],
      ),
      PopWidget.divider(),
      if (registrationTypeValue.key != "0") ...[
        PopWidget.itemBuilder(
            textName: AppString.ownershipProperty,
            textValue: kycDoc3Value.key == null ? "-" : kycDoc3Value.value),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageWidget(
              title: AppString.customerImg,
              imgFile: uploadCustomerPath.path.isEmpty
                  ? File("")
                  : File(uploadCustomerPath.path),
              onPressed: () {},
            ),
            if (kycDoc3Value.value == "Rented")
              ImageWidget(
                star: AppString.star,
                title: AppString.nocDoc,
                imgFile: nocDocPath.path.isEmpty
                    ? File("")
                    : File(nocDocPath.path),
                onPressed: () {},
              ),
            ImageWidget(
              title: AppString.houseImg,
              imgFile: uploadHousePath.path.isEmpty
                  ? File("")
                  : File(uploadHousePath.path),
              onPressed: () {},
            ),
          ],
        ),

        PopWidget.divider(),
        PopWidget.itemBuilder(
            textName: AppString.initDepositStatus,
            textValue: initialDepositStatusValue.key == null
                ? "-"
                : initialDepositStatusValue.value),
        PopWidget.itemBuilder(
            textName: AppString.schemeType,
            textValue: schemeTypeValue.depositTypesId == null
                ? "-"
                : schemeTypeValue.depositName),
        PopWidget.itemBuilder(
            textName: AppString.schemeAmt,
            textValue: schemeAmountController.text.isEmpty
                ? "-"
                : schemeAmountController.text),
        PopWidget.itemBuilder(
            textName: AppString.modeDeposit,
            textValue:
                modeDepositValue.key == null ? "-" : modeDepositValue.value),
        if (modeDepositValue.key == "1") ...[
          PopWidget.itemBuilder(
              textName: AppString.chqNo,
              textValue: chequeNoController.text.isEmpty
                  ? "-"
                  : chequeNoController.text),
          PopWidget.itemBuilder(
              textName: AppString.chqDate,
              textValue: chequeDateController.text.isEmpty
                  ? ""
                  : chequeDateController.text),
          PopWidget.itemBuilder(
              textName: AppString.chqBank,
              textValue: paymentBankNameValue.isEmpty
                  ? ""
                  : paymentBankNameValue.toString()),
          PopWidget.itemBuilder(
              textName: AppString.chequeAccountNo,
              textValue: chequeAccountNoController.text.isEmpty
                  ? ""
                  : chequeAccountNoController.text),
          PopWidget.itemBuilder(
              textName: AppString.chequeMICRNo,
              textValue: chequeMicrNoController.text.isEmpty
                  ? ""
                  : chequeMicrNoController.text),

          ImageWidget(
            star: AppString.star,
            title: AppString.chqPhoto,
            imgFile: chequePath.path.isEmpty ? File("") : File(chequePath.path),
            onPressed: () {},
          ),
        ]
      ],

      SizedBox(height: MediaQuery.of(context).size.height * 0.09),
    ];
  }

  Widget _buildPopItem(String label, String? value) {
    return PopWidget.itemBuilder(
      star: value?.isNotEmpty ?? false ? AppString.star : "",
      textName: label,
      textValue: value ?? "",
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isSaveLoader
            ? DottedLoaderWidget()
            : ButtonWidget(
                text: AppString.save,
                onPressed: () {
                  BlocProvider.of<RegistrationFormBloc>(context).add(
                      RegistrationFormSaveLocalDataEvent(context: context));
                },
              ),
        ButtonWidget(
          text: AppString.edit,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _updateLocalData(UpdateLocalDataEvent event, emit) async {
    emit(RegistrationFormInitialState());
    isUpdate = event.isUpdate;
    if (isUpdate == true) {
      List<SaveRegistrationFormModel> data =
          await HiveDataBase.registrationFormBox!.values.toList();
      if (data.isNotEmpty) {
        await _updateControllers(localData: data, i: event.index);
      }
    }
    _eventCompleted(emit);
  }

  _updateControllers(
      {required List<SaveRegistrationFormModel> localData, required int i}) {
    registrationTypeValue = localData[i].registrationType != ""
        ? listOfRegistrationType
            .firstWhere((e) => e.key == localData[i].registrationType)
        : GetNotInterestedModel();
    conversionPolicyValue = localData[i].acceptConversionPolicy != null
        ? listOfConversionPolicy
            .firstWhere((e) => e.key == localData[i].acceptConversionPolicy)
        : GetAcceptConversionPolicyModel();
    extraFittingValue = localData[i].acceptConversionPolicy != ""
        ? listOfExtraFittingCost
            .firstWhere((e) => e.key == localData[i].acceptConversionPolicy)
        : GetAcceptExtraFittingCostModel();
    societyAllowValue = localData[i].societyAllowedMdpe != ""
        ? listOfSocietyAllow
            .firstWhere((e) => e.key == localData[i].societyAllowedMdpe)
        : GetSocietyAllowModel();
    guardianTypeValue = localData[i].guardianType != ""
        ? listOfGuardianType
            .firstWhere((e) => e.key == localData[i].guardianType)
        : GetGuardianTypeModel();
    preferredBillValue = localData[i].eBillingModel != ""
        ? listOfEBilling.firstWhere((e) => e.key == localData[i].eBillingModel)
        : GetEBillingModel();
    allDistrictValue = localData[i].districtId != ""
        ? listOfAllDistrict.firstWhere((e) => e.id == localData[i].districtId)
        : GetAllDistrictModel();
    initialDepositStatusValue = listOfInitialDepositStatus
        .firstWhere((e) => e.key == localData[i].initialDepositeStatus);
    modeDepositValue = localData[i].modeOfDeposite != ""
        ? listOfModeOfDeposit
            .firstWhere((e) => e.key == localData[i].modeOfDeposite)
        : GetModeOfDepositModel();
    schemeTypeValue = localData[i].schemeType != ""
        ? listOfDepositOffline
            .firstWhere((e) => e.depositTypesId == localData[i].schemeType)
        : GetAllDepositOfflineModel();
    kycDoc1Value = localData[i].kycDocument1 != ""
        ? listOfIdentityProof
            .firstWhere((e) => e.key == localData[i].kycDocument1)
        : GetIdentityProofModel();
    kycDoc2Value = localData[i].kycDocument2 != ""
        ? listOfOwnershipProof
            .firstWhere((e) => e.key == localData[i].kycDocument2)
        : GetOwnershipProofModel();
    kycDoc3Value = localData[i].kycDocument3 != ""
        ? listOfKycDoc.firstWhere((e) => e.key == localData[i].kycDocument3)
        : GetKycDocModel();
    existingCookingFuelValue = localData[i].existingCookingFuel != ""
        ? listOfCookingFuel
            .firstWhere((e) => e.key == localData[i].existingCookingFuel)
        : GetExistingCookingFuelModel();
    residentStatusValue = localData[i].residentStatus != ""
        ? listOfResidentStatus
            .firstWhere((e) => e.key == localData[i].residentStatus)
        : GetResidentStatusModel();
    chargeAreaValue = localData[i].chargeArea != null
        ? listOfChargeArea.firstWhere((e) => e.gid == localData[i].chargeArea)
        : GetChargeAreaListModel();
    if (localData[i].chargeArea != null) {
      List<GetAllAreaModel> dataList =
          HiveDataBase.allAreaBox?.values.toSet().toList() ?? [];
      listOfAllArea = dataList
          .where((element) => chargeAreaValue.gid == element.chargeAreaId)
          .toList();
    }
    areaValue = localData[i].areaId != null
        ? listOfAllArea.firstWhere((e) => e.gid == localData[i].areaId)
        : GetAllAreaModel();

    // Update text controllers
    firstController.text = localData[i].firstName ?? "";
    middleController.text = localData[i].middleName ?? "";
    lastController.text = localData[i].lastName ?? "";
    guardianNameController.text = localData[i].guardianName ?? "";
    emailIdController.text = localData[i].emailId ?? "";
    buildingNumberController.text = localData[i].buildingNumber ?? "";
    houseNumberController.text = localData[i].houseNumber ?? "";
    colonyController.text = localData[i].colonySocietyApartment ?? "";
    streetController.text = localData[i].streetName ?? "";
    townController.text = localData[i].town ?? "";
    pinCodeController.text = localData[i].pinCode ?? "";
    numberKitchenController.text = localData[i].noOfKitchen ?? "";
    numberBathroomController.text = localData[i].noOfBathroom ?? "";
    familyMemberController.text = localData[i].noOfFamilyMembers ?? "";
    nearestLandmarkController.text = localData[i].nearestLandmark ?? "";
    kyc1NumberController.text = localData[i].kycDocument1Number ?? "";
    kyc2NumberController.text = localData[i].kycDocument2Number ?? "";
    kyc3NumberController.text = localData[i].kycDocument3Number ?? "";
    custBankAccNumberController.text = localData[i].bankAccountNumber ?? "";
    custIfscCodeController.text = localData[i].bankIfscCode ?? "";
    custBankAddController.text = localData[i].bankAddress ?? "";
    schemeAmountController.text = localData[i].schemeTypeAmount ?? "";
    latController.text = localData[i].latitude ?? "";
    longController.text = localData[i].longitude ?? "";
    chequeNoController.text = localData[i].chequeNumber ?? "";
    chequeDateController.text = localData[i].chequeDepositDate ?? "";
    chequeAccountNoController.text = localData[i].chequeBankAccount ?? "";
    chequeMicrNoController.text = localData[i].chequeMicrAccount ?? "";
    mobileController.text = localData[i].mobileNumber ?? "";
    altMobileController.text = localData[i].alternateMobile ?? "";
    reasonRegistrationController.text = localData[i].reasonRegistration ?? "";

    // Update file paths
    idFrontPath = File(localData[i].idFrontPath1 ?? "");
    idBackPath = File(localData[i].idBackPath1 ?? "");
    addFrontPath = File(localData[i].addFrontPath2 ?? "");
    addBackPath = File(localData[i].addBackPath2 ?? "");
    nocFrontPath = File(localData[i].nocFrontPath3 ?? "");
    nocBackPath = File(localData[i].nocBackPath3 ?? "");
    uploadCustomerPath = File(localData[i].uploadCustomerPhoto ?? "");
    uploadHousePath = File(localData[i].uploadHousePhoto ?? "");
    customerConsentPath = File(localData[i].customerConsentPhoto ?? "");
    ownerConsentPath = File(localData[i].ownerConsent ?? "");
    cancelChequePath = File(localData[i].canceledChequePhoto ?? "");
    chequePath = File(localData[i].chequePhoto ?? "");
    custBankNameValue = localData[i].bankNameOfBank ?? "";
    paymentBankNameValue = localData[i].payementBankName ?? "";
  }

  _saveLocalData(RegistrationFormSaveLocalDataEvent event, emit) async {
    try {
      isSaveLoader = true;
      _eventCompleted(emit);
      await RegistrationFormHelper.addCustRegSyncLocalDB(
          context: event.context,
          custRegSyncStore: localData,
          isUpdate: isUpdate,
          index: index);
      Navigator.pushAndRemoveUntil(event.context,
          MaterialPageRoute(builder: (_) => DashboardPage()), (r) => false);
      isSaveLoader = false;
      _eventCompleted(emit);
    } catch (e) {
      log("_saveLocalData-->${e.toString()}");
    }
  }

  _eventCompleted(Emitter<RegistrationFormState> emit) {
    emit(RegistrationFormGetAllDataState(
      isPageLoader: isPageLoader,
      isUpdate: isUpdate,
      labelModel: getLabelModel,
      registrationTypeValue: registrationTypeValue,
      getNotInterestedList: listOfRegistrationType,
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
      depositOfflineValue: schemeTypeValue,
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
      schemeAmountController: schemeAmountController,
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
      paymentBankNameList: paymentBankNameList,
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
