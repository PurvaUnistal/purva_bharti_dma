import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
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
  String? interestValue;
  String? conversionPolicyValue;
  String? extraFittingValue;
  String? societyAllowValue;
  String? guardianTypeValue;
  String? residentStatusValue;
  String? existingCookingFuelValue;
  String? kycDoc1Value;
  String? kycDoc2Value;
  String? kycDoc3Value;
  String? preferredBillValue;
  String? custBankNameValue;
  String? paymentBankNameValue;
  String? initialDepositStatusValue;
  String? modeDepositValue;

  GetLabelModel _labelModel = GetLabelModel();
  GetLabelModel get labelModel => _labelModel;

  List _getNotInterestedList = [];
  List get getNotInterestedList => _getNotInterestedList;
  GetNotInterestedModel _getNotInterestedModel = GetNotInterestedModel();
  GetNotInterestedModel get getNotInterestedModel => _getNotInterestedModel;

  List _conversionPolicyList = [];
  List get conversionPolicyList => _conversionPolicyList;
  GetAcceptConversionPolicyModel _getAcceptConversionPolicyModel = GetAcceptConversionPolicyModel();
  GetAcceptConversionPolicyModel get getAcceptConversionPolicyModel => _getAcceptConversionPolicyModel;

  List _extraFittingCostList = [];
  List get extraFittingCostList => _extraFittingCostList;

  GetAcceptExtraFittingCostModel _getAcceptExtraFittingCostModel = GetAcceptExtraFittingCostModel();
  GetAcceptExtraFittingCostModel get getAcceptExtraFittingCostModel => _getAcceptExtraFittingCostModel;

  List<GetAllDistrictModel> _getAllDistrictModel = [];
  List<GetAllDistrictModel> get getAllDistrictModel => _getAllDistrictModel;

  List _societyAllowList = [];
  List get societyAllowList => _societyAllowList;
  GetSocietyAllowModel _getSocietyAllowModel = GetSocietyAllowModel();
  GetSocietyAllowModel get getSocietyAllowModel => _getSocietyAllowModel;

  List _getIdentityProofList = [];
  List get getIdentityProofList => _getIdentityProofList;
  GetIdentityProofModel _getIdentityProofModel = GetIdentityProofModel();
  GetIdentityProofModel get getIdentityProofModel => _getIdentityProofModel;

  List _getOwnershipProofList = [];
  List get getOwnershipProofList => _getOwnershipProofList;
  GetOwnershipProofModel _getOwnershipProofModel = GetOwnershipProofModel();
  GetOwnershipProofModel get getOwnershipProofModel => _getOwnershipProofModel;

  List _getKycDocList = [];
  List get getKycDocList => _getKycDocList;
  GetKycDocModel _getKycDocModel = GetKycDocModel();
  GetKycDocModel get getKycDocModel => _getKycDocModel;

  List _getGuardianTypeList = [];
  List get getGuardianTypeList => _getGuardianTypeList;

  GetGuardianTypeModel _getGuardianTypeModel = GetGuardianTypeModel();
  GetGuardianTypeModel get getGuardianTypeModel => _getGuardianTypeModel;

  List _existingCookingFuelList = [];
  List get existingCookingFuelList => _existingCookingFuelList;
  GetExistingCookingFuelModel _getExistingCookingFuelModel = GetExistingCookingFuelModel();
  GetExistingCookingFuelModel get getExistingCookingFuelModel => _getExistingCookingFuelModel;

  List _getResidentStatusList = [];
  List get getResidentStatusList => _getResidentStatusList;
  GetResidentStatusModel _getResidentStatusModel = GetResidentStatusModel();
  GetResidentStatusModel get getResidentStatusModel => _getResidentStatusModel;

  List<GetPropertyCategoryModel> _getPropertyCategoryModel = [];
  List<GetPropertyCategoryModel> get getPropertyCategoryModel => _getPropertyCategoryModel;

  List<GetPropertyClassModel> _getPropertyClassModel = [];
  List<GetPropertyClassModel> get getPropertyClassModel => _getPropertyClassModel;

  List<GetAllAreaModel> _getAllAreaModel = [];
  List<GetAllAreaModel> get getAllAreaModel => _getAllAreaModel;

  List<GetChargeAreaListModel> _getChargeAreaListModel = [];
  List<GetChargeAreaListModel> get getChargeAreaListModel => _getChargeAreaListModel;

  List _eBillingList = [];
  List get eBillingList => _eBillingList;

  GetEBillingModel _getEBillingModel = GetEBillingModel();
  GetEBillingModel get getEBillingModel => _getEBillingModel;

  List _initialDepositStatusList = [];
  List get initialDepositStatusList => _initialDepositStatusList;

  GetInitialDepositStatusModel _getInitialDepositStatusModel = GetInitialDepositStatusModel();
  GetInitialDepositStatusModel get getInitialDepositStatusModel => _getInitialDepositStatusModel;

  List<GetAllDepositOfflineModel> _getAllDepositOfflineList = [];
  List<GetAllDepositOfflineModel> get getAllDepositOfflineList => _getAllDepositOfflineList;

  GetAllDepositOfflineModel _getAllDepositOfflineModel = GetAllDepositOfflineModel();
  GetAllDepositOfflineModel get getAllDepositOfflineModel => _getAllDepositOfflineModel;

  List _modeDepositList = [];
  List get modeDepositList => _modeDepositList;

  List _custBankNameList = [];
  List get custBankNameList => _custBankNameList;

  List _paymentBankNameList = [];
  List get paymentBankNameList => _paymentBankNameList;

  GetModeOfDepositModel _getModeOfDepositModel = GetModeOfDepositModel();
  GetModeOfDepositModel get getModeOfDepositModel => _getModeOfDepositModel;

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
    _labelModel = GetLabelModel();
    chargeAreaValue = GetChargeAreaListModel();
    areaValue = GetAllAreaModel();
    propertyCategoryValue = GetPropertyCategoryModel();
    propertyClassValue = GetPropertyClassModel();
    allDistrictValue = GetAllDistrictModel();
    depositTypeValue = GetAllDepositOfflineModel();
     interestValue = null;
     conversionPolicyValue = null;
     extraFittingValue = null;
     societyAllowValue = null;
     guardianTypeValue = null;
     residentStatusValue = null;
     existingCookingFuelValue = null;
     kycDoc1Value = null;
     kycDoc2Value = null;
     kycDoc3Value = null;
     preferredBillValue = null;
     custBankNameValue = null;
     paymentBankNameValue = null;
     initialDepositStatusValue = null;
     modeDepositValue = null;
    _getNotInterestedList = [];
    _extraFittingCostList = [];
    _conversionPolicyList = [];
    _societyAllowList = [];
    _getChargeAreaListModel = [];
    _getAllAreaModel = [];
    _getGuardianTypeList = [];
    _getPropertyCategoryModel = [];
    _getPropertyClassModel = [];
    _getAllDistrictModel = [];
    _getResidentStatusList = [];
    _existingCookingFuelList = [];
    _getIdentityProofList = [];
    _getOwnershipProofList = [];
    _getKycDocList = [];
    _eBillingList = [];
    _initialDepositStatusList = [];
    _getAllDepositOfflineList = [];
    _getAllDepositOfflineModel = GetAllDepositOfflineModel();
    _modeDepositList = [];
    _custBankNameList = [];
    _paymentBankNameList = [];
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
    await fetchLabelApi(context: event.context);
    await fetchNotInterestedApi(context: event.context);
    await fetchInitialDepositStatusApi(context: event.context);
    await fetchModeOfDepositApi(context: event.context);
    await fetchAcceptExtraFittingCostApi(context: event.context);
    await fetchAcceptConversionPolicyApi(context: event.context);
    await fetchAllDistrictApi(context: event.context);
    await fetchEBillingApi(context: event.context);
    await fetchKycDocApi(context: event.context);
    await fetchOwnershipProofApi(context: event.context);
    await fetchIdentityProofApi(context: event.context);
    await fetchGuardianTypeApi(context: event.context);
    await fetchExistingCookingFuelApi(context: event.context);
    await fetchResidentStatusApi(context: event.context);
    await fetchSocietyAllowApi(context: event.context);
    await fetchPropertyClassApi(context: event.context);
    await fetchPropertyCategoryApi(context: event.context);
    await fetchAllAreaApi(context: event.context);
    await fetchChargeAreaListApi(context: event.context);
    await fetchAllDepositOfflineApi(context: event.context);
    await fetchBackNameListApi(context: event.context);
    _setLocation();
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
    log("chargeAreaValue==>${chargeAreaValue!.gid.toString()}");
    _eventCompleted(emit);
  }

  _setAreaValue(CustomRegistrationFormSetAreaValue event, emit) {
    areaValue = event.areaValue;
    log("areaValue==>${areaValue!.gid.toString()}");
    _eventCompleted(emit);
  }

  _setGuardianTypeValue(CustomRegistrationFormSetGuardianTypeValue event, emit) {
    guardianTypeValue = event.guardianTypeValue;
    _eventCompleted(emit);
  }

  _setPropertyCategoryValue(CustomRegistrationFormSetPropertyCategoryValue event, emit) {
    propertyCategoryValue = event.propertyCategoryValue;
    // _propertyCategoryValue = _getPropertyCategoryModel.first.toString();
    log("_propertyCategoryValue-->${propertyCategoryValue!.name.toString()}");
    _eventCompleted(emit);
  }

  _setPropertyClassValue(CustomRegistrationFormSetPropertyClassValue event, emit) {
    propertyClassValue = event.propertyClassValue;
    log("propertyClassValue-->${propertyClassValue!.name.toString()}");
    _eventCompleted(emit);
  }

  _setDistrictValue(CustomRegistrationFormSetDistrictValue event, emit) {
    allDistrictValue = event.allDistrictValue;
    log("allDistrictValue-->${allDistrictValue!.districtName.toString()}");
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
    log("initialDepositStatusValue-->$initialDepositStatusValue");
    _eventCompleted(emit);
  }

  _setDepositTypeValue(CustomRegistrationFormSetDepositTypeValue event, emit) {
    depositTypeValue = event.depositTypeValue;
    depositAmountController.text = depositTypeValue!.depositAmount.toString();
    log("_depositTypeValue-->${depositTypeValue.toString()}");
    log("_depositTypeValue-->${depositAmountController.toString()}");
    _eventCompleted(emit);
  }

  _setModeDepositValue(CustomRegistrationFormSetModeDepositValue event, emit) {
    modeDepositValue = event.modeDepositValue;
    log("_modeDepositValueBloc-->${modeDepositValue}");
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


  fetchLabelApi({required BuildContext context}) async {
    var res = await DashboardHelper.getLabelApi(context: context);
    if (res != null) {
      _labelModel = res;
    }
  }

  fetchNotInterestedApi({required BuildContext context}) async {
    var res = await DashboardHelper.getNotInterestedApi(context: context);
    if (res != null) {
      _getNotInterestedModel = res;
      _getNotInterestedList = res.toJson().values.toList();
    }
  }

  fetchAcceptConversionPolicyApi({required BuildContext context}) async {
    var res = await DashboardHelper.getAcceptConversionPolicyApi(context: context);
    if (res != null) {
      _getAcceptConversionPolicyModel = res;
      _conversionPolicyList = res.toJson().values.toList();
      conversionPolicyValue = _conversionPolicyList.first.toString();
    }
  }

  fetchAcceptExtraFittingCostApi({required BuildContext context}) async {
    var res = await DashboardHelper.getAcceptExtraFittingCostApi(context: context);
    if (res != null) {
      _getAcceptExtraFittingCostModel = res;
      _extraFittingCostList = res.toJson().values.toList();
      extraFittingValue = _extraFittingCostList.first.toString();
    }
  }

  fetchSocietyAllowApi({required BuildContext context}) async {
    var res = await DashboardHelper.getSocietyAllowApi(context: context);
    if (res != null) {
      _getSocietyAllowModel = res;
      _societyAllowList = res.toJson().values.toList();
      societyAllowValue = _societyAllowList.last.toString();
    }
  }

  fetchChargeAreaListApi({required BuildContext context}) async {
    var chargeAreaListRes = await DashboardHelper.getChargeAreaListApi(context: context);
    if (chargeAreaListRes != null) {
     // _getChargeAreaListModel = chargeAreaListRes;
    }
  }

  fetchBackNameListApi({required BuildContext context}) async {
    var bankNameListRes = await DashboardHelper.getBankNameListApi(context: context);
    if (bankNameListRes != null) {
      _custBankNameList = bankNameListRes;
      _paymentBankNameList = bankNameListRes;
    }
  }

  fetchAllAreaApi({required BuildContext context}) async {
    var allAreaRes = await DashboardHelper.getAllAreaApi(context: context);
    if (allAreaRes != null) {
   //   _getAllAreaModel = allAreaRes;
    }
  }

  fetchGuardianTypeApi({required BuildContext context}) async {
    var res = await DashboardHelper.getGuardianTypeApi(context: context);
    if (res != null) {
      _getGuardianTypeModel = res;
      _getGuardianTypeList = res.toJson().values.toList();
      guardianTypeValue = _getGuardianTypeList.first.toString();
    }
  }

  fetchPropertyCategoryApi({required BuildContext context}) async {
    var res = await DashboardHelper.getPropertyCategoryApi(context: context);
    if (res != null) {
    //  _getPropertyCategoryModel = res;
    }
  }

  Future<List<GetPropertyClassModel>?> fetchPropertyClassApi({required BuildContext context}) async {
    var res = await DashboardHelper.getPropertyClassApi(context: context);
    if (res != null) {
    //  _getPropertyClassModel = res;
      //  _propertyClassValue = _getPropertyClassModel.first.toString();
    }
    return null;
  }

  fetchAllDistrictApi({required BuildContext context}) async {
    var res = await DashboardHelper.getAllDistrictModelApi(context: context);
    if (res != null) {
    //  _getAllDistrictModel = res!;
    }
  }

  fetchResidentStatusApi({required BuildContext context}) async {
    var res = await DashboardHelper.getResidentStatusApi(context: context);
    if (res != null) {
      _getResidentStatusModel = res;
      _getResidentStatusList = res.toJson().values.toList();
      residentStatusValue = _getResidentStatusList.first.toString();
    }
  }

  fetchIdentityProofApi({required BuildContext context}) async {
    var res = await DashboardHelper.getIdentityProofApi(context: context);
    if (res != null) {
      _getIdentityProofModel = res;
      _getIdentityProofList = res.toJson().values.toList();
      kycDoc1Value = _getIdentityProofList.first.toString();
    }
  }

  fetchOwnershipProofApi({required BuildContext context}) async {
    var res = await DashboardHelper.getOwnershipProofApi(context: context);
    if (res != null) {
      _getOwnershipProofModel = res;
      _getOwnershipProofList = res.toJson().values.toList();
      kycDoc2Value = _getOwnershipProofList.first.toString();
    }
  }

  fetchKycDocApi({required BuildContext context}) async {
    var res = await DashboardHelper.getKycDocApi(context: context);
    if (res != null) {
      _getKycDocModel = res;
      _getKycDocList = res.toJson().values.toList();
      kycDoc3Value = _getKycDocList.first.toString();
    }
  }

  fetchExistingCookingFuelApi({required BuildContext context}) async {
    var res = await DashboardHelper.getExistingCookingFuelApi(context: context);
    if (res != null) {
      _getExistingCookingFuelModel = res;
      _existingCookingFuelList = res.toJson().values.toList();
      existingCookingFuelValue = _existingCookingFuelList.first.toString();
    }
  }

  fetchEBillingApi({required BuildContext context}) async {
    var res = await DashboardHelper.getEBillingApi(context: context);
    if (res != null) {
      _getEBillingModel = res;
      _eBillingList = res.toJson().values.toList();
      _eBillingList.sort();
      preferredBillValue = _eBillingList.last..toString();
    }
  }

  fetchInitialDepositStatusApi({required BuildContext context}) async {
    var res = await DashboardHelper.getInitialDepositStatusApi(context: context);
    if (res != null) {
      _getInitialDepositStatusModel = res;
      _initialDepositStatusList = res.toJson().values.toList();
      _initialDepositStatusList.sort();
      initialDepositStatusValue = _initialDepositStatusList.last.toString();
    }
  }

  fetchAllDepositOfflineApi({required BuildContext context}) async {
    var res = await DashboardHelper.getAllDepositOfflineApi(context: context);
    if (res != null) {
     // _getAllDepositOfflineList = res;
    }
  }

  fetchModeOfDepositApi({required BuildContext context}) async {
    var res = await DashboardHelper.getModeOfDepositApi(context: context);
    if (res != null) {
      _getModeOfDepositModel = res;
      _modeDepositList = res.toJson().values.toList();
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
      registrationType: interestValue,
      reasonRegistration: reasonRegistrationController.text.toString(),
      chargeId: chargeAreaValue!.chargeAreaName.toString(),
      areaId: areaValue!.areaName,
      mobileNumber: mobileController.text.trim().toString(),
      altMobileNo: altMobileController.text.trim().toString(),
      firstName: firstController.text.trim().toString(),
      middleName: middleController.text.trim().toString(),
      lastName: lastController.text.trim().toString(),
      guardianType: guardianTypeValue,
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
      existingCookingFuel: existingCookingFuelValue,
      noOfFamilyMembers: familyMemberController.text.trim().toString(),
      latitude: latController.text.trim().toString(),
      longitude: longController.text.trim().toString(),
      nearestLandmark: nearestLandmarkController.text.trim().toString(),
      idProof: kycDoc1Value.toString(),
      idProofNo: kyc1NumberController.text.trim().toString(),
      idFrontPath: idFrontPath.path,
      idBackPath: idBackPath.path.toString(),
      addProof: kycDoc2Value.toString(),
      addProofNo: kyc2NumberController.text.trim().toString(),
      addFrontPath: addFrontPath.path.toString(),
      addBackPath: addBackPath.path.toString(),
      ownershipProperty: kycDoc3Value.toString(),
      ownerConsent: ownerConsentPath.path.toString(),
      housePath: uploadHousePath.path.toString(),
      customerPath: uploadCustomerPath.path.toString(),
      nocDocPath: nocDocPath.path.toString(),
      acceptConversionPolicy: conversionPolicyValue.toString(),
      acceptExtraFittingCost: extraFittingValue.toString(),
      societyAllowedMdpe: societyAllowValue.toString(),
      depositStatus: initialDepositStatusValue.toString(),
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
      eBillingModel:preferredBillValue.toString(),
      residentStatus: residentStatusValue.toString(),

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
      labelModel: labelModel,
      interestValue: interestValue,
      getNotInterestedList: getNotInterestedList,
      conversionPolicyValue: conversionPolicyValue,
      conversionPolicyList: conversionPolicyList,
      extraFittingValue: extraFittingValue,
      extraFittingCostList: extraFittingCostList,
      societyAllowValue: societyAllowValue,
      societyAllowList: societyAllowList,
      getNotInterestedModel: getNotInterestedModel,
      getAcceptConversionPolicyModel: getAcceptConversionPolicyModel,
      getAcceptExtraFittingCostModel: getAcceptExtraFittingCostModel,
      getSocietyAllowModel: getSocietyAllowModel,
      chargeAreaValue: chargeAreaValue,
      getChargeAreaListModel: getChargeAreaListModel,
      areaValue: areaValue,
      getAllAreaModel: getAllAreaModel,
      guardianTypeValue: guardianTypeValue,
      getGuardianTypeList: getGuardianTypeList,
      propertyCategoryValue: propertyCategoryValue,
      propertyClassValue: propertyClassValue,
      identityProofValue: kycDoc1Value,
      identityProofList: getIdentityProofList,
      getIdentityProofModel: getIdentityProofModel,
      ownershipProofValue: kycDoc2Value,
      ownershipProofList: getOwnershipProofList,
      getOwnershipProofModel: getOwnershipProofModel,
      kycDoc3Value: kycDoc3Value,
      kycDocList: getKycDocList,
      getKycDocModel: getKycDocModel,
      getGuardianTypeModel: getGuardianTypeModel,
      existingCookingFuelValue: existingCookingFuelValue,
      existingCookingFuelList: existingCookingFuelList,
      getExistingCookingFuelModel: getExistingCookingFuelModel,
      residentStatusValue: residentStatusValue,
      getResidentStatusList: getResidentStatusList,
      getResidentStatusModel: getResidentStatusModel,
      getPropertyClassModel: getPropertyClassModel,
      getPropertyCategoryModel: getPropertyCategoryModel,
      eBillingValue: preferredBillValue,
      eBillingList: eBillingList,
      getEBillingModel: getEBillingModel,
      initialDepositStatusValue: initialDepositStatusValue,
      initialDepositStatusList: initialDepositStatusList,
      depositOfflineValue: depositTypeValue,
      getAllDepositOfflineModel: getAllDepositOfflineModel,
      getAllDepositOfflineList: getAllDepositOfflineList,
      modeDepositValue: modeDepositValue,
      modeDepositList: modeDepositList,
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
      getAllDistrictModel: getAllDistrictModel,
      latitudeController: latController,
      longitudeController: longController,
      chequeNoController: chequeNoController,
      chequeDateController: chequeDateController,
      chequeAccountNoController: chequeAccountNoController,
      chequeMicrNoController: chequeMicrNoController,
      custBankNameValue: custBankNameValue,
      paymentBankNameValue: paymentBankNameValue,
      custBankNameList: custBankNameList,
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
