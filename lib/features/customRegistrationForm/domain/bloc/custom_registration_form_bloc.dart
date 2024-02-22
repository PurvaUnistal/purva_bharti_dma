import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/customRegistrationForm/domain/model/save_customer_registration_model.dart';


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
    on<CustomRegistrationFormSetIdFrontFilePath>(_setIdFrontFilePath);
    on<CustomRegistrationFormSetIdBackFilePath>(_setIdBackFilePath);
    on<CustomRegistrationFormSetEleBillFrontPath>(_setEleBillFrontPath);
    on<CustomRegistrationFormSetEleBillBackPath>(_setEleBillBackPath);
    on<CustomRegistrationFormSetNocFrontPath>(_setNocFrontPath);
    on<CustomRegistrationFormSetNocBackPath>(_setNocBackPath);
    on<CustomRegistrationFormSetUploadCustomerPath>(_setUploadCustomerPath);
    on<CustomRegistrationFormSetUploadHousePath>(_setUploadHousePath);
    on<CustomRegistrationFormSetCustomerConsentPath>(_setCustomerConsentPath);
    on<CustomRegistrationFormSetOwnerConsentPath>(_setOwnerConsentPath);
    on<CustomRegistrationFormSetCancelChequePath>(_setCancelChequePath);
    on<CustomRegistrationFormSetChequePath>(_setChequePath);
    on<CustomRegistrationFormSetChequeDateEvent>(_setChequeDate);
    on<CustomRegistrationFormPreviewPageEvent>(_previewPage);
    on<CustomRegistrationFormSaveLocalDataEvent>(_saveLocalData);
  }
  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isPreviewLoader = false;
  bool get isPreviewLoader => _isPreviewLoader;

  bool _isSaveLoader = false;
  bool get isSaveLoader => _isSaveLoader;

  dynamic _interestValue;
  dynamic get interestValue => _interestValue;

  dynamic _conversionPolicyValue;
  dynamic get conversionPolicyValue => _conversionPolicyValue;

  dynamic _extraFittingValue;
  dynamic get extraFittingValue => _extraFittingValue;

  dynamic _societyAllowValue;
  dynamic get societyAllowValue => _societyAllowValue;

  GetChargeAreaListModel? chargeAreaValue;
  GetAllAreaModel? areaValue;
  GetPropertyCategoryModel? propertyCategoryValue;
  GetPropertyClassModel? propertyClassValue;
  GetAllDistrictModel? allDistrictValue;
  GetAllDepositOfflineModel? depositTypeValue;

  dynamic _guardianTypeValue;
  dynamic get guardianTypeValue => _guardianTypeValue;

  dynamic _residentStatusValue;
  dynamic get residentStatusValue => _residentStatusValue;

  dynamic _existingCookingFuelValue;
  dynamic get existingCookingFuelValue => _existingCookingFuelValue;

  dynamic _kycDoc1Value;
  dynamic get kycDoc1Value => _kycDoc1Value;

  dynamic _kycDoc2Value;
  dynamic get kycDoc2Value => _kycDoc2Value;

  dynamic _kycDoc3Value;
  dynamic get kycDoc3Value => _kycDoc3Value;

  dynamic _preferredBillValue;
  dynamic get preferredBillValue => _preferredBillValue;

  dynamic _custBankNameValue;
  dynamic get custBankNameValue => _custBankNameValue;

  dynamic _paymentBankNameValue;
  dynamic get paymentBankNameValue => _paymentBankNameValue;

  dynamic _initialDepositStatusValue;
  dynamic get initialDepositStatusValue => _initialDepositStatusValue;



  /* dynamic _depositTypeValue;
  dynamic get depositTypeValue => _depositTypeValue;*/

  dynamic _modeDepositValue;
  dynamic get modeDepositValue => _modeDepositValue;

  String _idFrontPhotoImage = "";
  String get idFrontPhotoImage => _idFrontPhotoImage;

  String _idBackPhotoImage ="";
  String get idBackPhotoImage => _idBackPhotoImage;

  String _eleBillFrontPath = "";
  String get eleBillFrontPath => _eleBillFrontPath;

  String _eleBillBackPath = "";
  String get eleBillBackPath => _eleBillBackPath;

  String _nocFrontPath = "";
  String get nocFrontPath => _nocFrontPath;

  String _nocBackPath = "";
  String get nocBackPath => _nocBackPath;

  String _uploadCustomerPath = "";
  String get uploadCustomerPath => _uploadCustomerPath;

  String _uploadHousePath = "";
  String get uploadHousePath => _uploadHousePath;

  String _ownerConsentPath = "";
  String get ownerConsentPath => _ownerConsentPath;

  String _customerConsentPath = "";
  String get customerConsentPath => _customerConsentPath;

  String _cancelChequePath = "";
  String get cancelChequePath => _cancelChequePath;

  String _chequePath = "";
  String get chequePath => _chequePath;

  SaveCusRegData _saveCusRegData = SaveCusRegData();
  SaveCusRegData get saveCusRegData => _saveCusRegData;

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController middleController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController buildingNumberController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController colonyController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController townController = TextEditingController();
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
  TextEditingController depositAmountController = TextEditingController();
  final TextEditingController chequeNoController = TextEditingController();
  final TextEditingController chequeDateController = TextEditingController();
  final TextEditingController chequeAccountNoController = TextEditingController();
  final TextEditingController chequeMicrNoController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();

  GetLabelModel _labelModel = GetLabelModel();
  GetLabelModel get labelModel => _labelModel;

  List<dynamic> _getNotInterestedList = [];
  List<dynamic> get getNotInterestedList => _getNotInterestedList;
  GetNotInterestedModel _getNotInterestedModel = GetNotInterestedModel();
  GetNotInterestedModel get getNotInterestedModel => _getNotInterestedModel;

  List<dynamic> _conversionPolicyList = [];
  List<dynamic> get conversionPolicyList => _conversionPolicyList;
  GetAcceptConversionPolicyModel _getAcceptConversionPolicyModel = GetAcceptConversionPolicyModel();
  GetAcceptConversionPolicyModel get getAcceptConversionPolicyModel => _getAcceptConversionPolicyModel;

  List<dynamic> _extraFittingCostList = [];
  List<dynamic> get extraFittingCostList => _extraFittingCostList;
  GetAcceptExtraFittingCostModel _getAcceptExtraFittingCostModel = GetAcceptExtraFittingCostModel();
  GetAcceptExtraFittingCostModel get getAcceptExtraFittingCostModel => _getAcceptExtraFittingCostModel;

  List<GetAllDistrictModel> _getAllDistrictModel = [];
  List<GetAllDistrictModel> get getAllDistrictModel => _getAllDistrictModel;

  List<dynamic> _societyAllowList = [];
  List<dynamic> get societyAllowList => _societyAllowList;
  GetSocietyAllowModel _getSocietyAllowModel = GetSocietyAllowModel();
  GetSocietyAllowModel get getSocietyAllowModel => _getSocietyAllowModel;

  List<dynamic> _getIdentityProofList = [];
  List<dynamic> get getIdentityProofList => _getIdentityProofList;
  GetIdentityProofModel _getIdentityProofModel = GetIdentityProofModel();
  GetIdentityProofModel get getIdentityProofModel => _getIdentityProofModel;

  List<dynamic> _getOwnershipProofList = [];
  List<dynamic> get getOwnershipProofList => _getOwnershipProofList;
  GetOwnershipProofModel _getOwnershipProofModel = GetOwnershipProofModel();
  GetOwnershipProofModel get getOwnershipProofModel => _getOwnershipProofModel;

  List<dynamic> _getKycDocList = [];
  List<dynamic> get getKycDocList => _getKycDocList;
  GetKycDocModel _getKycDocModel = GetKycDocModel();
  GetKycDocModel get getKycDocModel => _getKycDocModel;

  List<dynamic> _getGuardianTypeList = [];
  List<dynamic> get getGuardianTypeList => _getGuardianTypeList;

  GetGuardianTypeModel _getGuardianTypeModel = GetGuardianTypeModel();
  GetGuardianTypeModel get getGuardianTypeModel => _getGuardianTypeModel;

  List<dynamic> _existingCookingFuelList = [];
  List<dynamic> get existingCookingFuelList => _existingCookingFuelList;
  GetExistingCookingFuelModel _getExistingCookingFuelModel = GetExistingCookingFuelModel();
  GetExistingCookingFuelModel get getExistingCookingFuelModel => _getExistingCookingFuelModel;

  List<dynamic> _getResidentStatusList = [];
  List<dynamic> get getResidentStatusList => _getResidentStatusList;
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

  List<dynamic> _eBillingList = [];
  List<dynamic> get eBillingList => _eBillingList;

  GetEBillingModel _getEBillingModel = GetEBillingModel();
  GetEBillingModel get getEBillingModel => _getEBillingModel;

  List<dynamic> _initialDepositStatusList = [];
  List<dynamic> get initialDepositStatusList => _initialDepositStatusList;

  GetInitialDepositStatusModel _getInitialDepositStatusModel = GetInitialDepositStatusModel();
  GetInitialDepositStatusModel get getInitialDepositStatusModel => _getInitialDepositStatusModel;

  List<GetAllDepositOfflineModel> _getAllDepositOfflineModel = [];
  List<GetAllDepositOfflineModel> get getAllDepositOfflineModel => _getAllDepositOfflineModel;

  List<dynamic> _modeDepositList = [];
  List<dynamic> get modeDepositList => _modeDepositList;

  List<String> _custBankNameList = [];
  List<String> get custBankNameList => _custBankNameList;

  List<String> _paymentBankNameList = [];
  List<String> get paymentBankNameList => _paymentBankNameList;

  GetModeOfDepositModel _getModeOfDepositModel = GetModeOfDepositModel();
  GetModeOfDepositModel get getModeOfDepositModel => _getModeOfDepositModel;



  _pageLoad(CustomRegistrationFormPageLoadEvent event, emit) async {
    emit(CustomRegistrationFormPageLoadState());
    _isPageLoader = false;
    _labelModel = GetLabelModel();
    chargeAreaValue = GetChargeAreaListModel();
    areaValue = GetAllAreaModel();
    propertyCategoryValue = GetPropertyCategoryModel();
    propertyClassValue = GetPropertyClassModel();
    allDistrictValue = GetAllDistrictModel();
    depositTypeValue = GetAllDepositOfflineModel();
    _paymentBankNameValue = null;
    _custBankNameValue = null;
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
    _getAllDepositOfflineModel = [];
    _modeDepositList = [];
    _custBankNameList = [];
    _paymentBankNameList = [];
    _idBackPhotoImage = "";
    _idFrontPhotoImage = "";
    _eleBillFrontPath = "";
    _eleBillBackPath = "";
    _nocFrontPath = "";
    _nocBackPath = "";
    _uploadCustomerPath = "";
    _uploadHousePath = "";
    _ownerConsentPath = "";
    _customerConsentPath = "";
    _cancelChequePath = "";
    _chequePath = "";
     fetchLabelApi(context: event.context);
     fetchNotInterestedApi(context: event.context);
     fetchInitialDepositStatusApi(context: event.context);
     fetchModeOfDepositApi(context: event.context);
     fetchAcceptExtraFittingCostApi(context: event.context);
     fetchAcceptConversionPolicyApi(context: event.context);
     fetchAllDistrictApi(context: event.context);
     fetchEBillingApi(context: event.context);
     fetchKycDocApi(context: event.context);
     fetchOwnershipProofApi(context: event.context);
     fetchIdentityProofApi(context: event.context);
     fetchGuardianTypeApi(context: event.context);
     fetchExistingCookingFuelApi(context: event.context);
     fetchResidentStatusApi(context: event.context);
     fetchSocietyAllowApi(context: event.context);
     fetchPropertyClassApi(context: event.context);
     fetchPropertyCategoryApi(context: event.context);
     fetchAllAreaApi(context: event.context);
     fetchChargeAreaListApi(context: event.context);
     fetchAllDepositOfflineApi(context: event.context);
     fetchBackNameListApi(context: event.context);
    _setLocation();
    _eventCompleted(emit);
  }



  _setInterestValue(CustomRegistrationFormSetInterestValue event, emit) {
    _interestValue = event.interestValue;
    _eventCompleted(emit);
  }

  _setConversionPolicyValue(CustomRegistrationFormSetConversionPolicyValue event, emit) {
    _conversionPolicyValue = event.conversionPolicyValue;
    _eventCompleted(emit);
  }

  _setExtraFittingValue(CustomRegistrationFormSetExtraFittingValue event, emit) {
    _extraFittingValue = event.extraFittingValue;
    _eventCompleted(emit);
  }

  _setSocietyAllowValue(CustomRegistrationFormSetSocietyAllowValue event, emit) {
    _societyAllowValue = event.societyAllowValue;
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
    _guardianTypeValue = event.guardianTypeValue;
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
    _residentStatusValue = event.residentStatusValue;
    _eventCompleted(emit);
  }

  _setExistingCookingFuelValue(CustomRegistrationFormSetExistingCookingFuelValue event, emit) {
    _existingCookingFuelValue = event.existingCookingFuelValue;
    _eventCompleted(emit);
  }

  _setKycDoc1Value(CustomRegistrationFormSetKycDoc1Value event, emit) {
    _kycDoc1Value = event.kycDoc1Value;
    _eventCompleted(emit);
  }

  _setKycDoc2Value(CustomRegistrationFormSetKycDoc2Value event, emit) {
    _kycDoc2Value = event.kycDoc2Value;
    _eventCompleted(emit);
  }

  _setKycDoc3Value(CustomRegistrationFormSetKycDoc3Value event, emit) {
    _kycDoc3Value = event.kycDoc3Value;
    _eventCompleted(emit);
  }

  _setPreferredBillValue(CustomRegistrationFormSetPreferredBillValue event, emit) {
    _preferredBillValue = event.preferredBillValue;
    _eventCompleted(emit);
  }

  _setCustBankNameValue(CustomRegistrationFormSetCustBankNameValue event, emit) {
    _custBankNameValue = event.custBankNameValue;
    _eventCompleted(emit);
  }

  _setPaymentBankNameValue(CustomRegistrationFormSetPaymentBankNameValue event, emit) {
    _paymentBankNameValue = event.paymentBankNameValue;
    _eventCompleted(emit);
  }

  _setInitialDepositStatusValue(CustomRegistrationFormSetInitialDepositStatusValue event, emit) {
    _initialDepositStatusValue = event.initialDepositStatusValue;
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
    _modeDepositValue = event.modeDepositValue;
    _eventCompleted(emit);
  }

  _setIdFrontFilePath(CustomRegistrationFormSetIdFrontFilePath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.idFrontFilePath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _idFrontPhotoImage = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.idFrontFilePath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _idFrontPhotoImage = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setIdBackFilePath(CustomRegistrationFormSetIdBackFilePath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.idBackFilePath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _idBackPhotoImage = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.idBackFilePath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _idBackPhotoImage = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setEleBillFrontPath(CustomRegistrationFormSetEleBillFrontPath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.eleBillFrontPath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _eleBillFrontPath = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.eleBillFrontPath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _eleBillFrontPath = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setEleBillBackPath(CustomRegistrationFormSetEleBillBackPath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.eleBillBackPath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _eleBillBackPath = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.eleBillBackPath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _eleBillBackPath = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setNocFrontPath(CustomRegistrationFormSetNocFrontPath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.nocFrontPath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _nocFrontPath =tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.nocFrontPath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _nocFrontPath = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setNocBackPath(CustomRegistrationFormSetNocBackPath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.nocBackPath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _nocBackPath = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.nocBackPath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _nocBackPath = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setUploadCustomerPath(CustomRegistrationFormSetUploadCustomerPath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.uploadCustomerPath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _uploadCustomerPath = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.uploadCustomerPath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _uploadCustomerPath = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setUploadHousePath(CustomRegistrationFormSetUploadHousePath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.uploadHousePath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _uploadHousePath = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.uploadHousePath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _uploadHousePath = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setCustomerConsentPath(CustomRegistrationFormSetCustomerConsentPath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.customerConsentPath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _customerConsentPath = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.customerConsentPath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _customerConsentPath = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setOwnerConsentPath(CustomRegistrationFormSetOwnerConsentPath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.ownerConsentPath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _ownerConsentPath = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.ownerConsentPath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _ownerConsentPath = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setCancelChequePath(CustomRegistrationFormSetCancelChequePath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.cancelChequePath);
              if (tempCameraImage != null && tempCameraImage.isNotEmpty) {
                _cancelChequePath = tempCameraImage;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.cancelChequePath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _cancelChequePath = tempGalleryImage;
              }
            },
          );
        });
    _eventCompleted(emit);
  }

  _setChequePath(CustomRegistrationFormSetChequePath event, emit) {
    showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) {
          return OpenImageSource(
            onTapCamera: () async {
              Navigator.of(context).pop();
              var tempCameraImage = await DashboardHelper.cameraPiker(context: event.context, cameraImage: event.chequePath);
              if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
                _chequePath = tempCameraImage.path;
              }
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              var tempGalleryImage = await DashboardHelper.galleryPiker(context: event.context, galleryImage: event.chequePath);
              if (tempGalleryImage != null && tempGalleryImage.isNotEmpty) {
                _chequePath = tempGalleryImage;
              }
            },
          );
        });
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
      _conversionPolicyValue = _conversionPolicyList.first.toString();
    }
  }

  fetchAcceptExtraFittingCostApi({required BuildContext context}) async {
    var res = await DashboardHelper.getAcceptExtraFittingCostApi(context: context);
    if (res != null) {
      _getAcceptExtraFittingCostModel = res;
      _extraFittingCostList = res.toJson().values.toList();
      _extraFittingValue = _extraFittingCostList.first.toString();
    }
  }

  fetchSocietyAllowApi({required BuildContext context}) async {
    var res = await DashboardHelper.getSocietyAllowApi(context: context);
    if (res != null) {
      _getSocietyAllowModel = res;
      _societyAllowList = res.toJson().values.toList();
      _societyAllowValue = _societyAllowList.last.toString();
    }
  }

  fetchChargeAreaListApi({required BuildContext context}) async {
    var chargeAreaListRes = await DashboardHelper.getChargeAreaListApi(context: context);
    if (chargeAreaListRes != null) {
      _getChargeAreaListModel = chargeAreaListRes;
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
      _getAllAreaModel = allAreaRes;
    }
  }

  fetchGuardianTypeApi({required BuildContext context}) async {
    var res = await DashboardHelper.getGuardianTypeApi(context: context);
    if (res != null) {
      _getGuardianTypeModel = res;
      _getGuardianTypeList = res.toJson().values.toList();
      _guardianTypeValue = _getGuardianTypeList.first.toString();
    }
  }

  fetchPropertyCategoryApi({required BuildContext context}) async {
    var res = await DashboardHelper.getPropertyCategoryApi(context: context);
    if (res != null) {
      _getPropertyCategoryModel = res;
    }
  }

  Future<List<GetPropertyClassModel>?> fetchPropertyClassApi({required BuildContext context}) async {
    var res = await DashboardHelper.getPropertyClassApi(context: context);
    if (res != null) {
      _getPropertyClassModel = res;
      //  _propertyClassValue = _getPropertyClassModel.first.toString();
    }
    return null;
  }

  fetchAllDistrictApi({required BuildContext context}) async {
    var res = await DashboardHelper.getAllDistrictModelApi(context: context);
    if (res != null) {
      _getAllDistrictModel = res;
    }
  }

  fetchResidentStatusApi({required BuildContext context}) async {
    var res = await DashboardHelper.getResidentStatusApi(context: context);
    if (res != null) {
      _getResidentStatusModel = res;
      _getResidentStatusList = res.toJson().values.toList();
      _residentStatusValue = _getResidentStatusList.first.toString();
    }
  }

  fetchIdentityProofApi({required BuildContext context}) async {
    var res = await DashboardHelper.getIdentityProofApi(context: context);
    if (res != null) {
      _getIdentityProofModel = res;
      _getIdentityProofList = res.toJson().values.toList();
      _kycDoc1Value = _getIdentityProofList.first.toString();
    }
  }

  fetchOwnershipProofApi({required BuildContext context}) async {
    var res = await DashboardHelper.getOwnershipProofApi(context: context);
    if (res != null) {
      _getOwnershipProofModel = res;
      _getOwnershipProofList = res.toJson().values.toList();
      _kycDoc2Value = _getOwnershipProofList.first.toString();
    }
  }

  fetchKycDocApi({required BuildContext context}) async {
    var res = await DashboardHelper.getKycDocApi(context: context);
    if (res != null) {
      _getKycDocModel = res;
      _getKycDocList = res.toJson().values.toList();
      _kycDoc3Value = _getKycDocList.first.toString();
    }
  }

  fetchExistingCookingFuelApi({required BuildContext context}) async {
    var res = await DashboardHelper.getExistingCookingFuelApi(context: context);
    if (res != null) {
      _getExistingCookingFuelModel = res;
      _existingCookingFuelList = res.toJson().values.toList();
      _existingCookingFuelValue = _existingCookingFuelList.first.toString();
    }
  }

  fetchEBillingApi({required BuildContext context}) async {
    var res = await DashboardHelper.getEBillingApi(context: context);
    if (res != null) {
      _getEBillingModel = res;
      _eBillingList = res.toJson().values.toList();
      _eBillingList.sort();
      _preferredBillValue = _eBillingList.last..toString();
    }
  }

  fetchInitialDepositStatusApi({required BuildContext context}) async {
    var res = await DashboardHelper.getInitialDepositStatusApi(context: context);
    if (res != null) {
      _getInitialDepositStatusModel = res;
      _initialDepositStatusList = res.toJson().values.toList();
      _initialDepositStatusList.sort();
      _initialDepositStatusValue = _initialDepositStatusList.last.toString();
    }
  }

  fetchAllDepositOfflineApi({required BuildContext context}) async {
    var res = await DashboardHelper.getAllDepositOfflineApi(context: context);
    if (res != null) {
      _getAllDepositOfflineModel = res;
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
    _isPreviewLoader = true;
    _eventCompleted(emit);
    var textFiledValidationCheck = await CustomRegistrationFormHelper.textFieldValidationCheck(
      context: event.context,
      interested: _interestValue.toString(),
      acceptConversionPolicy: conversionPolicyValue.toString(),
      acceptExtraFittingCost: extraFittingValue.toString(),
      societyAllowedMdpe: societyAllowValue.toString(),
      chargeId: chargeAreaValue!.gid.toString(),
      areaId: areaValue!.gid.toString(),
      mobileNumber: mobileController.text.trim().toString(),
      firstName: firstController.text.trim().toString(),
      middleName: middleController.text.trim().toString(),
      lastName: lastController.text.trim().toString(),
      guardianType: guardianTypeValue.toString(),
      guardianName: guardianNameController.text.trim().toString(),
      propertyCategoryId: propertyCategoryValue!.id.toString(),
      propertyClassId: propertyClassValue!.id.toString(),
      buildingNumber: buildingNumberController.text.trim().toString(),
      houseNumber: houseNumberController.text.trim().toString(),
      colonySocietyApartment: colonyController.text.trim().toString(),
      streetName: streetController.text.trim().toString(),
      town: townController.text.trim().toString(),
      districtId: allDistrictValue.toString(),
      pinCode: pinCodeController.text.toString(),
      noOfKitchen: numberKitchenController.text.toString(),
      noOfBathroom: numberBathroomController.text.toString(),
      existingCookingFuel: existingCookingFuelValue.toString(),
      noOfFamilyMembers: familyMemberController.text.trim().toString(),
      latitude: latController.text.trim().toString(),
      longitude: longController.text.trim().toString(),
      nearestLandmark: nearestLandmarkController.text.trim().toString(),
      kycDocument1: kycDoc1Value.toString(),
      kycDocument1Number: kyc1NumberController.text.trim().toString(),
      documentUploads1: idFrontPhotoImage.toString(),
      backside1: idBackPhotoImage.toString(),
      ownerConsent: ownerConsentPath.toString(),
      modeOfDeposite: modeDepositValue.toString(),
      depositType: depositTypeValue.toString(),
      chequeNumber: chequeNoController.text.trim().toString(),
      chequeDepositDate: chequeDateController.text.trim().toString(),
      payementBankName: paymentBankNameValue.toString(),
      chequeBankAccount: chequeAccountNoController.text.trim().toString(),
      chequeMicrNo: chequeMicrNoController.text.trim().toString(),
      chequePhoto: chequePath.toString(),
      residentStatus: residentStatusValue.toString(),
      depositTypeAmount: depositAmountController.text.trim().toString(),
      initialDepositeStatus: initialDepositStatusValue.toString(),
    );
    _isPreviewLoader = false;
    _eventCompleted(emit);
    if (textFiledValidationCheck != null) {
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
    var res = await CustomRegistrationFormHelper.AddCustomerFormInLocalDatabase(context: event.context, saveCusRegData: saveCusRegData);
    log("resAddCustomerFormInLocalDatabase==>${res.toString()}");
    if (res != null) {
      log('Great Success! \n Record Save');
      Navigator.pushReplacementNamed(event.context, RoutesName.viewSyncRecordPage);
      var tempDir = await getTemporaryDirectory();
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    }
    _isSaveLoader = false;
    _eventCompleted(emit);
  }

  _eventCompleted(Emitter<CustomRegistrationFormState> emit) {
    emit(CustomRegistrationFormGetAllDataState(
      isPageLoader : isPageLoader,
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
      kycDocValue: kycDoc3Value,
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
      modeDepositValue: modeDepositValue,
      modeDepositList: modeDepositList,
      getInitialDepositStatusModel: getInitialDepositStatusModel,
      getModeOfDepositModel: getModeOfDepositModel,
      mobileController: mobileController,
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
      idBackFilePath: idBackPhotoImage,
      idFrontFilePath: idFrontPhotoImage,
      eleBillFrontPath: eleBillFrontPath,
      eleBillBackPath: eleBillBackPath,
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
