import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';


abstract class CustomRegistrationFormState extends Equatable {}

class CustomRegistrationFormInitialState extends CustomRegistrationFormState {
  @override
  List<Object> get props => [];
}

class CustomRegistrationFormPageLoadState extends CustomRegistrationFormInitialState {
  @override
  List<Object> get props => [];
}

class CustomRegistrationFormGetLabelState extends CustomRegistrationFormState {
  final GetLabelModel getLabelModel;
  CustomRegistrationFormGetLabelState({required this.getLabelModel});

  @override
  // TODO: implement props
  List<Object?> get props => [getLabelModel];
}

class CustomRegistrationFormGetAllDataState extends CustomRegistrationFormState {
  final bool isPageLoader;
  final GetLabelModel labelModel;
  dynamic interestValue;
  final List<dynamic> getNotInterestedList;
  dynamic conversionPolicyValue;
  final List<dynamic> conversionPolicyList;
  dynamic extraFittingValue;
  final List<dynamic> extraFittingCostList;
  dynamic societyAllowValue;
  final List<dynamic> societyAllowList;
  dynamic guardianTypeValue;
  List<dynamic> getGuardianTypeList;
  dynamic propertyCategoryValue;
  dynamic propertyClassValue;
  final GetNotInterestedModel getNotInterestedModel;
  final GetAcceptConversionPolicyModel getAcceptConversionPolicyModel;
  final GetAcceptExtraFittingCostModel getAcceptExtraFittingCostModel;
  final GetSocietyAllowModel getSocietyAllowModel;
  dynamic allDistrictValue;
  final List<GetAllDistrictModel> getAllDistrictModel;
  dynamic eBillingValue;
  final List<dynamic> eBillingList;
  final GetEBillingModel getEBillingModel;
  dynamic initialDepositStatusValue;
  final List<dynamic> initialDepositStatusList;
  final GetInitialDepositStatusModel getInitialDepositStatusModel;
  dynamic modeDepositValue;
  final List<dynamic> modeDepositList;
  final GetModeOfDepositModel getModeOfDepositModel;
  dynamic depositOfflineValue;
  final List<GetAllDepositOfflineModel> getAllDepositOfflineList;
  final GetAllDepositOfflineModel getAllDepositOfflineModel;
  dynamic identityProofValue;
  final List<dynamic> identityProofList;
  final GetIdentityProofModel getIdentityProofModel;
  dynamic ownershipProofValue;
  final List<dynamic> ownershipProofList;
  final GetOwnershipProofModel getOwnershipProofModel;
  dynamic kycDoc3Value;
  final List<dynamic> kycDocList;
  final GetKycDocModel getKycDocModel;
  final GetGuardianTypeModel getGuardianTypeModel;
  dynamic existingCookingFuelValue;
  final List<dynamic> existingCookingFuelList;
  final GetExistingCookingFuelModel getExistingCookingFuelModel;
  final GetResidentStatusModel getResidentStatusModel;
  final List<dynamic> getResidentStatusList;
  dynamic residentStatusValue;
  final List<GetPropertyClassModel> getPropertyClassModel;
  final List<GetPropertyCategoryModel> getPropertyCategoryModel;
  dynamic areaValue;
  final List<GetAllAreaModel> getAllAreaModel;
  dynamic chargeAreaValue;
  final List<GetChargeAreaListModel> getChargeAreaListModel;
  final TextEditingController reasonRegistrationController;
  final TextEditingController mobileController;
  final TextEditingController altMobileController;
  final TextEditingController firstController;
  final TextEditingController middleController;
  final TextEditingController lastController;
  final TextEditingController guardianNameController;
  final TextEditingController emailIdController;
  final TextEditingController buildingNumberController;
  final TextEditingController houseNumberController;
  final TextEditingController colonyController;
  final TextEditingController streetController;
  final TextEditingController townController;
  final TextEditingController pinCodeController;
  final TextEditingController numberKitchenController;
  final TextEditingController numberBathroomController;
  final TextEditingController familyMemberController;
  final TextEditingController nearestLandmarkController;
  final TextEditingController kyc1NumberController;
  final TextEditingController kyc2NumberController;
  final TextEditingController kyc3NumberController;
  final TextEditingController custBankAccNumberController;
  final TextEditingController custIfscCodeController;
  final TextEditingController custBankAddController;
  final TextEditingController reasonDepositStsController;
  final TextEditingController depositAmountController;
  final TextEditingController latitudeController;
  final TextEditingController longitudeController;
  final TextEditingController chequeNoController;
  final TextEditingController chequeDateController;
  final TextEditingController chequeAccountNoController;
  final TextEditingController chequeMicrNoController;
  dynamic custBankNameValue;
  dynamic paymentBankNameValue;
  final List<String> custBankNameList;
  final List<String> paymentBankNameList;
  File idFrontFilePath;
  File idBackFilePath;
  File eleBillFrontPath;
  File eleBillBackPath;
  File nocDocPath;
  File nocFrontPath;
  File nocBackPath;
  File uploadCustomerPath;
  File uploadHousePath;
  File customerConsentPath;
  File ownerConsentPath;
  File cancelChequePath;
  File chequePath;
  final bool isPreviewLoader;
  final bool isSaveLoader;

  CustomRegistrationFormGetAllDataState({
    required this.isPageLoader,
    required this.labelModel,
    required this.interestValue,
    required this.getNotInterestedList,
    required this.conversionPolicyValue,
    required this.conversionPolicyList,
    required this.extraFittingValue,
    required this.extraFittingCostList,
    required this.societyAllowValue,
    required this.societyAllowList,
    required this.getNotInterestedModel,
    required this.getAcceptConversionPolicyModel,
    required this.getAcceptExtraFittingCostModel,
    required this.getSocietyAllowModel,
    required this.areaValue,
    required this.getAllAreaModel,
    required this.chargeAreaValue,
    required this.getChargeAreaListModel,
    required this.guardianTypeValue,
    required this.getGuardianTypeList,
    required this.propertyCategoryValue,
    required this.propertyClassValue,
    required this.identityProofValue,
    required this.identityProofList,
    required this.getIdentityProofModel,
    required this.ownershipProofValue,
    required this.ownershipProofList,
    required this.getOwnershipProofModel,
    required this.kycDoc3Value,
    required this.kycDocList,
    required this.getKycDocModel,
    required this.getGuardianTypeModel,
    required this.existingCookingFuelValue,
    required this.existingCookingFuelList,
    required this.getExistingCookingFuelModel,
    required this.getResidentStatusModel,
    required this.getResidentStatusList,
    required this.residentStatusValue,
    required this.getPropertyClassModel,
    required this.getPropertyCategoryModel,
    required this.eBillingValue,
    required this.eBillingList,
    required this.getEBillingModel,
    required this.initialDepositStatusValue,
    required this.initialDepositStatusList,
    required this.getInitialDepositStatusModel,
    required this.modeDepositValue,
    required this.modeDepositList,
    required this.depositOfflineValue,
    required this.getAllDepositOfflineList,
    required this.getAllDepositOfflineModel,
    required this.getModeOfDepositModel,
    required this.reasonRegistrationController,
    required this.mobileController,
    required this.altMobileController,
    required this.firstController,
    required this.middleController,
    required this.lastController,
    required this.guardianNameController,
    required this.emailIdController,
    required this.buildingNumberController,
    required this.houseNumberController,
    required this.colonyController,
    required this.streetController,
    required this.townController,
    required this.pinCodeController,
    required this.numberKitchenController,
    required this.numberBathroomController,
    required this.familyMemberController,
    required this.nearestLandmarkController,
    required this.kyc1NumberController,
    required this.kyc2NumberController,
    required this.kyc3NumberController,
    required this.custBankAccNumberController,
    required this.custIfscCodeController,
    required this.custBankAddController,
    required this.reasonDepositStsController,
    required this.depositAmountController,
    required this.allDistrictValue,
    required this.latitudeController,
    required this.longitudeController,
    required this.chequeNoController,
    required this.chequeDateController,
    required this.chequeAccountNoController,
    required this.chequeMicrNoController,
    required this.custBankNameValue,
    required this.paymentBankNameValue,
    required this.custBankNameList,
    required this.paymentBankNameList,
    required this.getAllDistrictModel,
    required this.idFrontFilePath,
    required this.idBackFilePath,
    required this.eleBillFrontPath,
    required this.eleBillBackPath,
    required this.nocDocPath,
    required this.nocFrontPath,
    required this.nocBackPath,
    required this.uploadCustomerPath,
    required this.uploadHousePath,
    required this.customerConsentPath,
    required this.ownerConsentPath,
    required this.cancelChequePath,
    required this.chequePath,
    required this.isPreviewLoader,
    required this.isSaveLoader,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isPageLoader,
    labelModel,
    interestValue,
    getNotInterestedList,
    conversionPolicyValue,
    conversionPolicyList,
    extraFittingValue,
    extraFittingCostList,
    societyAllowValue,
    societyAllowList,
    getNotInterestedModel,
    guardianTypeValue,
    getGuardianTypeList,
    propertyCategoryValue,
    propertyClassValue,
    getAcceptExtraFittingCostModel,
    getAcceptConversionPolicyModel,
    areaValue,
    getAllAreaModel,
    chargeAreaValue,
    getChargeAreaListModel,
    getKycDocModel,
    getOwnershipProofModel,
    getIdentityProofModel,
    getGuardianTypeModel,
    existingCookingFuelValue,
    existingCookingFuelList,
    getExistingCookingFuelModel,
    getResidentStatusModel,
    getResidentStatusList,
    residentStatusValue,
    getSocietyAllowModel,
    getPropertyClassModel,
    getPropertyCategoryModel,
    eBillingValue,
    eBillingList,
    getEBillingModel,
    initialDepositStatusValue,
    initialDepositStatusList,
    getInitialDepositStatusModel,
    modeDepositValue,
    modeDepositList,
    depositOfflineValue,
    getAllDepositOfflineList,
    getAllDepositOfflineModel,
    getModeOfDepositModel,
    reasonRegistrationController,
    mobileController,
    altMobileController,
    firstController,
    middleController,
    lastController,
    guardianNameController,
    emailIdController,
    buildingNumberController,
    houseNumberController,
    colonyController,
    streetController,
    townController,
    pinCodeController,
    numberKitchenController,
    numberBathroomController,
    familyMemberController,
    nearestLandmarkController,
    kyc1NumberController,
    kyc2NumberController,
    kyc3NumberController,
    kycDoc3Value,
    custBankAccNumberController,
    custIfscCodeController,
    custBankAddController,
    reasonDepositStsController,
    depositAmountController,
    allDistrictValue,
    getAllDistrictModel,
    latitudeController,
    longitudeController,
    chequeNoController,
    chequeDateController,
    chequeAccountNoController,
    chequeMicrNoController,
    custBankNameValue,
    paymentBankNameValue,
    custBankNameList,
    paymentBankNameList,
    idFrontFilePath,
    idBackFilePath,
    eleBillFrontPath,
    eleBillBackPath,
    nocDocPath,
    nocFrontPath,
    nocBackPath,
    uploadCustomerPath,
    uploadHousePath,
    customerConsentPath,
    ownerConsentPath,
    cancelChequePath,
    chequePath,
    isPreviewLoader,
    isSaveLoader,

  ];
}
