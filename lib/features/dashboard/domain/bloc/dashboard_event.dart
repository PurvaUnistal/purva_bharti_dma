// import 'dart:io';
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// abstract class DashboardEvent extends Equatable {}
//
// class DashboardPageLoadingEvent extends DashboardEvent {
//   final BuildContext context;
//   DashboardPageLoadingEvent({required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [context];
// }
//
// class DashboardSetInterestValue extends DashboardEvent {
//   final dynamic interestValue;
//   DashboardSetInterestValue({required this.interestValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [interestValue];
// }
//
// class DashboardSetConversionPolicyValue extends DashboardEvent {
//   final dynamic conversionPolicyValue;
//   DashboardSetConversionPolicyValue({required this.conversionPolicyValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [conversionPolicyValue];
// }
//
// class DashboardSetExtraFittingValue extends DashboardEvent {
//   final dynamic extraFittingValue;
//   DashboardSetExtraFittingValue({required this.extraFittingValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [extraFittingValue];
// }
//
// class DashboardSetSocietyAllowValue extends DashboardEvent {
//   final dynamic societyAllowValue;
//   DashboardSetSocietyAllowValue({required this.societyAllowValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [societyAllowValue];
// }
//
// class DashboardSetChargeAreaValue extends DashboardEvent {
//   final dynamic chargeAreaValue;
//   DashboardSetChargeAreaValue({required this.chargeAreaValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [chargeAreaValue];
// }
//
// class DashboardSetAreaValue extends DashboardEvent {
//   final dynamic areaValue;
//   DashboardSetAreaValue({required this.areaValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [areaValue];
// }
//
// class DashboardSetGuardianTypeValue extends DashboardEvent {
//   final dynamic guardianTypeValue;
//   DashboardSetGuardianTypeValue({required this.guardianTypeValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [guardianTypeValue];
// }
//
// class DashboardSetPropertyCategoryValue extends DashboardEvent {
//   final dynamic propertyCategoryValue;
//   DashboardSetPropertyCategoryValue({required this.propertyCategoryValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [propertyCategoryValue];
// }
//
// class DashboardSetPropertyClassValue extends DashboardEvent {
//   final dynamic propertyClassValue;
//   DashboardSetPropertyClassValue({required this.propertyClassValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [propertyClassValue];
// }
//
// class DashboardSetDistrictValue extends DashboardEvent {
//   final dynamic allDistrictValue;
//   DashboardSetDistrictValue({required this.allDistrictValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [allDistrictValue];
// }
//
// class DashboardSetResidentStatusValue extends DashboardEvent {
//   final dynamic residentStatusValue;
//   DashboardSetResidentStatusValue({required this.residentStatusValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [residentStatusValue];
// }
//
// class DashboardSetExistingCookingFuelValue extends DashboardEvent {
//   final dynamic existingCookingFuelValue;
//   DashboardSetExistingCookingFuelValue(
//       {required this.existingCookingFuelValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [existingCookingFuelValue];
// }
//
// class DashboardSetKycDoc1Value extends DashboardEvent {
//   final dynamic kycDoc1Value;
//   DashboardSetKycDoc1Value({required this.kycDoc1Value});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [kycDoc1Value];
// }
//
// class DashboardSetKycDoc2Value extends DashboardEvent {
//   final dynamic kycDoc2Value;
//   DashboardSetKycDoc2Value({required this.kycDoc2Value});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [kycDoc2Value];
// }
//
// class DashboardSetKycDoc3Value extends DashboardEvent {
//   final dynamic kycDoc3Value;
//   DashboardSetKycDoc3Value({required this.kycDoc3Value});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [kycDoc3Value];
// }
//
// class DashboardSetPreferredBillValue extends DashboardEvent {
//   final dynamic preferredBillValue;
//   DashboardSetPreferredBillValue({required this.preferredBillValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [preferredBillValue];
// }
//
// class DashboardSetCustBankNameValue extends DashboardEvent {
//   final dynamic custBankNameValue;
//   DashboardSetCustBankNameValue({required this.custBankNameValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [custBankNameValue];
// }
// class DashboardSetChequeDateEvent extends DashboardEvent {
//   final BuildContext context;
//   DashboardSetChequeDateEvent({required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [context];
// }
// class DashboardSetPaymentBankNameValue extends DashboardEvent {
//   final dynamic paymentBankNameValue;
//   DashboardSetPaymentBankNameValue({required this.paymentBankNameValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [paymentBankNameValue];
// }
//
// class DashboardSetInitialDepositStatusValue extends DashboardEvent {
//   final dynamic initialDepositStatusValue;
//   DashboardSetInitialDepositStatusValue(
//       {required this.initialDepositStatusValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [initialDepositStatusValue];
// }
//
// class DashboardSetDepositTypeValue extends DashboardEvent {
//   final dynamic depositTypeValue;
//   DashboardSetDepositTypeValue({required this.depositTypeValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [depositTypeValue];
// }
//
// class DashboardSetModeDepositValue extends DashboardEvent {
//   final dynamic modeDepositValue;
//   DashboardSetModeDepositValue({required this.modeDepositValue});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [modeDepositValue];
// }
//
// class DashboardSetIdFrontFilePath extends DashboardEvent {
//   final BuildContext context;
//   final File idFrontFilePath;
//   DashboardSetIdFrontFilePath(
//       {required this.idFrontFilePath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [idFrontFilePath, context];
// }
//
// class DashboardSetIdBackFilePath extends DashboardEvent {
//   final BuildContext context;
//   final File idBackFilePath;
//   DashboardSetIdBackFilePath(
//       {required this.idBackFilePath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [idBackFilePath, context];
// }
// class DashboardSetEleBillFrontPath extends DashboardEvent {
//   final BuildContext context;
//   final File eleBillFrontPath;
//   DashboardSetEleBillFrontPath(
//       {required this.eleBillFrontPath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [eleBillFrontPath, context];
// }
//
// class DashboardSetEleBillBackPath extends DashboardEvent {
//   final BuildContext context;
//   final File eleBillBackPath;
//   DashboardSetEleBillBackPath(
//       {required this.eleBillBackPath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [eleBillBackPath, context];
// }
//
// class DashboardSetNocFrontPath extends DashboardEvent {
//   final BuildContext context;
//   final File nocFrontPath;
//   DashboardSetNocFrontPath(
//       {required this.nocFrontPath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [nocFrontPath, context];
// }
//
// class DashboardSetNocBackPath extends DashboardEvent {
//   final BuildContext context;
//   final File nocBackPath;
//   DashboardSetNocBackPath(
//       {required this.nocBackPath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [nocBackPath, context];
// }
//
// class DashboardSetUploadCustomerPath extends DashboardEvent {
//   final BuildContext context;
//   final File uploadCustomerPath;
//   DashboardSetUploadCustomerPath(
//       {required this.uploadCustomerPath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [uploadCustomerPath, context];
// }
//
// class DashboardSetUploadHousePath extends DashboardEvent {
//   final BuildContext context;
//   final File uploadHousePath;
//   DashboardSetUploadHousePath(
//       {required this.uploadHousePath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [uploadHousePath, context];
// }
//
//
// class DashboardSetCustomerConsentPath extends DashboardEvent {
//   final BuildContext context;
//   final File customerConsentPath;
//   DashboardSetCustomerConsentPath(
//       {required this.customerConsentPath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [customerConsentPath, context];
// }
//
// class DashboardSetOwnerConsentPath extends DashboardEvent {
//   final BuildContext context;
//   final File ownerConsentPath;
//   DashboardSetOwnerConsentPath(
//       {required this.ownerConsentPath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [ownerConsentPath, context];
// }
//
// class DashboardSetCancelChequePath extends DashboardEvent {
//   final BuildContext context;
//   final File cancelChequePath;
//   DashboardSetCancelChequePath(
//       {required this.cancelChequePath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [cancelChequePath, context];
// }
//
// class DashboardSetChequePath extends DashboardEvent {
//   final BuildContext context;
//   final File chequePath;
//   DashboardSetChequePath(
//       {required this.chequePath, required this.context});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [chequePath, context];
// }