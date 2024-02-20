import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CustomRegistrationFormEvent extends Equatable {}

class CustomRegistrationFormPageLoadEvent extends CustomRegistrationFormEvent {
  final BuildContext context;
  CustomRegistrationFormPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class CustomRegistrationFormSetInterestValue extends CustomRegistrationFormEvent {
  final dynamic interestValue;
  CustomRegistrationFormSetInterestValue({required this.interestValue});
  @override
  // TODO: implement props
  List<Object?> get props => [interestValue];
}

class CustomRegistrationFormSetConversionPolicyValue extends CustomRegistrationFormEvent {
  final dynamic conversionPolicyValue;
  CustomRegistrationFormSetConversionPolicyValue({required this.conversionPolicyValue});
  @override
  // TODO: implement props
  List<Object?> get props => [conversionPolicyValue];
}

class CustomRegistrationFormSetExtraFittingValue extends CustomRegistrationFormEvent {
  final dynamic extraFittingValue;
  CustomRegistrationFormSetExtraFittingValue({required this.extraFittingValue});
  @override
  // TODO: implement props
  List<Object?> get props => [extraFittingValue];
}

class CustomRegistrationFormSetSocietyAllowValue extends CustomRegistrationFormEvent {
  final dynamic societyAllowValue;
  CustomRegistrationFormSetSocietyAllowValue({required this.societyAllowValue});
  @override
  // TODO: implement props
  List<Object?> get props => [societyAllowValue];
}

class CustomRegistrationFormSetChargeAreaValue extends CustomRegistrationFormEvent {
  final dynamic chargeAreaValue;
  CustomRegistrationFormSetChargeAreaValue({required this.chargeAreaValue});
  @override
  // TODO: implement props
  List<Object?> get props => [chargeAreaValue];
}

class CustomRegistrationFormSetAreaValue extends CustomRegistrationFormEvent {
  final dynamic areaValue;
  CustomRegistrationFormSetAreaValue({required this.areaValue});
  @override
  // TODO: implement props
  List<Object?> get props => [areaValue];
}

class CustomRegistrationFormSetGuardianTypeValue extends CustomRegistrationFormEvent {
  final dynamic guardianTypeValue;
  CustomRegistrationFormSetGuardianTypeValue({required this.guardianTypeValue});
  @override
  // TODO: implement props
  List<Object?> get props => [guardianTypeValue];
}

class CustomRegistrationFormSetPropertyCategoryValue extends CustomRegistrationFormEvent {
  final dynamic propertyCategoryValue;
  CustomRegistrationFormSetPropertyCategoryValue({required this.propertyCategoryValue});
  @override
  // TODO: implement props
  List<Object?> get props => [propertyCategoryValue];
}

class CustomRegistrationFormSetPropertyClassValue extends CustomRegistrationFormEvent {
  final dynamic propertyClassValue;
  CustomRegistrationFormSetPropertyClassValue({required this.propertyClassValue});
  @override
  // TODO: implement props
  List<Object?> get props => [propertyClassValue];
}

class CustomRegistrationFormSetDistrictValue extends CustomRegistrationFormEvent {
  final dynamic allDistrictValue;
  CustomRegistrationFormSetDistrictValue({required this.allDistrictValue});
  @override
  // TODO: implement props
  List<Object?> get props => [allDistrictValue];
}

class CustomRegistrationFormSetResidentStatusValue extends CustomRegistrationFormEvent {
  final dynamic residentStatusValue;
  CustomRegistrationFormSetResidentStatusValue({required this.residentStatusValue});
  @override
  // TODO: implement props
  List<Object?> get props => [residentStatusValue];
}

class CustomRegistrationFormSetExistingCookingFuelValue extends CustomRegistrationFormEvent {
  final dynamic existingCookingFuelValue;
  CustomRegistrationFormSetExistingCookingFuelValue({required this.existingCookingFuelValue});
  @override
  // TODO: implement props
  List<Object?> get props => [existingCookingFuelValue];
}

class CustomRegistrationFormSetKycDoc1Value extends CustomRegistrationFormEvent {
  final dynamic kycDoc1Value;
  CustomRegistrationFormSetKycDoc1Value({required this.kycDoc1Value});
  @override
  // TODO: implement props
  List<Object?> get props => [kycDoc1Value];
}

class CustomRegistrationFormSetKycDoc2Value extends CustomRegistrationFormEvent {
  final dynamic kycDoc2Value;
  CustomRegistrationFormSetKycDoc2Value({required this.kycDoc2Value});
  @override
  // TODO: implement props
  List<Object?> get props => [kycDoc2Value];
}

class CustomRegistrationFormSetKycDoc3Value extends CustomRegistrationFormEvent {
  final dynamic kycDoc3Value;
  CustomRegistrationFormSetKycDoc3Value({required this.kycDoc3Value});
  @override
  // TODO: implement props
  List<Object?> get props => [kycDoc3Value];
}

class CustomRegistrationFormSetPreferredBillValue extends CustomRegistrationFormEvent {
  final dynamic preferredBillValue;
  CustomRegistrationFormSetPreferredBillValue({required this.preferredBillValue});
  @override
  // TODO: implement props
  List<Object?> get props => [preferredBillValue];
}

class CustomRegistrationFormSetCustBankNameValue extends CustomRegistrationFormEvent {
  final dynamic custBankNameValue;
  CustomRegistrationFormSetCustBankNameValue({required this.custBankNameValue});
  @override
  // TODO: implement props
  List<Object?> get props => [custBankNameValue];
}

class CustomRegistrationFormSetPaymentBankNameValue extends CustomRegistrationFormEvent {
  final dynamic paymentBankNameValue;
  CustomRegistrationFormSetPaymentBankNameValue({required this.paymentBankNameValue});
  @override
  // TODO: implement props
  List<Object?> get props => [paymentBankNameValue];
}

class CustomRegistrationFormSetInitialDepositStatusValue extends CustomRegistrationFormEvent {
  final dynamic initialDepositStatusValue;
  CustomRegistrationFormSetInitialDepositStatusValue({required this.initialDepositStatusValue});
  @override
  // TODO: implement props
  List<Object?> get props => [initialDepositStatusValue];
}

class CustomRegistrationFormSetDepositTypeValue extends CustomRegistrationFormEvent {
  final dynamic depositTypeValue;
  CustomRegistrationFormSetDepositTypeValue({required this.depositTypeValue});
  @override
  // TODO: implement props
  List<Object?> get props => [depositTypeValue];
}

class CustomRegistrationFormSetModeDepositValue extends CustomRegistrationFormEvent {
  final dynamic modeDepositValue;
  CustomRegistrationFormSetModeDepositValue({required this.modeDepositValue});
  @override
  // TODO: implement props
  List<Object?> get props => [modeDepositValue];
}

class CustomRegistrationFormSetLocation extends CustomRegistrationFormEvent {
  final BuildContext context;
  CustomRegistrationFormSetLocation({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class CustomRegistrationFormSetChequeDateEvent extends CustomRegistrationFormEvent {
  final BuildContext context;
  CustomRegistrationFormSetChequeDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class CustomRegistrationFormSetIdFrontFilePath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String idFrontFilePath;
  CustomRegistrationFormSetIdFrontFilePath({required this.idFrontFilePath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [idFrontFilePath, context];
}

class CustomRegistrationFormSetIdBackFilePath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String idBackFilePath;
  CustomRegistrationFormSetIdBackFilePath({required this.idBackFilePath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [idBackFilePath, context];
}

class CustomRegistrationFormSetEleBillFrontPath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String eleBillFrontPath;
  CustomRegistrationFormSetEleBillFrontPath({required this.eleBillFrontPath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [eleBillFrontPath, context];
}

class CustomRegistrationFormSetEleBillBackPath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String eleBillBackPath;
  CustomRegistrationFormSetEleBillBackPath({required this.eleBillBackPath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [eleBillBackPath, context];
}

class CustomRegistrationFormSetNocFrontPath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String nocFrontPath;
  CustomRegistrationFormSetNocFrontPath({required this.nocFrontPath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [nocFrontPath, context];
}

class CustomRegistrationFormSetNocBackPath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String nocBackPath;
  CustomRegistrationFormSetNocBackPath({required this.nocBackPath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [nocBackPath, context];
}

class CustomRegistrationFormSetUploadCustomerPath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String uploadCustomerPath;
  CustomRegistrationFormSetUploadCustomerPath({required this.uploadCustomerPath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [uploadCustomerPath, context];
}

class CustomRegistrationFormSetUploadHousePath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String uploadHousePath;
  CustomRegistrationFormSetUploadHousePath({required this.uploadHousePath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [uploadHousePath, context];
}

class CustomRegistrationFormSetCustomerConsentPath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String customerConsentPath;
  CustomRegistrationFormSetCustomerConsentPath({required this.customerConsentPath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [customerConsentPath, context];
}

class CustomRegistrationFormSetOwnerConsentPath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String ownerConsentPath;
  CustomRegistrationFormSetOwnerConsentPath({required this.ownerConsentPath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [ownerConsentPath, context];
}

class CustomRegistrationFormSetCancelChequePath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String cancelChequePath;
  CustomRegistrationFormSetCancelChequePath({required this.cancelChequePath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [cancelChequePath, context];
}

class CustomRegistrationFormSetChequePath extends CustomRegistrationFormEvent {
  final BuildContext context;
  final String chequePath;
  CustomRegistrationFormSetChequePath({required this.chequePath, required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [chequePath, context];
}

class CustomRegistrationFormPreviewPageEvent extends CustomRegistrationFormEvent {
  final BuildContext context;
  CustomRegistrationFormPreviewPageEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class CustomRegistrationFormSaveLocalDataEvent extends CustomRegistrationFormEvent {
  final BuildContext context;
  CustomRegistrationFormSaveLocalDataEvent({required this.context});
  @override
  List<Object?> get props => [context];
}
