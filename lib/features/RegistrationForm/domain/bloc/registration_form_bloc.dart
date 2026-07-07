import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/enums.dart';
import 'package:pbg_app/features/RegistrationForm/presentation/widgets/DepositOfflinePop.dart';
import 'package:pbg_app/features/RegistrationForm/presentation/widgets/registration_preview_page.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_connection_type_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_customer_details_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_name_title_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_property_type_model.dart';

class RegistrationFormBloc extends Bloc<RegistrationFormEvent, RegistrationFormState> {
  RegistrationFormBloc() : super(RegistrationFormInitialState()) {
    on<RegistrationFormPageLoadEvent>(_pageLoad);
    on<RegistrationFormSetInterestValue>(_setInterestValue);
    on<RegistrationFormApplicationNoEvent>(_setApplicationNo);
    on<RegistrationFormCustomerSelectedEvent>(_setCustomerSelected);
    on<RegistrationFormSetConversionPolicyValue>(_setConversionPolicyValue);
    on<RegistrationFormSetExtraFittingValue>(_setExtraFittingValue);
    on<RegistrationFormSetSocietyAllowValue>(_setSocietyAllowValue);
    on<RegistrationFormSetChargeAreaValue>(_setChargeAreaValue);
    on<RegistrationFormSetAreaValue>(_setAreaValue);
    on<RegistrationFormSetGuardianTypeValue>(_setGuardianTypeValue);
    on<RegistrationFormSetHouseHoldTypeValue>(_setHouseHoldTypeValue);
    on<RegistrationFormSetPropertyCategoryValue>(_setPropertyCategoryValue);
    on<RegistrationFormSetPropertyClassValue>(_setPropertyClassValue);
    on<RegistrationFormNameTitleValue>(_setNameTitleValue);
    on<RegistrationFormRegTypeValue>(_setRegTypeValue);
    on<RegistrationFormMeterTypeValue>(_setMeterTypeValue);
    on<RegistrationFormSetDistrictValue>(_setDistrictValue);
    on<RegistrationFormSetLocation>(_btnLocation);
    on<RegistrationFormSetResidentStatusValue>(_setResidentStatusValue);
    on<RegistrationFormSetExistingCookingFuelValue>(_setExistingCookingFuelValue);
    on<RegistrationFormSetKycDoc1Value>(_setKycDoc1Value);
    on<RegistrationFormSetKycDoc2Value>(_setKycDoc2Value);
    on<RegistrationFormAddressProofEvent>(_setAddressProofEvent);
    on<RegistrationFormSetKycDoc3Value>(_setKycDoc3Value);
    on<RegistrationFormSetPreferredBillValue>(_setPreferredBillValue);
    on<RegistrationFormSetCustBankNameValue>(_setCustBankNameValue);
    on<RegistrationFormSetPaymentBankNameValue>(_setPaymentBankNameValue);
    on<RegistrationFormSetInitialDepositStatusValue>(_setInitialDepositStatusValue);
    on<RegistrationFormSchemeTypeValue>(_setSchemeTypeValue);
    on<RegistrationFormSetModeDepositValue>(_setModeDepositValue);
    on<RegistrationFormSetChequeDateEvent>(_setChequeDate);


    on<SelectIdFrontCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => idFrontPath = f, emit: emit));
    on<SelectIdFrontGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => idFrontPath = f, emit: emit));
    on<SelectIdBackCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => idBackPath = f, emit: emit));
    on<SelectIdBackGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => idBackPath = f, emit: emit));
    on<SelectAddFrontCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => addFrontPath = f, emit: emit));
    on<SelectAddFrontGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => addFrontPath = f, emit: emit));
    on<SelectAddBackCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => addBackPath = f, emit: emit));
    on<SelectAddBackGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => addBackPath = f, emit: emit));


    on<SelectNocDocBackCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => nocBackPath = f, emit: emit));
    on<SelectNocDocBackGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => nocBackPath = f, emit: emit));
    on<SelectNocDocFrontCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => nocFrontPath = f, emit: emit));
    on<SelectNocDocFrontGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => nocFrontPath = f, emit: emit));


    on<SelectNocDocCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => nocDocPath = f, emit: emit));
    on<SelectNocDocGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => nocDocPath = f, emit: emit));
    on<SelectCustomerCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => uploadCustomerPath = f, emit: emit));
    on<SelectCustomerGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => uploadCustomerPath = f, emit: emit));
    on<SelectHouseCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => uploadHousePath = f, emit: emit));
    on<SelectHouseGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => uploadHousePath = f, emit: emit));
    on<SelectChqCameraCapture>((e, emit) => _captureImage(
        fromCamera: true, assign: (f) => chequePath = f, emit: emit));
    on<SelectChqGalleryCapture>((e, emit) => _captureImage(
        fromCamera: false, assign: (f) => chequePath = f, emit: emit));

    on<SchemeTypeDetailEvent>(_selectSchemeTypeDetail);
    on<RegistrationFormPreviewPageEvent>(_previewPage);
    on<RegistrationFormSaveLocalDataEvent>(_saveLocalData);
    on<UpdateLocalDataEvent>(_updateLocalDataEvent);
  }

  bool isUpdate = false;
  int index = 0;
  bool isPageLoader = false;
  bool searchCustomerLoader = false;
  bool isPreviewLoader = false;
  bool isSaveLoader = false;
  bool isLocationLoader = false;

  SaveRegistrationFormModel localData = SaveRegistrationFormModel();

  GetChargeAreaListModel chargeAreaValue = GetChargeAreaListModel();
  GetAllAreaModel areaValue = GetAllAreaModel();
  GetPropertyCategoryModel propertyCategoryValue = GetPropertyCategoryModel();
  GetPropertyClassModel propertyClassValue = GetPropertyClassModel();
  GetNameTitleModel nameTitleValue = GetNameTitleModel();
  ConnectionTypeModel regFromVal = ConnectionTypeModel();
  ConnectionTypeModel meterTypeVal = ConnectionTypeModel();
  GetAllDistrictModel allDistrictValue = GetAllDistrictModel();
  GetAllDepositOfflineModel schemeTypeValue = GetAllDepositOfflineModel();
  GetNotInterestedModel registrationTypeValue = GetNotInterestedModel();
  GetAcceptConversionPolicyModel conversionPolicyValue = GetAcceptConversionPolicyModel();
  GetAcceptExtraFittingCostModel extraFittingValue = GetAcceptExtraFittingCostModel();
  GetSocietyAllowModel societyAllowValue = GetSocietyAllowModel();
  GetGuardianTypeModel guardianTypeValue = GetGuardianTypeModel();
  GetResidentStatusModel residentStatusValue = GetResidentStatusModel();
  PropertyTypeModel houseHoldTypeValue = PropertyTypeModel();
  GetExistingCookingFuelModel existingCookingFuelValue = GetExistingCookingFuelModel();
  GetIdentityProofModel kycDoc1Value = GetIdentityProofModel();
  GetOwnershipProofModel kycDoc2Value = GetOwnershipProofModel();
  GetOwnershipProofModel addressProofValue = GetOwnershipProofModel();
  GetKycDocModel kycDoc3Value = GetKycDocModel();
  GetEBillingModel preferredBillValue = GetEBillingModel();
  String custBankNameValue = "";
  String paymentBankNameValue = "";
  GetInitialDepositStatusModel initialDepositStatusValue = GetInitialDepositStatusModel();
  GetModeOfDepositModel modeDepositValue = GetModeOfDepositModel();

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
  List<GetOwnershipProofModel> listOfAddressProof = [];
  List<GetIdentityProofModel> listOfIdentityProof = [];
  List<GetGuardianTypeModel> listOfGuardianType = [];
  List<PropertyTypeModel> listOfHouseHoldType = [];
  List<GetExistingCookingFuelModel> listOfCookingFuel = [];
  List<GetSocietyAllowModel> listOfSocietyAllow = [];
  List<GetPropertyClassModel> listOfProClass = [];
  List<GetNameTitleModel> listOfNameTitle = [];
  List<GetPropertyCategoryModel> listOfProCategory = [];
  List<GetAllAreaModel> listOfAllArea = [];
  List<GetChargeAreaListModel> listOfChargeArea = [];
  List<GetAllDepositOfflineModel> listOfDepositOffline = [];
  List<String> listOfCustBankName = [];
  List<String> paymentBankNameList = [];
  List<ConnectionTypeModel> listOfDmaRegForm = [];
  List<ConnectionTypeModel> listOfMeterType = [];
  List<CustomerDetailsModel> customerSuggestions = [];

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
  String _lastSelectedAppNo = "";
  int _searchSeq = 0;

  final TextEditingController reasonRegistrationController = TextEditingController();
  final TextEditingController applicationNumberController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController altMobileController = TextEditingController();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController middleController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController guardianNameController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController buildingNumberController = TextEditingController();
  final TextEditingController floorNumberController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController colonyController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController wardNumberController = TextEditingController();
  final TextEditingController premiseTypeController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController numberKitchenController = TextEditingController(text: "1");
  final TextEditingController numberBathroomController = TextEditingController(text: "1");
  final TextEditingController familyMemberController = TextEditingController(text: "4");
  final TextEditingController nearestLandmarkController = TextEditingController();
  final TextEditingController kyc1NumberController = TextEditingController();
  final TextEditingController kyc2NumberController = TextEditingController();
  final TextEditingController kyc3NumberController = TextEditingController();
  final TextEditingController custBankAccNumberController = TextEditingController();
  final TextEditingController custIfscCodeController = TextEditingController();
  final TextEditingController custBankAddController = TextEditingController();
  final TextEditingController reasonDepositStsController = TextEditingController();
  final TextEditingController schemeAmountController = TextEditingController();
  final TextEditingController chequeNoController = TextEditingController();
  final TextEditingController chequeDateController = TextEditingController();
  final TextEditingController chequeAccountNoController = TextEditingController();
  final TextEditingController chequeMicrNoController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();


  List<TextEditingController> get _allControllers => [
    reasonRegistrationController,
    applicationNumberController,
    mobileController,
    altMobileController,
    firstController,
    middleController,
    lastController,
    dobController,
    guardianNameController,
    emailIdController,
    buildingNumberController,
    floorNumberController,
    houseNumberController,
    colonyController,
    streetController,
    townController,
    wardNumberController,
    premiseTypeController,
    pinCodeController,
    numberKitchenController,
    numberBathroomController,
    familyMemberController,
    nearestLandmarkController,
    kyc1NumberController,
    kyc2NumberController,
    kyc3NumberController,
    custBankAccNumberController,
    custIfscCodeController,
    custBankAddController,
    reasonDepositStsController,
    schemeAmountController,
    chequeNoController,
    chequeDateController,
    chequeAccountNoController,
    chequeMicrNoController,
    latController,
    longController,
  ];

  Client get _client => AppConfig.instanceInit()!.client!;

  bool get isVPPL => _client == Client.vppl;
  bool get isVRPL => _client == Client.vrpl;
  bool get isHPOIL => _client == Client.hpoil;
  bool get isAGCL => _client == Client.agcl;
  bool get isMGL => _client == Client.mahaNagar;
  bool get isPBGPL => _client == Client.purvaBharti;

  String get regTypeKey => isAGCL ? (regFromVal.key?.toString() ?? "") : (registrationTypeValue.key?.toString() ?? "");
  String get regTypeValue => isAGCL ? (regFromVal.name?.toString() ?? "") : (registrationTypeValue.value?.toString() ?? "");

  _pageLoad(RegistrationFormPageLoadEvent event,  emit) async {
    emit(RegistrationFormInitialState());
    _initializeStateVariables();
    _resetControllers();
    _initializeFilePaths();
    await _fetchHiveData();
    _setDependentData();
    await _setLocation(context: event.context);
    _eventCompleted(emit);
  }


  _initializeStateVariables() {
    isUpdate = false;
    isPageLoader = false;
    isPreviewLoader = false;
    isSaveLoader = false;
    isLocationLoader = false;

    searchCustomerLoader = false;
    customerSuggestions = [];
    _lastSelectedAppNo = "";
    _searchSeq++;

    schemeMonth = "";
    equipmentAmt = "";
    gasAmt = "";
    firstDeposit = "";

    chargeAreaValue = GetChargeAreaListModel();
    areaValue = GetAllAreaModel();
    propertyCategoryValue = GetPropertyCategoryModel();
    propertyClassValue = GetPropertyClassModel();
    nameTitleValue = GetNameTitleModel();
    regFromVal = ConnectionTypeModel();
    meterTypeVal = ConnectionTypeModel();
    allDistrictValue = GetAllDistrictModel();
    schemeTypeValue = GetAllDepositOfflineModel();
    registrationTypeValue = GetNotInterestedModel();
    conversionPolicyValue = GetAcceptConversionPolicyModel();
    extraFittingValue = GetAcceptExtraFittingCostModel();
    societyAllowValue = GetSocietyAllowModel();
    guardianTypeValue = GetGuardianTypeModel();
    houseHoldTypeValue = PropertyTypeModel();
    residentStatusValue = GetResidentStatusModel();
    existingCookingFuelValue = GetExistingCookingFuelModel();
    kycDoc1Value = GetIdentityProofModel();
    kycDoc2Value = GetOwnershipProofModel();
    addressProofValue = GetOwnershipProofModel();
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
    listOfAddressProof = [];
    listOfIdentityProof = [];
    listOfGuardianType = [];
    listOfHouseHoldType = [];
    listOfCookingFuel = [];
    listOfSocietyAllow = [];
    listOfProClass = [];
    listOfNameTitle = [];
    listOfProCategory = [];
    listOfAllArea = [];
    listOfChargeArea = [];
    listOfDepositOffline = [];
    listOfCustBankName = [];
    paymentBankNameList = [];
    listOfDmaRegForm = [];
    listOfMeterType = [];
    customerSuggestions = [];
  }

  _resetControllers() {
    for (final c in _allControllers) {
      c.text = "";
    }
    numberKitchenController.text = "1";
    numberBathroomController.text = "1";
    familyMemberController.text = "4";
    chequeDateController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  _initializeFilePaths() {
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

  _fetchHiveData() async {
    listOfAllLabel = HiveDataBase.allLabelBox?.values.toSet().toList() ?? [];
    listOfRegistrationType = HiveDataBase.notInterestedBox?.values.toSet().toList() ?? [];
    listOfInitialDepositStatus = HiveDataBase.initDepositStatusBox?.values.toSet().toList() ?? [];
    listOfExtraFittingCost = HiveDataBase.acceptExtraFittingCostBox?.values.toSet().toList() ?? [];
    listOfConversionPolicy = HiveDataBase.acceptConversionPolicyBox?.values.toSet().toList() ?? [];
    listOfAllDistrict = HiveDataBase.allDistrictBox?.values.toSet().toList() ?? [];
    listOfResidentStatus = HiveDataBase.resStatusBox?.values.toSet().toList() ?? [];
    listOfModeOfDeposit = HiveDataBase.modeOfDepositBox?.values.toSet().toList() ?? [];
    listOfEBilling = HiveDataBase.eBillingBox?.values.toSet().toList() ?? [];
    listOfKycDoc = HiveDataBase.kycDocBox?.values.toSet().toList() ?? [];
    listOfOwnershipProof = HiveDataBase.ownershipProofBox?.values.toSet().toList() ?? [];
    listOfAddressProof = HiveDataBase.ownershipProofBox?.values.toSet().toList() ?? [];
    listOfIdentityProof = HiveDataBase.idProofBox?.values.toSet().toList() ?? [];
    listOfGuardianType = HiveDataBase.guardianTypeBox?.values.toSet().toList() ?? [];
    listOfHouseHoldType = HiveDataBase.houseHoldTypeBox?.values.toSet().toList() ?? [];
    listOfCookingFuel = HiveDataBase.cookingFuelBox?.values.toSet().toList() ?? [];
    listOfSocietyAllow = HiveDataBase.societyAllowBox?.values.toSet().toList() ?? [];
    listOfProClass = HiveDataBase.proClassBox?.values.toSet().toList() ?? [];
    listOfNameTitle = HiveDataBase.nameTitleBox?.values.toSet().toList() ?? [];
    listOfDmaRegForm = HiveDataBase.dmaRegFormBox?.values.toSet().toList() ?? [];
    listOfMeterType = HiveDataBase.meterTypeBox?.values.toSet().toList() ?? [];
    listOfProCategory = HiveDataBase.proCateBox?.values.toSet().toList() ?? [];
    listOfChargeArea = HiveDataBase.chargeAreaListBox?.values.toSet().toList() ?? [];
    listOfCustBankName = HiveDataBase.getAllBanksBox?.values.toSet().toList() ?? [];
    paymentBankNameList = HiveDataBase.getAllBanksBox?.values.toSet().toList() ?? [];
  }

  _setDependentData() {
    if (listOfInitialDepositStatus.isNotEmpty) {
      initialDepositStatusValue = listOfInitialDepositStatus.first;
    }
    if (listOfRegistrationType.isNotEmpty) {
      registrationTypeValue = listOfRegistrationType.first;
    }
    if (listOfConversionPolicy.isNotEmpty) {
      conversionPolicyValue = listOfConversionPolicy.first;
    }
    if (listOfExtraFittingCost.isNotEmpty) {
      extraFittingValue = listOfExtraFittingCost.first;
    }
    if (listOfSocietyAllow.isNotEmpty) {
      societyAllowValue = listOfSocietyAllow.first;
    }
    if (listOfGuardianType.isNotEmpty) {
      guardianTypeValue = listOfGuardianType.first;
    }
    if (listOfHouseHoldType.isNotEmpty) {
      houseHoldTypeValue = listOfHouseHoldType.first;
    }
    if (listOfProCategory.isNotEmpty) {
      propertyCategoryValue = listOfProCategory.first;
    }
    if (listOfProClass.isNotEmpty) {
      propertyClassValue = listOfProClass.first;
    }
    if (listOfCookingFuel.isNotEmpty) {
      existingCookingFuelValue = listOfCookingFuel.first;
    }
    if (listOfIdentityProof.isNotEmpty) {
      kycDoc1Value = listOfIdentityProof.first;
    }
    if (listOfOwnershipProof.isNotEmpty) {
      kycDoc2Value = listOfOwnershipProof.first;
      addressProofValue = listOfOwnershipProof.first;
    }
    if (listOfAddressProof.isNotEmpty) {
      addressProofValue = listOfAddressProof.first;
    }
    if (listOfKycDoc.isNotEmpty) {
      kycDoc3Value = listOfKycDoc.first;
    }
    if (listOfEBilling.isNotEmpty) {
      preferredBillValue = listOfEBilling.first;
    }
    if (propertyCategoryValue.id != null) {
      listOfDepositOffline = HiveDataBase.allDepositOfflineBox?.values.where((element) =>
      element.propertyCategoryId == propertyCategoryValue.id).toSet().toList() ?? [];
    }
  }

  _setInterestValue(RegistrationFormSetInterestValue event,  emit) {
    registrationTypeValue = event.registrationTypeValue;
    _eventCompleted(emit);
  }

  _setApplicationNo(RegistrationFormApplicationNoEvent event, emit) async {
    final appNo = event.applicationNo.trim();

    if (appNo.isEmpty) {
      customerSuggestions = [];
      _eventCompleted(emit);
      return;
    }
    if (appNo == _lastSelectedAppNo) {
      customerSuggestions = [];
      _eventCompleted(emit);
      return;
    }

    final int mySeq = ++_searchSeq;
    searchCustomerLoader = true;
    _eventCompleted(emit);

    final customerData = await DashboardHelper.getPngrbCustomerDataApi(
      context: event.context,
      applicationNo: appNo,
    );
    if (mySeq != _searchSeq || appNo == _lastSelectedAppNo) {
      searchCustomerLoader = false;
      _eventCompleted(emit);
      return;
    }

    customerSuggestions = customerData ?? [];
    searchCustomerLoader = false;
    _eventCompleted(emit);
  }

  _setCustomerSelected(RegistrationFormCustomerSelectedEvent event, emit) async {
    _searchSeq++;
    final c = event.customer;
    _lastSelectedAppNo = c.applicationNumber ?? '';

    applicationNumberController.text = c.applicationNumber ?? '';
    firstController.text = c.firstName ?? '';
    lastController.text = c.lastName ?? '';
    mobileController.text = c.mobileNumber ?? '';
    altMobileController.text = c.alternateNumber ?? '';
    colonyController.text = c.address ?? '';
    emailIdController.text = c.emailId ?? '';
    pinCodeController.text = c.pinCode ?? '';
    streetController.text = c.state ?? '';

    customerSuggestions = [];
    searchCustomerLoader = false;
    _eventCompleted(emit);
  }

  _setConversionPolicyValue(RegistrationFormSetConversionPolicyValue event,  emit) {
    conversionPolicyValue = event.conversionPolicyValue;
    _eventCompleted(emit);
  }

  _setExtraFittingValue(RegistrationFormSetExtraFittingValue event,  emit) {
    extraFittingValue = event.extraFittingValue;
    _eventCompleted(emit);
  }

  _setSocietyAllowValue(RegistrationFormSetSocietyAllowValue event,  emit) {
    societyAllowValue = event.societyAllowValue;
    _eventCompleted(emit);
  }

  _setChargeAreaValue(RegistrationFormSetChargeAreaValue event,  emit) {
    chargeAreaValue = event.chargeAreaValue;
    areaValue = GetAllAreaModel();
    listOfAllArea = [];
    if (chargeAreaValue.gid != null) {
      final List<GetAllAreaModel> dataList = HiveDataBase.allAreaBox?.values.toSet().toList() ?? [];
      listOfAllArea = dataList.where((element) => chargeAreaValue.gid == element.chargeAreaId).toList();
    }
    _eventCompleted(emit);
  }

  _setAreaValue(RegistrationFormSetAreaValue event,  emit) {
    areaValue = event.areaValue;
    _eventCompleted(emit);
  }

  _setGuardianTypeValue(RegistrationFormSetGuardianTypeValue event,  emit) {
    guardianTypeValue = event.guardianTypeValue;
    _eventCompleted(emit);
  }
  _setHouseHoldTypeValue(RegistrationFormSetHouseHoldTypeValue event, emit) {
    houseHoldTypeValue = event.houseHoldTypeValue;
    _eventCompleted(emit);
  }

  _setPropertyCategoryValue(RegistrationFormSetPropertyCategoryValue event,  emit) {
    propertyCategoryValue = event.propertyCategoryValue;
    listOfDepositOffline = [];
    schemeTypeValue = GetAllDepositOfflineModel();
    schemeAmountController.clear();
    if (propertyCategoryValue.id != null) {
      final List<GetAllDepositOfflineModel> dataList = HiveDataBase.allDepositOfflineBox?.values.toSet().toList() ?? [];
      listOfDepositOffline = dataList.where((element) =>
      propertyCategoryValue.id == element.propertyCategoryId).toList();
    }
    _eventCompleted(emit);
  }

  _setPropertyClassValue(RegistrationFormSetPropertyClassValue event,  emit) {
    propertyClassValue = event.propertyClassValue;
    _eventCompleted(emit);
  }

  _setNameTitleValue(RegistrationFormNameTitleValue event,  emit) {
    nameTitleValue = event.nameTitleVal;
    _eventCompleted(emit);
  }

  _setRegTypeValue(RegistrationFormRegTypeValue event,  emit) {
    regFromVal = event.regFromVal;
    _eventCompleted(emit);
  }

  _setMeterTypeValue(RegistrationFormMeterTypeValue event,  emit) {
    meterTypeVal = event.meterTypeVal;
    _eventCompleted(emit);
  }

  _setDistrictValue(RegistrationFormSetDistrictValue event,  emit) {
    allDistrictValue = event.allDistrictValue;
    _eventCompleted(emit);
  }

  _setResidentStatusValue(RegistrationFormSetResidentStatusValue event,  emit) {
    residentStatusValue = event.residentStatusValue;
    _eventCompleted(emit);
  }

  _setExistingCookingFuelValue(RegistrationFormSetExistingCookingFuelValue event,  emit) {
    existingCookingFuelValue = event.existingCookingFuelValue;
    _eventCompleted(emit);
  }

  _setKycDoc1Value(RegistrationFormSetKycDoc1Value event,  emit) {
    kycDoc1Value = event.kycDoc1Value;
    _eventCompleted(emit);
  }

  _setKycDoc2Value(RegistrationFormSetKycDoc2Value event,  emit) {
    kycDoc2Value = event.kycDoc2Value;
    _eventCompleted(emit);
  }
  _setAddressProofEvent(RegistrationFormAddressProofEvent event,  emit) {
    addressProofValue = event.addressProofValue;
    _eventCompleted(emit);
  }

  _setKycDoc3Value(RegistrationFormSetKycDoc3Value event,  emit) {
    kycDoc3Value = event.kycDoc3Value;
    _eventCompleted(emit);
  }

  _setPreferredBillValue(RegistrationFormSetPreferredBillValue event,  emit) {
    preferredBillValue = event.preferredBillValue;
    _eventCompleted(emit);
  }

  _setCustBankNameValue(RegistrationFormSetCustBankNameValue event,  emit) {
    custBankNameValue = event.custBankNameValue;
    _eventCompleted(emit);
  }

  _setPaymentBankNameValue(RegistrationFormSetPaymentBankNameValue event,  emit) {
    paymentBankNameValue = event.paymentBankNameValue;
    _eventCompleted(emit);
  }

  _setInitialDepositStatusValue(RegistrationFormSetInitialDepositStatusValue event,  emit) {
    initialDepositStatusValue = event.initialDepositStatusValue;
    _eventCompleted(emit);
  }

  _setSchemeTypeValue(RegistrationFormSchemeTypeValue event,  emit) {
    schemeAmountController.text = "";
    schemeTypeValue = event.schemeTypeValue;
    if (schemeTypeValue.depositTypesId != null) {
      schemeAmountController.text =
          schemeTypeValue.firstDepositAmountWith.toString();
    }
    _eventCompleted(emit);
  }

  _selectSchemeTypeDetail(SchemeTypeDetailEvent event,  emit) {
    if (schemeTypeValue.depositTypesId == null) {
      Utils.errorSnackBar(
          msg: "The New Scheme Type field is requirement",
          context: event.context);
      return;
    }
    showDialog(
      context: event.context,
      builder: (BuildContext context) =>
          DepositPop(schemeTypeValue: schemeTypeValue),
    );
  }

  _setModeDepositValue(RegistrationFormSetModeDepositValue event,  emit) {
    modeDepositValue = event.modeDepositValue;
    _eventCompleted(emit);
  }


  /// Single entry point for every camera/gallery capture.
  _captureImage({
    required bool fromCamera,
    required Function(File) assign,
    required  emit,
  }) async {
    final File? photoPath = fromCamera
        ? await DashboardHelper.cameraCapture()
        : await DashboardHelper.galleryCapture();
    log("photo-->$photoPath");
    if (photoPath != null) {
      assign(photoPath);
    }
    _eventCompleted(emit);
  }

  _btnLocation(RegistrationFormSetLocation event, emit) async {
    isLocationLoader = true;
    _eventCompleted(emit);
    await _setLocation(context: event.context);
    isLocationLoader = false;
    _eventCompleted(emit);
  }

  _setLocation({required BuildContext context}) async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      status = await Permission.location.request();
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    if (await Permission.location.isGranted) {
      final getLocation = await DashboardHelper.getCurrentLocation();
      latController.text = getLocation?.latitude.toString() ?? "";
      longController.text = getLocation?.longitude.toString() ?? "";
      return getLocation;
    } else {
      Utils.errorSnackBar(msg: "Location permission denied", context: context);
      return null;
    }
  }

  _setChequeDate(RegistrationFormSetChequeDateEvent event, emit) async {
    final DateTime? dateTime = await showDatePicker(
      context: event.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (dateTime != null) {
      chequeDateController.text = DateFormat('dd-MM-yyyy').format(dateTime);
      _eventCompleted(emit);
    }
  }

  _performFieldValidation(RegistrationFormPreviewPageEvent event) async {
    return await RegistrationFormHelper.textFieldValidationCheck(
      isAGCL: isAGCL,
      context: event.context,
      registrationType: registrationTypeValue,
      regFrom: regFromVal,
      reasonRegistration: reasonRegistrationController.text.trim(),
      applicationNumber: applicationNumberController.text.trim(),
      chargeArea: chargeAreaValue,
      area: areaValue,
      nameTitle: nameTitleValue,
      mobile: mobileController.text.trim(),
      altMobile: altMobileController.text.trim(),
      first: firstController.text.trim(),
      middle: middleController.text.trim(),
      last: lastController.text.trim(),
      dob: dobController.text.trim(),
      guardianType: guardianTypeValue,
      guardianName: guardianNameController.text.trim(),
      emailId: emailIdController.text.trim(),
      propertyCategory: propertyCategoryValue,
      propertyClass: propertyClassValue,
      buildingNumber: buildingNumberController.text.trim(),
      floorNumber: floorNumberController.text.trim(),
      houseNumber: houseNumberController.text.trim(),
      colony: colonyController.text.trim(),
      street: streetController.text.trim(),
      town: townController.text.trim(),
      allDistrict: allDistrictValue,
      wardNumber: wardNumberController.text.trim(),
      premiseType: premiseTypeController.text.trim(),
      pinCode: pinCodeController.text.trim(),
      numberKitchen: numberKitchenController.text.trim(),
      numberBathroom: numberBathroomController.text.trim(),
      existingCookingFuel: existingCookingFuelValue,
      familyMember: familyMemberController.text.trim(),
      lat: latController.text.trim(),
      long: longController.text.trim(),
      nearestLandmark: nearestLandmarkController.text.trim(),
      kycDoc1: kycDoc1Value,
      kyc1Number: kyc1NumberController.text.trim(),
      kycDoc2: kycDoc2Value,
      kyc2Number: kyc2NumberController.text.trim(),
      kycDoc3: kycDoc3Value,
      kyc3Number: kyc3NumberController.text.trim(),
      addressProof: addressProofValue,
      bankName: bankNameListModel,
      custBankName: custBankNameValue,
      paymentBankName: paymentBankNameValue,
      custBankAccNumber: custBankAccNumberController.text.trim(),
      custIfscCode: custIfscCodeController.text.trim(),
      custBankAdd: custBankAddController.text.trim(),
      reasonDepositSts: reasonDepositStsController.text.trim(),
      schemeType: schemeTypeValue,
      schemeAmount: schemeAmountController.text.trim(),
      chequeNo: chequeNoController.text.trim(),
      chequeDate: chequeDateController.text.trim(),
      chequeAccountNo: chequeAccountNoController.text.trim(),
      chequeMicrNo: chequeMicrNoController.text.trim(),
      conversionPolicy: conversionPolicyValue,
      extraFitting: extraFittingValue,
      societyAllow: societyAllowValue,
      initialDepositStatus: initialDepositStatusValue,
      modeDeposit: modeDepositValue,
      preferredBill: preferredBillValue,
      residentStatus: residentStatusValue,
      houseHoldType: houseHoldTypeValue,
      meterType: meterTypeVal,
      customerConsent: customerConsent,
      canceledCheque: canceledCheque,
      idFrontPath: idFrontPath,
      idBackPath: idBackPath,
      addFrontPath: addFrontPath,
      addBackPath: addBackPath,
      nocDocPath: nocDocPath,
      nocFrontPath: nocFrontPath,
      nocBackPath: nocBackPath,
      uploadCustomerPath: uploadCustomerPath,
      uploadHousePath: uploadHousePath,
      ownerConsentPath: ownerConsentPath,
      customerConsentPath: customerConsentPath,
      cancelChequePath: cancelChequePath,
      chequePath: chequePath,
    );
  }

  _previewPage(RegistrationFormPreviewPageEvent event, emit) async {
    try {
      log("AGCL=$isAGCL regKey=$regTypeKey regValue=$regTypeValue");
      final validationResult = await _performFieldValidation(event);
      if (validationResult == null) return;
      isPreviewLoader = true;
      _eventCompleted(emit);
      localData = validationResult;
      log("saveCusRegData==>$localData");
      await showDialog<void>(
        context: event.context,
        builder: (_) => RegistrationPreviewPage(bloc: this),
      );
      isPreviewLoader = false;
      _eventCompleted(emit);
    } catch (e, st) {
      log("previewCheck--> $e");
      log("stack--> $st");
      isPreviewLoader = false;
      _eventCompleted(emit);
    }
  }

  _saveLocalData(RegistrationFormSaveLocalDataEvent event, emit) async {
    try {
      isSaveLoader = true;
      _eventCompleted(emit);
      await RegistrationFormHelper.addCustRegSyncLocalDB(
        context: event.context,
        custRegSyncStore: localData,
        isUpdate: isUpdate,
        index: index,
      );
      Navigator.pushAndRemoveUntil(
        event.context,
        MaterialPageRoute(builder: (_) => DashboardPage()),
            (r) => false,
      );
      isSaveLoader = false;
      _eventCompleted(emit);
    } catch (e) {
      log("_saveLocalData Error --> ${e.toString()}");
    }
  }

  _updateLocalDataEvent(UpdateLocalDataEvent event, emit) async {
    isUpdate = event.isUpdate;
    index = event.index;
    localData = event.updatedModel;
    try {
      isSaveLoader = true;
      _eventCompleted(emit);
      if (event.isUpdate) {
        final localData = event.updatedModel;

        if (isAGCL) {
          regFromVal = listOfDmaRegForm.firstWhere(
                (e) => e.key?.toString() == localData.registrationType,
            orElse: () => ConnectionTypeModel(),
          );
        } else {
          registrationTypeValue = listOfRegistrationType.firstWhere(
                (e) => e.key?.toString() == localData.registrationType,
            orElse: () => GetNotInterestedModel(),
          );
        }
        conversionPolicyValue = listOfConversionPolicy.firstWhere((e) => e.key == localData.acceptConversionPolicy,
          orElse: () => GetAcceptConversionPolicyModel(),
        );
        propertyClassValue = listOfProClass.firstWhere((e) => e.id == localData.propertyClassId,
          orElse: () => GetPropertyClassModel(),
        );
        propertyCategoryValue = listOfProCategory.firstWhere((e) => e.id == localData.propertyCategoryId,
          orElse: () => GetPropertyCategoryModel(),
        );

        final List<GetAllDepositOfflineModel> dataList = HiveDataBase.allDepositOfflineBox?.values.toSet().toList() ?? [];
        listOfDepositOffline = dataList.where((element) =>
        propertyCategoryValue.id == element.propertyCategoryId).toList();
        extraFittingValue = listOfExtraFittingCost.firstWhere((e) => e.key == localData.acceptExtraFittingCost,
          orElse: () => GetAcceptExtraFittingCostModel(),
        );
        societyAllowValue = listOfSocietyAllow.firstWhere((e) => e.key == localData.societyAllowedMdpe,
          orElse: () => GetSocietyAllowModel(),
        );
        nameTitleValue = listOfNameTitle.firstWhere((e) => e.id == localData.nameTitle,
          orElse: () => GetNameTitleModel(),
        );
        guardianTypeValue = listOfGuardianType.firstWhere((e) => e.key == localData.guardianType,
          orElse: () => GetGuardianTypeModel(),
        );
        houseHoldTypeValue = listOfHouseHoldType.firstWhere((e) => e.id.toString() == localData.houseHoldType,
          orElse: () => PropertyTypeModel(),
        );
        preferredBillValue = listOfEBilling.firstWhere((e) => e.key == localData.eBillingModel,
          orElse: () => GetEBillingModel(),
        );
        allDistrictValue = listOfAllDistrict.firstWhere((e) => e.id == localData.districtId,
          orElse: () => GetAllDistrictModel(),
        );
        initialDepositStatusValue = listOfInitialDepositStatus.firstWhere((e) => e.key == localData.initialDepositeStatus,
          orElse: () => GetInitialDepositStatusModel(),
        );
        modeDepositValue = listOfModeOfDeposit.firstWhere((e) => e.key == localData.modeOfDeposite,
          orElse: () => GetModeOfDepositModel(),
        );
        schemeTypeValue = listOfDepositOffline.firstWhere((e) => e.depositTypesId == localData.schemeType,
          orElse: () => GetAllDepositOfflineModel(),
        );
        kycDoc1Value = listOfIdentityProof.firstWhere((e) => e.key == localData.kycDocument1,
          orElse: () => GetIdentityProofModel(),
        );
        kycDoc2Value = listOfOwnershipProof.firstWhere((e) => e.key == localData.kycDocument2,
          orElse: () => GetOwnershipProofModel(),
        );
        addressProofValue = listOfAddressProof.firstWhere((e) => e.key == localData.kycDocument3,
          orElse: () => GetOwnershipProofModel(),
        );
        kycDoc3Value = listOfKycDoc.firstWhere((e) => e.key == localData.kycDocument3,
          orElse: () => GetKycDocModel(),
        );
        existingCookingFuelValue = listOfCookingFuel.firstWhere((e) => e.key == localData.existingCookingFuel,
          orElse: () => GetExistingCookingFuelModel(),
        );
        residentStatusValue = listOfResidentStatus.firstWhere((e) => e.key == localData.residentStatus,
          orElse: () => GetResidentStatusModel(),
        );
        chargeAreaValue = listOfChargeArea.firstWhere((e) => e.gid == localData.chargeArea,
          orElse: () => GetChargeAreaListModel(),
        );

        if (localData.chargeArea != null) {
          final List<GetAllAreaModel> areaList = HiveDataBase.allAreaBox?.values.toSet().toList() ?? [];
          listOfAllArea = areaList.where((element) => chargeAreaValue.gid == element.chargeAreaId).toList();
        }
        areaValue = listOfAllArea.firstWhere((e) => e.gid == localData.areaId,
          orElse: () => GetAllAreaModel(),
        );
        meterTypeVal = listOfMeterType.firstWhere(
              (e) => e.key?.toString() == localData.meterType,
          orElse: () => ConnectionTypeModel(),
        );
        firstController.text = localData.firstName ?? "";
        middleController.text = localData.middleName ?? "";
        lastController.text = localData.lastName ?? "";
        dobController.text = localData.dob ?? "";
        guardianNameController.text = localData.guardianName ?? "";
        emailIdController.text = localData.emailId ?? "";
        buildingNumberController.text = localData.buildingNumber ?? "";
        floorNumberController.text = localData.floorNumber ?? "";
        houseNumberController.text = localData.houseNumber ?? "";
        colonyController.text = localData.colonySocietyApartment ?? "";
        streetController.text = localData.streetName ?? "";
        townController.text = localData.town ?? "";
        wardNumberController.text = localData.wardNumber ?? "";
        premiseTypeController.text = localData.premiseType ?? "";
        pinCodeController.text = localData.pinCode ?? "";
        numberKitchenController.text = localData.noOfKitchen ?? "";
        numberBathroomController.text = localData.noOfBathroom ?? "";
        familyMemberController.text = localData.noOfFamilyMembers ?? "";
        nearestLandmarkController.text = localData.nearestLandmark ?? "";
        kyc1NumberController.text = localData.kycDocument1Number ?? "";
        kyc2NumberController.text = localData.kycDocument2Number ?? "";
        kyc3NumberController.text = localData.kycDocument3Number ?? "";
        custBankAccNumberController.text = localData.bankAccountNumber ?? "";
        custIfscCodeController.text = localData.bankIfscCode ?? "";
        custBankAddController.text = localData.bankAddress ?? "";
        schemeAmountController.text = localData.schemeTypeAmount ?? "";
        latController.text = localData.latitude ?? "";
        longController.text = localData.longitude ?? "";
        chequeNoController.text = localData.chequeNumber ?? "";
        chequeDateController.text = localData.chequeDepositDate ?? "";
        chequeAccountNoController.text = localData.chequeBankAccount ?? "";
        chequeMicrNoController.text = localData.chequeMicrAccount ?? "";
        mobileController.text = localData.mobileNumber ?? "";
        altMobileController.text = localData.alternateMobile ?? "";
        reasonRegistrationController.text = localData.reasonRegistration ?? "";
        applicationNumberController.text = localData.applicationNumber ?? "";

        idFrontPath = File(localData.idFrontPath1 ?? "");
        idBackPath = File(localData.idBackPath1 ?? "");
        addFrontPath = File(localData.addFrontPath2 ?? "");
        addBackPath = File(localData.addBackPath2 ?? "");
        nocFrontPath = File(localData.nocFrontPath3 ?? "");
        nocBackPath = File(localData.nocBackPath3 ?? "");
        nocDocPath = File(localData.nocDocPath ?? "");
        uploadCustomerPath = File(localData.uploadCustomerPhoto ?? "");
        uploadHousePath = File(localData.uploadHousePhoto ?? "");
        customerConsentPath = File(localData.customerConsentPhoto ?? "");
        ownerConsentPath = File(localData.ownerConsent ?? "");
        cancelChequePath = File(localData.canceledChequePhoto ?? "");
        chequePath = File(localData.chequePhoto ?? "");
        custBankNameValue = localData.bankNameOfBank ?? "";
        paymentBankNameValue = localData.payementBankName ?? "";
      }
      isSaveLoader = false;
      _eventCompleted(emit);
    } catch (e) {
      log("_updateLocalDataEvent Error --> ${e.toString()}");
    }
  }

  _eventCompleted(Emitter<RegistrationFormState> emit) {
    emit(RegiFormUpdateDataState(
      isPageLoader: isPageLoader,
      searchCustomerLoader: searchCustomerLoader,
      isLocationLoader: isLocationLoader,
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
      listOfHouseHoldType: listOfHouseHoldType,
      propertyCategoryValue: propertyCategoryValue,
      propertyClassValue: propertyClassValue,
      nameTitleValue: nameTitleValue,
      regFromVal: regFromVal,
      meterTypeVal: meterTypeVal,
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
      houseHoldTypeValue: houseHoldTypeValue,
      getResidentStatusList: listOfResidentStatus,
      getResidentStatusModel: getResidentStatusModel,
      getPropertyClassModel: listOfProClass,
      listOfNameTitle: listOfNameTitle,
      listOfDmaRegForm: listOfDmaRegForm,
      listOfMeterType: listOfMeterType,
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
      applicationNumberController: applicationNumberController,
      mobileController: mobileController,
      altMobileController: altMobileController,
      firstController: firstController,
      middleController: middleController,
      lastController: lastController,
      dobController: dobController,
      guardianNameController: guardianNameController,
      emailIdController: emailIdController,
      buildingNumberController: buildingNumberController,
      floorNumberController: floorNumberController,
      houseNumberController: houseNumberController,
      colonyController: colonyController,
      streetController: streetController,
      townController: townController,
      wardNumberController: wardNumberController,
      premiseTypeController: premiseTypeController,
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
      customerSuggestions: customerSuggestions,
      addressProofValue: addressProofValue,
      listOfAddressProof: listOfAddressProof,
    ));
  }

  @override
  close() {
    for (final c in _allControllers) {
      c.dispose();
    }
    return super.close();
  }
}