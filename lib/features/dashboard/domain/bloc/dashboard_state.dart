// import 'dart:io';
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
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
// import 'package:image_picker/image_picker.dart';
//
// abstract class DashboardState extends Equatable {}
//
// class DashboardInitState extends DashboardState {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
//
// class DashboardPageLoadState extends DashboardInitState {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
//
// class DashboardGetLabelState extends DashboardInitState {
//   final GetLabelModel getLabelModel;
//   DashboardGetLabelState({required this.getLabelModel});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [getLabelModel];
// }
//
// class DashboardGetAllDataState extends DashboardInitState {
//   final GetLabelModel getLabelModel;
//   final dynamic interestValue;
//   final List<dynamic> getNotInterestedList;
//   final dynamic conversionPolicyValue;
//   final List<dynamic> conversionPolicyList;
//   final dynamic extraFittingValue;
//   final List<dynamic> extraFittingCostList;
//   final dynamic societyAllowValue;
//   final List<dynamic> societyAllowList;
//   final dynamic guardianTypeValue;
//   List<dynamic> getGuardianTypeList;
//   final dynamic propertyCategoryValue;
//   final dynamic propertyClassValue;
//   final GetNotInterestedModel getNotInterestedModel;
//   final GetAcceptConversionPolicyModel getAcceptConversionPolicyModel;
//   final GetAcceptExtraFittingCostModel getAcceptExtraFittingCostModel;
//   final GetSocietyAllowModel getSocietyAllowModel;
//   final dynamic allDistrictValue;
//   final List<GetAllDistrictModel> getAllDistrictModel;
//   final dynamic eBillingValue;
//   final List<dynamic> eBillingList;
//   final GetEBillingModel getEBillingModel;
//   final dynamic initialDepositStatusValue;
//   final List<dynamic> initialDepositStatusList;
//   final GetInitialDepositStatusModel getInitialDepositStatusModel;
//   final dynamic modeDepositValue;
//   final List<dynamic> modeDepositList;
//   final GetModeOfDepositModel getModeOfDepositModel;
//   final dynamic depositOfflineValue;
//   final List<GetAllDepositOfflineModel> getAllDepositOfflineModel;
//
//   final dynamic identityProofValue;
//   final List<dynamic> identityProofList;
//   final GetIdentityProofModel getIdentityProofModel;
//   final dynamic ownershipProofValue;
//   final List<dynamic> ownershipProofList;
//   final GetOwnershipProofModel getOwnershipProofModel;
//   final dynamic kycDocValue;
//   final List<dynamic> kycDocList;
//   final GetKycDocModel getKycDocModel;
//   final GetGuardianTypeModel getGuardianTypeModel;
//   final dynamic existingCookingFuelValue;
//   final List<dynamic> existingCookingFuelList;
//   final GetExistingCookingFuelModel getExistingCookingFuelModel;
//   final GetResidentStatusModel getResidentStatusModel;
//   final List<dynamic> getResidentStatusList;
//   final dynamic residentStatusValue;
//   final List<GetPropertyClassModel> getPropertyClassModel;
//   final List<GetPropertyCategoryModel> getPropertyCategoryModel;
//   final dynamic areaValue;
//   final List<GetAllAreaModel> getAllAreaModel;
//   final dynamic chargeAreaValue;
//   final List<GetChargeAreaListModel> getChargeAreaListModel;
//   final TextEditingController mobileController;
//   final TextEditingController firstController;
//   final TextEditingController middleController;
//   final TextEditingController lastController;
//   final TextEditingController guardianNameController;
//   final TextEditingController emailIdController;
//   final TextEditingController buildingNumberController;
//   final TextEditingController houseNumberController;
//   final TextEditingController colonyController;
//   final TextEditingController streetController;
//   final TextEditingController townController;
//   final TextEditingController pinCodeController;
//   final TextEditingController numberKitchenController;
//   final TextEditingController numberBathroomController;
//   final TextEditingController familyMemberController;
//   final TextEditingController nearestLandmarkController;
//   final TextEditingController kyc1NumberController;
//   final TextEditingController kyc2NumberController;
//   final TextEditingController kyc3NumberController;
//   final TextEditingController custBankAccNumberController;
//   final TextEditingController custIfscCodeController;
//   final TextEditingController custBankAddController;
//   final TextEditingController depositAmountController;
//   final TextEditingController latitudeController;
//   final TextEditingController longitudeController;
//   final TextEditingController chequeNoController;
//   final TextEditingController chequeDateController;
//   final TextEditingController chequeAccountNoController;
//   final TextEditingController chequeMicrNoController;
//   final dynamic custBankNameValue;
//   final dynamic paymentBankNameValue;
//   final List<String> custBankNameList;
//   final List<String> paymentBankNameList;
//
//   final File idFrontFilePath;
//   final File idBackFilePath;
//   final File eleBillFrontPath;
//   final File eleBillBackPath;
//   final File nocFrontPath;
//   final File nocBackPath;
//   final File uploadCustomerPath;
//   final File uploadHousePath;
//   final File customerConsentPath;
//   final File ownerConsentPath;
//   final File cancelChequePath;
//   final File chequePath;
//   DashboardGetAllDataState({
//     required this.getLabelModel,
//     required this.interestValue,
//     required this.getNotInterestedList,
//     required this.conversionPolicyValue,
//     required this.conversionPolicyList,
//     required this.extraFittingValue,
//     required this.extraFittingCostList,
//     required this.societyAllowValue,
//     required this.societyAllowList,
//     required this.getNotInterestedModel,
//     required this.getAcceptConversionPolicyModel,
//     required this.getAcceptExtraFittingCostModel,
//     required this.getSocietyAllowModel,
//     required this.areaValue,
//     required this.getAllAreaModel,
//     required this.chargeAreaValue,
//     required this.getChargeAreaListModel,
//     required this.guardianTypeValue,
//     required this.getGuardianTypeList,
//     required this.propertyCategoryValue,
//     required this.propertyClassValue,
//     required this.identityProofValue,
//     required this.identityProofList,
//     required this.getIdentityProofModel,
//     required this.ownershipProofValue,
//     required this.ownershipProofList,
//     required this.getOwnershipProofModel,
//     required this.kycDocValue,
//     required this.kycDocList,
//     required this.getKycDocModel,
//     required this.getGuardianTypeModel,
//     required this.existingCookingFuelValue,
//     required this.existingCookingFuelList,
//     required this.getExistingCookingFuelModel,
//     required this.getResidentStatusModel,
//     required this.getResidentStatusList,
//     required this.residentStatusValue,
//     required this.getPropertyClassModel,
//     required this.getPropertyCategoryModel,
//     required this.eBillingValue,
//     required this.eBillingList,
//     required this.getEBillingModel,
//     required this.initialDepositStatusValue,
//     required this.initialDepositStatusList,
//     required this.getInitialDepositStatusModel,
//     required this.modeDepositValue,
//     required this.modeDepositList,
//     required this.depositOfflineValue,
//     required this.getAllDepositOfflineModel,
//     required this.getModeOfDepositModel,
//     required this.mobileController,
//     required this.firstController,
//     required this.middleController,
//     required this.lastController,
//     required this.guardianNameController,
//     required this.emailIdController,
//     required this.buildingNumberController,
//     required this.houseNumberController,
//     required this.colonyController,
//     required this.streetController,
//     required this.townController,
//     required this.pinCodeController,
//     required this.numberKitchenController,
//     required this.numberBathroomController,
//     required this.familyMemberController,
//     required this.nearestLandmarkController,
//     required this.kyc1NumberController,
//     required this.kyc2NumberController,
//     required this.kyc3NumberController,
//     required this.custBankAccNumberController,
//     required this.custIfscCodeController,
//     required this.custBankAddController,
//     required this.depositAmountController,
//     required this.allDistrictValue,
//     required this.latitudeController,
//     required this.longitudeController,
//     required this.chequeNoController,
//     required this.chequeDateController,
//     required this.chequeAccountNoController,
//     required this.chequeMicrNoController,
//     required this.custBankNameValue,
//     required this.paymentBankNameValue,
//     required this.custBankNameList,
//     required this.paymentBankNameList,
//     required this.getAllDistrictModel,
//     required this.idFrontFilePath,
//     required this.idBackFilePath,
//     required this.eleBillFrontPath,
//     required this.eleBillBackPath,
//     required this.nocFrontPath,
//     required this.nocBackPath,
//     required this.uploadCustomerPath,
//     required this.uploadHousePath,
//     required this.customerConsentPath,
//     required this.ownerConsentPath,
//     required this.cancelChequePath,
//     required this.chequePath,
//   });
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         getLabelModel,
//         interestValue,
//         getNotInterestedList,
//         conversionPolicyValue,
//         conversionPolicyList,
//         extraFittingValue,
//         extraFittingCostList,
//         societyAllowValue,
//         societyAllowList,
//         getNotInterestedModel,
//         guardianTypeValue,
//         getGuardianTypeList,
//         propertyCategoryValue,
//         propertyClassValue,
//         getAcceptExtraFittingCostModel,
//         getAcceptConversionPolicyModel,
//         areaValue,
//         getAllAreaModel,
//         chargeAreaValue,
//         getChargeAreaListModel,
//         getKycDocModel,
//         getOwnershipProofModel,
//         getIdentityProofModel,
//         getGuardianTypeModel,
//         existingCookingFuelValue,
//         existingCookingFuelList,
//         getExistingCookingFuelModel,
//         getResidentStatusModel,
//         getResidentStatusList,
//         residentStatusValue,
//         getSocietyAllowModel,
//         getPropertyClassModel,
//         getPropertyCategoryModel,
//         eBillingValue,
//         eBillingList,
//         getEBillingModel,
//         initialDepositStatusValue,
//         initialDepositStatusList,
//         getInitialDepositStatusModel,
//         modeDepositValue,
//         modeDepositList,
//         getModeOfDepositModel,
//         mobileController,
//         firstController,
//         middleController,
//         lastController,
//         guardianNameController,
//         emailIdController,
//         buildingNumberController,
//         houseNumberController,
//         colonyController,
//         streetController,
//         townController,
//         pinCodeController,
//         numberKitchenController,
//         numberBathroomController,
//         familyMemberController,
//         nearestLandmarkController,
//         kyc1NumberController,
//         kyc2NumberController,
//         kyc3NumberController,
//         custBankAccNumberController,
//         custIfscCodeController,
//         custBankAddController,
//         depositAmountController,
//         allDistrictValue,
//         getAllDistrictModel,
//     latitudeController,
//     longitudeController,
//     chequeNoController,
//     chequeDateController,
//     chequeAccountNoController,
//     chequeMicrNoController,
//     custBankNameValue,
//     paymentBankNameValue,
//     custBankNameList,
//     paymentBankNameList,
//         idFrontFilePath,
//         idBackFilePath,
//     eleBillFrontPath,
//     eleBillBackPath,
//     nocFrontPath,
//     nocBackPath,
//     uploadCustomerPath,
//     uploadHousePath,
//     customerConsentPath,
//     ownerConsentPath,
//     cancelChequePath,
//     chequePath,
//       ];
// }
