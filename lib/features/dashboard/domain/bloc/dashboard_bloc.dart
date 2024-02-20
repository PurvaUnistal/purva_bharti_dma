// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hpcl_app/ExportFile/export_file.dart';
// import 'package:hpcl_app/features/dashboard/domain/bloc/dashboard_event.dart';
// import 'package:hpcl_app/features/dashboard/domain/bloc/dashboard_state.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_accept_conversion_policy_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_accept_extra_fitting_cost_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_all_area_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_all_deposit_offline_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_all_district_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_charge_area_list_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_ebilling_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_existing_cooking_fuel_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_guardian_type_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_identity_proof_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_initial_deposit_status_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_kyc_doc_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_label_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_mode_of_deposit_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_not_interested_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_ownership_proof_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_property_category_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_property_class_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_resident_status_model.dart';
// import 'package:hpcl_app/features/dashboard/domain/model/get_society_allow_model.dart';
// import 'package:hpcl_app/features/dashboard/helper/dashboard_helper.dart';
// import 'package:intl/intl.dart';
//
// class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
//   DashboardBloc() : super(DashboardInitState()) {
//     on<DashboardPageLoadingEvent>(_pageLoadEvent);
//     on<DashboardSetInterestValue>(_setInterestValue);
//     on<DashboardSetConversionPolicyValue>(_setConversionPolicyValue);
//     on<DashboardSetExtraFittingValue>(_setExtraFittingValue);
//     on<DashboardSetSocietyAllowValue>(_setSocietyAllowValue);
//     on<DashboardSetChargeAreaValue>(_setChargeAreaValue);
//     on<DashboardSetAreaValue>(_setAreaValue);
//     on<DashboardSetGuardianTypeValue>(_setGuardianTypeValue);
//     on<DashboardSetPropertyCategoryValue>(_setPropertyCategoryValue);
//     on<DashboardSetPropertyClassValue>(_setPropertyClassValue);
//     on<DashboardSetDistrictValue>(_setDistrictValue);
//     on<DashboardSetResidentStatusValue>(_setResidentStatusValue);
//     on<DashboardSetExistingCookingFuelValue>(_setExistingCookingFuelValue);
//     on<DashboardSetKycDoc1Value>(_setKycDoc1Value);
//     on<DashboardSetKycDoc2Value>(_setKycDoc2Value);
//     on<DashboardSetKycDoc3Value>(_setKycDoc3Value);
//     on<DashboardSetPreferredBillValue>(_setPreferredBillValue);
//     on<DashboardSetCustBankNameValue>(_setCustBankNameValue);
//     on<DashboardSetPaymentBankNameValue>(_setPaymentBankNameValue);
//     on<DashboardSetInitialDepositStatusValue>(_setInitialDepositStatusValue);
//     on<DashboardSetDepositTypeValue>(_setDepositTypeValue);
//     on<DashboardSetModeDepositValue>(_setModeDepositValue);
//     on<DashboardSetIdFrontFilePath>(_setIdFrontFilePath);
//     on<DashboardSetIdBackFilePath>(_setIdBackFilePath);
//     on<DashboardSetEleBillFrontPath>(_setEleBillFrontPath);
//     on<DashboardSetEleBillBackPath>(_setEleBillBackPath);
//     on<DashboardSetNocFrontPath>(_setNocFrontPath);
//     on<DashboardSetNocBackPath>(_setNocBackPath);
//     on<DashboardSetUploadCustomerPath>(_setUploadCustomerPath);
//     on<DashboardSetUploadHousePath>(_setUploadHousePath);
//     on<DashboardSetCustomerConsentPath>(_setCustomerConsentPath);
//     on<DashboardSetOwnerConsentPath>(_setOwnerConsentPath);
//     on<DashboardSetCancelChequePath>(_setCancelChequePath);
//     on<DashboardSetChequePath>(_setChequePath);
//     on<DashboardSetChequeDateEvent>(_setChequeDate);
//   }
//
//   GetLabelModel _getLabelModel = GetLabelModel();
//   GetLabelModel get getLabelModel => _getLabelModel;
//
//   List<dynamic> _getNotInterestedList = [];
//   List<dynamic> get getNotInterestedList => _getNotInterestedList;
//   GetNotInterestedModel _getNotInterestedModel = GetNotInterestedModel();
//   GetNotInterestedModel get getNotInterestedModel => _getNotInterestedModel;
//
//   List<dynamic> _conversionPolicyList = [];
//   List<dynamic> get conversionPolicyList => _conversionPolicyList;
//   GetAcceptConversionPolicyModel _getAcceptConversionPolicyModel =
//       GetAcceptConversionPolicyModel();
//   GetAcceptConversionPolicyModel get getAcceptConversionPolicyModel =>
//       _getAcceptConversionPolicyModel;
//
//   List<dynamic> _extraFittingCostList = [];
//   List<dynamic> get extraFittingCostList => _extraFittingCostList;
//   GetAcceptExtraFittingCostModel _getAcceptExtraFittingCostModel =
//       GetAcceptExtraFittingCostModel();
//   GetAcceptExtraFittingCostModel get getAcceptExtraFittingCostModel =>
//       _getAcceptExtraFittingCostModel;
//
//   List<GetAllDistrictModel> _getAllDistrictModel = [];
//   List<GetAllDistrictModel> get getAllDistrictModel => _getAllDistrictModel;
//
//   List<dynamic> _societyAllowList = [];
//   List<dynamic> get societyAllowList => _societyAllowList;
//   GetSocietyAllowModel _getSocietyAllowModel = GetSocietyAllowModel();
//   GetSocietyAllowModel get getSocietyAllowModel => _getSocietyAllowModel;
//
//   List<dynamic> _getIdentityProofList = [];
//   List<dynamic> get getIdentityProofList => _getIdentityProofList;
//   GetIdentityProofModel _getIdentityProofModel = GetIdentityProofModel();
//   GetIdentityProofModel get getIdentityProofModel => _getIdentityProofModel;
//
//   List<dynamic> _getOwnershipProofList = [];
//   List<dynamic> get getOwnershipProofList => _getOwnershipProofList;
//   GetOwnershipProofModel _getOwnershipProofModel = GetOwnershipProofModel();
//   GetOwnershipProofModel get getOwnershipProofModel => _getOwnershipProofModel;
//
//   List<dynamic> _getKycDocList = [];
//   List<dynamic> get getKycDocList => _getKycDocList;
//   GetKycDocModel _getKycDocModel = GetKycDocModel();
//   GetKycDocModel get getKycDocModel => _getKycDocModel;
//
//   List<dynamic> _getGuardianTypeList = [];
//   List<dynamic> get getGuardianTypeList => _getGuardianTypeList;
//
//   GetGuardianTypeModel _getGuardianTypeModel = GetGuardianTypeModel();
//   GetGuardianTypeModel get getGuardianTypeModel => _getGuardianTypeModel;
//
//   List<dynamic> _existingCookingFuelList = [];
//   List<dynamic> get existingCookingFuelList => _existingCookingFuelList;
//   GetExistingCookingFuelModel _getExistingCookingFuelModel =
//       GetExistingCookingFuelModel();
//   GetExistingCookingFuelModel get getExistingCookingFuelModel =>
//       _getExistingCookingFuelModel;
//
//   List<dynamic> _getResidentStatusList = [];
//   List<dynamic> get getResidentStatusList => _getResidentStatusList;
//   GetResidentStatusModel _getResidentStatusModel = GetResidentStatusModel();
//   GetResidentStatusModel get getResidentStatusModel => _getResidentStatusModel;
//
//   List<GetPropertyCategoryModel> _getPropertyCategoryModel = [];
//   List<GetPropertyCategoryModel> get getPropertyCategoryModel =>
//       _getPropertyCategoryModel;
//
//   List<GetPropertyClassModel> _getPropertyClassModel = [];
//   List<GetPropertyClassModel> get getPropertyClassModel =>
//       _getPropertyClassModel;
//
//   List<GetAllAreaModel> _getAllAreaModel = [];
//   List<GetAllAreaModel> get getAllAreaModel => _getAllAreaModel;
//
//
//
//   List<GetChargeAreaListModel> _getChargeAreaListModel = [];
//   List<GetChargeAreaListModel> get getChargeAreaListModel =>
//       _getChargeAreaListModel;
//
//   List<dynamic> _eBillingList = [];
//   List<dynamic> get eBillingList => _eBillingList;
//   GetEBillingModel _getEBillingModel = GetEBillingModel();
//   GetEBillingModel get getEBillingModel => _getEBillingModel;
//
//   List<dynamic> _initialDepositStatusList = [];
//   List<dynamic> get initialDepositStatusList => _initialDepositStatusList;
//   GetInitialDepositStatusModel _getInitialDepositStatusModel =
//       GetInitialDepositStatusModel();
//   GetInitialDepositStatusModel get getInitialDepositStatusModel =>
//       _getInitialDepositStatusModel;
//
//   List<GetAllDepositOfflineModel> _getAllDepositOfflineModel = [];
//   List<GetAllDepositOfflineModel> get getAllDepositOfflineModel =>
//       _getAllDepositOfflineModel;
//
//   List<dynamic> _modeDepositList = [];
//   List<dynamic> get modeDepositList => _modeDepositList;
//
//
//   List<String> _custBankNameList = [];
//   List<String> get custBankNameList => _custBankNameList;
//
//   List<String> _paymentBankNameList = [];
//   List<String> get paymentBankNameList => _paymentBankNameList;
//
//
//   GetModeOfDepositModel _getModeOfDepositModel = GetModeOfDepositModel();
//   GetModeOfDepositModel get getModeOfDepositModel => _getModeOfDepositModel;
//
//   _pageLoadEvent(DashboardPageLoadingEvent event, emit) async {
//     emit(DashboardPageLoadState());
//     _getLabelModel = GetLabelModel();
//     _paymentBankNameValue = null;
//     _custBankNameValue = null;
//     _getNotInterestedList = [];
//     _extraFittingCostList = [];
//     _conversionPolicyList = [];
//     _societyAllowList = [];
//     _getChargeAreaListModel = [];
//     _getAllAreaModel = [];
//     _getGuardianTypeList = [];
//     _getPropertyCategoryModel = [];
//     _getPropertyClassModel = [];
//     _getAllDistrictModel = [];
//     _getResidentStatusList = [];
//     _existingCookingFuelList = [];
//     _getIdentityProofList = [];
//     _getOwnershipProofList = [];
//     _getKycDocList = [];
//     _eBillingList = [];
//     _initialDepositStatusList = [];
//     _getAllDepositOfflineModel = [];
//     _modeDepositList = [];
//     _custBankNameList = [];
//     _paymentBankNameList = [];
//     _idBackPhotoImage = File("");
//     _idFrontPhotoImage = File("");
//     await fetchLabelApi(context: event.context);
//     await fetchNotInterestedApi(context: event.context);
//     await fetchInitialDepositStatusApi(context: event.context);
//     await fetchModeOfDepositApi(context: event.context);
//     await fetchAcceptExtraFittingCostApi(context: event.context);
//     await fetchAcceptConversionPolicyApi(context: event.context);
//     await fetchAllDistrictApi(context: event.context);
//     await fetchEBillingApi(context: event.context);
//     await fetchKycDocApi(context: event.context);
//     await fetchOwnershipProofApi(context: event.context);
//     await fetchIdentityProofApi(context: event.context);
//     await fetchGuardianTypeApi(context: event.context);
//     await fetchExistingCookingFuelApi(context: event.context);
//     await fetchResidentStatusApi(context: event.context);
//     await fetchSocietyAllowApi(context: event.context);
//     await fetchPropertyClassApi(context: event.context);
//     await fetchPropertyCategoryApi(context: event.context);
//     await fetchAllAreaApi(context: event.context);
//     await fetchChargeAreaListApi(context: event.context);
//     await fetchAllDepositOfflineApi(context: event.context);
//     await fetchBackNameListApi(context: event.context);
//     await _setLocation();
//     _eventCompleted(emit);
//   }
//
//   dynamic _interestValue;
//   dynamic get interestValue => _interestValue;
//
//   dynamic _conversionPolicyValue;
//   dynamic get conversionPolicyValue => _conversionPolicyValue;
//
//   dynamic _extraFittingValue;
//   dynamic get extraFittingValue => _extraFittingValue;
//
//   dynamic _societyAllowValue;
//   dynamic get societyAllowValue => _societyAllowValue;
//
//   dynamic _chargeAreaValue;
//   dynamic get chargeAreaValue => _chargeAreaValue;
//
//   dynamic _areaValue;
//   dynamic get areaValue => _areaValue;
//
//   dynamic _guardianTypeValue;
//   dynamic get guardianTypeValue => _guardianTypeValue;
//
//   dynamic _propertyCategoryValue;
//   dynamic get propertyCategoryValue => _propertyCategoryValue;
//
//   dynamic _propertyClassValue;
//   dynamic get propertyClassValue => _propertyClassValue;
//
//   dynamic _allDistrictValue;
//   dynamic get allDistrictValue => _allDistrictValue;
//
//   dynamic _residentStatusValue;
//   dynamic get residentStatusValue => _residentStatusValue;
//
//   dynamic _existingCookingFuelValue;
//   dynamic get existingCookingFuelValue => _existingCookingFuelValue;
//
//   dynamic _kycDoc1Value;
//   dynamic get kycDoc1Value => _kycDoc1Value;
//
//   dynamic _kycDoc2Value;
//   dynamic get kycDoc2Value => _kycDoc2Value;
//
//   dynamic _kycDoc3Value;
//   dynamic get kycDoc3Value => _kycDoc3Value;
//
//   dynamic _preferredBillValue;
//   dynamic get preferredBillValue => _preferredBillValue;
//
//   dynamic _custBankNameValue;
//   dynamic get custBankNameValue => _custBankNameValue;
//
//   dynamic _paymentBankNameValue;
//   dynamic get paymentBankNameValue => _paymentBankNameValue;
//
//   dynamic _initialDepositStatusValue;
//   dynamic get initialDepositStatusValue => _initialDepositStatusValue;
//
//   dynamic _depositTypeValue;
//   dynamic get depositTypeValue => _depositTypeValue;
//
//   dynamic _modeDepositValue;
//   dynamic get modeDepositValue => _modeDepositValue;
//
// TextEditingController lat = TextEditingController();
// TextEditingController long = TextEditingController();
//
//
//   File _idFrontPhotoImage = File("");
//   File get idFrontPhotoImage => _idFrontPhotoImage;
//
//   File _idBackPhotoImage = File("");
//   File get idBackPhotoImage => _idBackPhotoImage;
//
//   File _eleBillFrontPath = File("");
//   File get eleBillFrontPath => _eleBillFrontPath;
//
//   File _eleBillBackPath = File("");
//   File get eleBillBackPath => _eleBillBackPath;
//
//   File _nocFrontPath = File("");
//   File get nocFrontPath => _nocFrontPath;
//
//   File _nocBackPath = File("");
//   File get nocBackPath => _nocBackPath;
//
//   File _uploadCustomerPath = File("");
//   File get uploadCustomerPath => _uploadCustomerPath;
//
//   File _uploadHousePath = File("");
//   File get uploadHousePath => _uploadHousePath;
//
//   File _ownerConsentPath = File("");
//   File get ownerConsentPath => _ownerConsentPath;
//
//   File _customerConsentPath = File("");
//   File get customerConsentPath => _customerConsentPath;
//
//   File _cancelChequePath = File("");
//   File get cancelChequePath => _cancelChequePath;
//
//   File _chequePath = File("");
//   File get chequePath => _chequePath;
//
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController firstController = TextEditingController();
//   final TextEditingController middleController = TextEditingController();
//   final TextEditingController lastController = TextEditingController();
//   final TextEditingController guardianNameController = TextEditingController();
//   final TextEditingController emailIdController = TextEditingController();
//   final TextEditingController buildingNumberController =
//       TextEditingController();
//   final TextEditingController houseNumberController = TextEditingController();
//   final TextEditingController colonyController = TextEditingController();
//   final TextEditingController streetController = TextEditingController();
//   final TextEditingController townController = TextEditingController();
//   final TextEditingController pinCodeController = TextEditingController();
//   final TextEditingController numberKitchenController = TextEditingController();
//   final TextEditingController numberBathroomController =
//       TextEditingController();
//   final TextEditingController familyMemberController = TextEditingController();
//   final TextEditingController nearestLandmarkController =
//       TextEditingController();
//   final TextEditingController kyc1NumberController = TextEditingController();
//   final TextEditingController kyc2NumberController = TextEditingController();
//   final TextEditingController kyc3NumberController = TextEditingController();
//   final TextEditingController custBankAccNumberController =
//       TextEditingController();
//   final TextEditingController custIfscCodeController = TextEditingController();
//   final TextEditingController custBankAddController = TextEditingController();
//   final TextEditingController depositAmountController = TextEditingController();
//   final TextEditingController chequeNoController = TextEditingController();
//   final TextEditingController chequeDateController = TextEditingController();
//   final TextEditingController chequeAccountNoController = TextEditingController();
//   final TextEditingController chequeMicrNoController = TextEditingController();
//
//   _setInterestValue(DashboardSetInterestValue event, emit) {
//     _interestValue = event.interestValue;
//     _eventCompleted(emit);
//   }
//
//   _setConversionPolicyValue(DashboardSetConversionPolicyValue event, emit) {
//     _conversionPolicyValue = event.conversionPolicyValue;
//     _eventCompleted(emit);
//   }
//
//   _setExtraFittingValue(DashboardSetExtraFittingValue event, emit) {
//     _extraFittingValue = event.extraFittingValue;
//     _eventCompleted(emit);
//   }
//
//   _setSocietyAllowValue(DashboardSetSocietyAllowValue event, emit) {
//     _societyAllowValue = event.societyAllowValue;
//     _eventCompleted(emit);
//   }
//
//   _setChargeAreaValue(DashboardSetChargeAreaValue event, emit) {
//     _chargeAreaValue = event.chargeAreaValue;
//     _eventCompleted(emit);
//   }
//
//   _setAreaValue(DashboardSetAreaValue event, emit) {
//     _areaValue = event.areaValue;
//     _eventCompleted(emit);
//   }
//
//   _setGuardianTypeValue(DashboardSetGuardianTypeValue event, emit) {
//     _guardianTypeValue = event.guardianTypeValue;
//     _eventCompleted(emit);
//   }
//
//   _setPropertyCategoryValue(DashboardSetPropertyCategoryValue event, emit) {
//     _propertyCategoryValue = event.propertyCategoryValue;
//     _eventCompleted(emit);
//   }
//
//   _setPropertyClassValue(DashboardSetPropertyClassValue event, emit) {
//     _propertyClassValue = event.propertyClassValue;
//     _eventCompleted(emit);
//   }
//
//   _setDistrictValue(DashboardSetDistrictValue event, emit) {
//     _allDistrictValue = event.allDistrictValue;
//     _eventCompleted(emit);
//   }
//
//   _setResidentStatusValue(DashboardSetResidentStatusValue event, emit) {
//     _residentStatusValue = event.residentStatusValue;
//     _eventCompleted(emit);
//   }
//
//   _setExistingCookingFuelValue(
//       DashboardSetExistingCookingFuelValue event, emit) {
//     _existingCookingFuelValue = event.existingCookingFuelValue;
//     _eventCompleted(emit);
//   }
//
//   _setKycDoc1Value(DashboardSetKycDoc1Value event, emit) {
//     _kycDoc1Value = event.kycDoc1Value;
//     _eventCompleted(emit);
//   }
//
//   _setKycDoc2Value(DashboardSetKycDoc2Value event, emit) {
//     _kycDoc2Value = event.kycDoc2Value;
//     _eventCompleted(emit);
//   }
//
//   _setKycDoc3Value(DashboardSetKycDoc3Value event, emit) {
//     _kycDoc3Value = event.kycDoc3Value;
//     _eventCompleted(emit);
//   }
//
//   _setPreferredBillValue(DashboardSetPreferredBillValue event, emit) {
//     _preferredBillValue = event.preferredBillValue;
//     _eventCompleted(emit);
//   }
//
//   _setCustBankNameValue(DashboardSetCustBankNameValue event, emit) {
//     _custBankNameValue = event.custBankNameValue;
//     _eventCompleted(emit);
//   }
//
//   _setPaymentBankNameValue(DashboardSetPaymentBankNameValue event, emit) {
//     _paymentBankNameValue = event.paymentBankNameValue;
//     _eventCompleted(emit);
//   }
//
//   _setInitialDepositStatusValue(
//       DashboardSetInitialDepositStatusValue event, emit) {
//     _initialDepositStatusValue = event.initialDepositStatusValue;
//     _eventCompleted(emit);
//   }
//
//   _setDepositTypeValue(DashboardSetDepositTypeValue event, emit) {
//     _depositTypeValue = event.depositTypeValue;
//     _eventCompleted(emit);
//   }
//
//   _setModeDepositValue(DashboardSetModeDepositValue event, emit) {
//     _modeDepositValue = event.modeDepositValue;
//     _eventCompleted(emit);
//   }
//
//   _setIdFrontFilePath(DashboardSetIdFrontFilePath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.idFrontFilePath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _idFrontPhotoImage = File(tempCameraImage.path);
//                   } },
//             onTapGallery: () async {
//                   Navigator.of(context).pop();
//                  var tempGalleryImage = await DashboardHelper.galleryPiker(
//                       context: event.context, galleryImage: event.idFrontFilePath);
//                   if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                     _idFrontPhotoImage = File(tempGalleryImage.path);
//                   } },
//           );
//         }
//         );
//     _eventCompleted(emit);
//   }
//   _setIdBackFilePath(DashboardSetIdBackFilePath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.idBackFilePath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _idBackPhotoImage = File(tempCameraImage.path);
//                   }
//               },
//             onTapGallery: () async {
//                   Navigator.of(context).pop();
//                  var tempGalleryImage = await DashboardHelper.galleryPiker(
//                       context: event.context, galleryImage: event.idBackFilePath);
//                   if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                     _idBackPhotoImage = File(tempGalleryImage.path);
//                   }
//                   },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setEleBillFrontPath(DashboardSetEleBillFrontPath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.eleBillFrontPath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _eleBillFrontPath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.eleBillFrontPath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _eleBillFrontPath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setEleBillBackPath(DashboardSetEleBillBackPath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.eleBillBackPath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _eleBillBackPath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.eleBillBackPath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _eleBillBackPath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setNocFrontPath(DashboardSetNocFrontPath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.nocFrontPath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _nocFrontPath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.nocFrontPath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _nocFrontPath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setNocBackPath(DashboardSetNocBackPath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.nocBackPath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _nocBackPath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.nocBackPath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _nocBackPath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setUploadCustomerPath(DashboardSetUploadCustomerPath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.uploadCustomerPath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _uploadCustomerPath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.uploadCustomerPath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _uploadCustomerPath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setUploadHousePath(DashboardSetUploadHousePath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.uploadHousePath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _uploadHousePath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.uploadHousePath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _uploadHousePath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setCustomerConsentPath(DashboardSetCustomerConsentPath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.customerConsentPath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _customerConsentPath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.customerConsentPath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _customerConsentPath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setOwnerConsentPath(DashboardSetOwnerConsentPath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.ownerConsentPath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _ownerConsentPath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.ownerConsentPath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _ownerConsentPath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setCancelChequePath(DashboardSetCancelChequePath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.cancelChequePath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _cancelChequePath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.cancelChequePath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _cancelChequePath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//   _setChequePath(DashboardSetChequePath event, emit) {
//     showDialog(
//         context: event.context,
//         builder: (BuildContext context)  {
//           return OpenImageSource(
//             onTapCamera: () async {
//               Navigator.of(context).pop();
//               var tempCameraImage = await DashboardHelper.cameraPiker(
//                   context: event.context,cameraImage: event.chequePath);
//               if (tempCameraImage != null && tempCameraImage.path.isNotEmpty) {
//                 _chequePath = File(tempCameraImage.path);
//               }
//             },
//             onTapGallery: () async {
//               Navigator.of(context).pop();
//               var tempGalleryImage = await DashboardHelper.galleryPiker(
//                   context: event.context, galleryImage: event.chequePath);
//               if (tempGalleryImage != null && tempGalleryImage.path.isNotEmpty) {
//                 _chequePath = File(tempGalleryImage.path);
//               }
//             },
//           );
//         });
//     _eventCompleted(emit);
//   }
//
//
//   fetchLabelApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getLabelApi(context: context);
//     if (res != null) {
//       _getLabelModel = res;
//     }
//   }
//
//   fetchNotInterestedApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getNotInterestedApi(context: context);
//     if (res != null) {
//       _getNotInterestedModel = res;
//       _getNotInterestedList = res.toJson().values.toList();
//     }
//   }
//
//   fetchAcceptConversionPolicyApi({required BuildContext context}) async {
//     var res =
//         await DashboardHelper.getAcceptConversionPolicyApi(context: context);
//     if (res != null) {
//       _getAcceptConversionPolicyModel = res;
//       _conversionPolicyList = res.toJson().values.toList();
//       _conversionPolicyValue = _conversionPolicyList.first.toString();
//     }
//   }
//
//   fetchAcceptExtraFittingCostApi({required BuildContext context}) async {
//     var res =
//         await DashboardHelper.getAcceptExtraFittingCostApi(context: context);
//     if (res != null) {
//       _getAcceptExtraFittingCostModel = res;
//       _extraFittingCostList = res.toJson().values.toList();
//       _extraFittingValue  = _extraFittingCostList.first.toString();
//     }
//   }
//
//   fetchSocietyAllowApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getSocietyAllowApi(context: context);
//     if (res != null) {
//       _getSocietyAllowModel = res;
//       _societyAllowList = res.toJson().values.toList();
//       _societyAllowValue = _societyAllowList.last.toString();
//     }
//   }
//
//   fetchChargeAreaListApi({required BuildContext context}) async {
//     var chargeAreaListRes =
//         await DashboardHelper.getChargeAreaListApi(context: context);
//     if (chargeAreaListRes != null) {
//       _getChargeAreaListModel = chargeAreaListRes;
//     }
//   }
//
//   fetchBackNameListApi({required BuildContext context}) async {
//     var bankNameListRes =
//     await DashboardHelper.getBankNameListApi(context: context);
//     if (bankNameListRes != null) {
//       _custBankNameList = bankNameListRes;
//       _paymentBankNameList = bankNameListRes;
//     }
//   }
//
//   fetchAllAreaApi({required BuildContext context}) async {
//     var allAreaRes = await DashboardHelper.getAllAreaApi(context: context);
//     if (allAreaRes != null) {
//       _getAllAreaModel = allAreaRes;
//     }
//   }
//
//   fetchGuardianTypeApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getGuardianTypeApi(context: context);
//     if (res != null) {
//       _getGuardianTypeModel = res;
//       _getGuardianTypeList = res.toJson().values.toList();
//     }
//   }
//
//   fetchPropertyCategoryApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getPropertyCategoryApi(context: context);
//     if (res != null) {
//       _getPropertyCategoryModel = res;
//     }
//   }
//
//   Future<List<GetPropertyClassModel>?> fetchPropertyClassApi(
//       {required BuildContext context}) async {
//     var res = await DashboardHelper.getPropertyClassApi(context: context);
//     if (res != null) {
//       _getPropertyClassModel = res;
//     }
//     return null;
//   }
//
//   fetchAllDistrictApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getAllDistrictModelApi(context: context);
//     if (res != null) {
//       _getAllDistrictModel = res;
//     }
//   }
//
//   fetchResidentStatusApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getResidentStatusApi(context: context);
//     if (res != null) {
//       _getResidentStatusModel = res;
//       _getResidentStatusList = res.toJson().values.toList();
//     }
//   }
//
//   fetchIdentityProofApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getIdentityProofApi(context: context);
//     if (res != null) {
//       _getIdentityProofModel = res;
//       _getIdentityProofList = res.toJson().values.toList();
//     }
//   }
//
//   fetchOwnershipProofApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getOwnershipProofApi(context: context);
//     if (res != null) {
//       _getOwnershipProofModel = res;
//       _getOwnershipProofList = res.toJson().values.toList();
//     }
//   }
//
//   fetchKycDocApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getKycDocApi(context: context);
//     if (res != null) {
//       _getKycDocModel = res;
//       _getKycDocList = res.toJson().values.toList();
//     }
//   }
//
//   fetchExistingCookingFuelApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getExistingCookingFuelApi(context: context);
//     if (res != null) {
//       _getExistingCookingFuelModel = res;
//       _existingCookingFuelList = res.toJson().values.toList();
//     }
//   }
//
//   fetchEBillingApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getEBillingApi(context: context);
//     if (res != null) {
//       _getEBillingModel = res;
//       _eBillingList = res.toJson().values.toList();
//     }
//   }
//
//   fetchInitialDepositStatusApi({required BuildContext context}) async {
//     var res =
//         await DashboardHelper.getInitialDepositStatusApi(context: context);
//     if (res != null) {
//       _getInitialDepositStatusModel = res;
//       _initialDepositStatusList = res.toJson().values.toList();
//     }
//   }
//
//   fetchAllDepositOfflineApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getAllDepositOfflineApi(context: context);
//     if (res != null) {
//       _getAllDepositOfflineModel = res;
//     }
//   }
//
//   fetchModeOfDepositApi({required BuildContext context}) async {
//     var res = await DashboardHelper.getModeOfDepositApi(context: context);
//     if (res != null) {
//       _getModeOfDepositModel = res;
//       _modeDepositList = res.toJson().values.toList();
//     }
//   }
//
//   _setLocation() async {
//     var getLocation = await DashboardHelper.getCurrentLocation();
//     lat = TextEditingController(text: getLocation.latitude.toString());
//     long = TextEditingController(text: getLocation.longitude.toString());
//     return getLocation;
//   }
//
//   _setChequeDate(DashboardSetChequeDateEvent event, emit) async {
//     DateTime? dateTime = await showDatePicker(
//         context: event.context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(1950),
//         lastDate: DateTime.now());
//     if (dateTime != null) {
//       String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
//       chequeDateController.text = formattedDate.toString();
//       _eventCompleted(emit);
//     }
//   }
//
//   _eventCompleted(Emitter<DashboardState> emit) {
//     emit(DashboardGetAllDataState(
//       getLabelModel: getLabelModel,
//       interestValue: interestValue,
//       getNotInterestedList: getNotInterestedList,
//       conversionPolicyValue: conversionPolicyValue,
//       conversionPolicyList: conversionPolicyList,
//       extraFittingValue: extraFittingValue,
//       extraFittingCostList: extraFittingCostList,
//       societyAllowValue: societyAllowValue,
//       societyAllowList: _societyAllowList,
//       getNotInterestedModel: getNotInterestedModel,
//       getAcceptConversionPolicyModel: getAcceptConversionPolicyModel,
//       getAcceptExtraFittingCostModel: getAcceptExtraFittingCostModel,
//       getSocietyAllowModel: getSocietyAllowModel,
//       chargeAreaValue: chargeAreaValue,
//       getChargeAreaListModel: getChargeAreaListModel,
//       areaValue: areaValue,
//       getAllAreaModel: getAllAreaModel,
//       guardianTypeValue: guardianTypeValue,
//       getGuardianTypeList: getGuardianTypeList,
//       propertyCategoryValue: propertyCategoryValue,
//       propertyClassValue: propertyClassValue,
//       identityProofValue: kycDoc1Value,
//       identityProofList: getIdentityProofList,
//       getIdentityProofModel: getIdentityProofModel,
//       ownershipProofValue: kycDoc2Value,
//       ownershipProofList: getOwnershipProofList,
//       getOwnershipProofModel: getOwnershipProofModel,
//       kycDocValue: kycDoc3Value,
//       kycDocList: getKycDocList,
//       getKycDocModel: getKycDocModel,
//       getGuardianTypeModel: getGuardianTypeModel,
//       existingCookingFuelValue: existingCookingFuelValue,
//       existingCookingFuelList: existingCookingFuelList,
//       getExistingCookingFuelModel: getExistingCookingFuelModel,
//       residentStatusValue: residentStatusValue,
//       getResidentStatusList: getResidentStatusList,
//       getResidentStatusModel: getResidentStatusModel,
//       getPropertyClassModel: getPropertyClassModel,
//       getPropertyCategoryModel: getPropertyCategoryModel,
//       eBillingValue: preferredBillValue,
//       eBillingList: eBillingList,
//       getEBillingModel: getEBillingModel,
//       initialDepositStatusValue: initialDepositStatusValue,
//       initialDepositStatusList: initialDepositStatusList,
//       depositOfflineValue: depositTypeValue,
//       getAllDepositOfflineModel: getAllDepositOfflineModel,
//       modeDepositValue: modeDepositValue,
//       modeDepositList: modeDepositList,
//       getInitialDepositStatusModel: getInitialDepositStatusModel,
//       getModeOfDepositModel: getModeOfDepositModel,
//       mobileController: mobileController,
//       firstController: firstController,
//       middleController: middleController,
//       lastController: lastController,
//       guardianNameController: guardianNameController,
//       emailIdController: emailIdController,
//       buildingNumberController: buildingNumberController,
//       houseNumberController: houseNumberController,
//       colonyController: colonyController,
//       streetController: streetController,
//       townController: townController,
//       pinCodeController: pinCodeController,
//       numberKitchenController: numberKitchenController,
//       numberBathroomController: numberBathroomController,
//       familyMemberController: familyMemberController,
//       nearestLandmarkController: nearestLandmarkController,
//       kyc1NumberController: kyc1NumberController,
//       kyc2NumberController: kyc2NumberController,
//       kyc3NumberController: kyc3NumberController,
//       custBankAccNumberController: custBankAccNumberController,
//       custIfscCodeController: custIfscCodeController,
//       custBankAddController: custBankAddController,
//       depositAmountController: depositAmountController,
//       allDistrictValue: allDistrictValue,
//       getAllDistrictModel: getAllDistrictModel,
//       latitudeController:lat,
//       longitudeController:long,
//       chequeNoController:chequeNoController,
//       chequeDateController:chequeDateController,
//       chequeAccountNoController:chequeAccountNoController,
//       chequeMicrNoController:chequeMicrNoController,
//       custBankNameValue: custBankNameValue,
//       paymentBankNameValue:paymentBankNameValue ,
//       custBankNameList: custBankNameList,
//       paymentBankNameList: paymentBankNameList,
//       idBackFilePath: idBackPhotoImage,
//       idFrontFilePath: idFrontPhotoImage,
//       eleBillFrontPath:eleBillFrontPath ,
//       eleBillBackPath:eleBillBackPath ,
//       nocFrontPath:nocFrontPath ,
//       nocBackPath: nocBackPath,
//       uploadCustomerPath: uploadCustomerPath,
//       uploadHousePath: uploadHousePath,
//       customerConsentPath:customerConsentPath ,
//       ownerConsentPath:ownerConsentPath ,
//       cancelChequePath:cancelChequePath ,
//       chequePath:chequePath ,
//     ));
//   }
//
//
// }
