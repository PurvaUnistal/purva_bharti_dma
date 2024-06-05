import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

abstract class RegistrationFormEvent extends Equatable {}

class RegistrationFormPageLoadEvent extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class RegistrationFormSetInterestValue extends RegistrationFormEvent {
  final GetNotInterestedModel interestValue;
  RegistrationFormSetInterestValue({required this.interestValue});
  @override
  // TODO: implement props
  List<Object?> get props => [interestValue];
}

class RegistrationFormSetConversionPolicyValue extends RegistrationFormEvent {
  final GetAcceptConversionPolicyModel conversionPolicyValue;
  RegistrationFormSetConversionPolicyValue({required this.conversionPolicyValue});
  @override
  // TODO: implement props
  List<Object?> get props => [conversionPolicyValue];
}

class RegistrationFormSetExtraFittingValue extends RegistrationFormEvent {
  final dynamic extraFittingValue;
  RegistrationFormSetExtraFittingValue({required this.extraFittingValue});
  @override
  // TODO: implement props
  List<Object?> get props => [extraFittingValue];
}

class RegistrationFormSetSocietyAllowValue extends RegistrationFormEvent {
  final dynamic societyAllowValue;
  RegistrationFormSetSocietyAllowValue({required this.societyAllowValue});
  @override
  // TODO: implement props
  List<Object?> get props => [societyAllowValue];
}

class RegistrationFormSetChargeAreaValue extends RegistrationFormEvent {
  final dynamic chargeAreaValue;
  RegistrationFormSetChargeAreaValue({required this.chargeAreaValue});
  @override
  // TODO: implement props
  List<Object?> get props => [chargeAreaValue];
}

class RegistrationFormSetAreaValue extends RegistrationFormEvent {
  final dynamic areaValue;
  RegistrationFormSetAreaValue({required this.areaValue});
  @override
  // TODO: implement props
  List<Object?> get props => [areaValue];
}

class RegistrationFormSetGuardianTypeValue extends RegistrationFormEvent {
  final dynamic guardianTypeValue;
  RegistrationFormSetGuardianTypeValue({required this.guardianTypeValue});
  @override
  // TODO: implement props
  List<Object?> get props => [guardianTypeValue];
}

class RegistrationFormSetPropertyCategoryValue extends RegistrationFormEvent {
  final dynamic propertyCategoryValue;
  RegistrationFormSetPropertyCategoryValue({required this.propertyCategoryValue});
  @override
  // TODO: implement props
  List<Object?> get props => [propertyCategoryValue];
}

class RegistrationFormSetPropertyClassValue extends RegistrationFormEvent {
  final dynamic propertyClassValue;
  RegistrationFormSetPropertyClassValue({required this.propertyClassValue});
  @override
  // TODO: implement props
  List<Object?> get props => [propertyClassValue];
}

class RegistrationFormSetDistrictValue extends RegistrationFormEvent {
  final dynamic allDistrictValue;
  RegistrationFormSetDistrictValue({required this.allDistrictValue});
  @override
  // TODO: implement props
  List<Object?> get props => [allDistrictValue];
}

class RegistrationFormSetResidentStatusValue extends RegistrationFormEvent {
  final dynamic residentStatusValue;
  RegistrationFormSetResidentStatusValue({required this.residentStatusValue});
  @override
  // TODO: implement props
  List<Object?> get props => [residentStatusValue];
}

class RegistrationFormSetExistingCookingFuelValue extends RegistrationFormEvent {
  final dynamic existingCookingFuelValue;
  RegistrationFormSetExistingCookingFuelValue({required this.existingCookingFuelValue});
  @override
  // TODO: implement props
  List<Object?> get props => [existingCookingFuelValue];
}

class RegistrationFormSetKycDoc1Value extends RegistrationFormEvent {
  final dynamic kycDoc1Value;
  RegistrationFormSetKycDoc1Value({required this.kycDoc1Value});
  @override
  // TODO: implement props
  List<Object?> get props => [kycDoc1Value];
}

class RegistrationFormSetKycDoc2Value extends RegistrationFormEvent {
  final dynamic kycDoc2Value;
  RegistrationFormSetKycDoc2Value({required this.kycDoc2Value});
  @override
  // TODO: implement props
  List<Object?> get props => [kycDoc2Value];
}

class RegistrationFormSetKycDoc3Value extends RegistrationFormEvent {
  final dynamic kycDoc3Value;
  RegistrationFormSetKycDoc3Value({required this.kycDoc3Value});
  @override
  // TODO: implement props
  List<Object?> get props => [kycDoc3Value];
}

class RegistrationFormSetPreferredBillValue extends RegistrationFormEvent {
  final dynamic preferredBillValue;
  RegistrationFormSetPreferredBillValue({required this.preferredBillValue});
  @override
  // TODO: implement props
  List<Object?> get props => [preferredBillValue];
}

class RegistrationFormSetCustBankNameValue extends RegistrationFormEvent {
  final dynamic custBankNameValue;
  RegistrationFormSetCustBankNameValue({required this.custBankNameValue});
  @override
  // TODO: implement props
  List<Object?> get props => [custBankNameValue];
}

class RegistrationFormSetPaymentBankNameValue extends RegistrationFormEvent {
  final dynamic paymentBankNameValue;
  RegistrationFormSetPaymentBankNameValue({required this.paymentBankNameValue});
  @override
  // TODO: implement props
  List<Object?> get props => [paymentBankNameValue];
}

class RegistrationFormSetInitialDepositStatusValue extends RegistrationFormEvent {
  final dynamic initialDepositStatusValue;
  RegistrationFormSetInitialDepositStatusValue({required this.initialDepositStatusValue});
  @override
  // TODO: implement props
  List<Object?> get props => [initialDepositStatusValue];
}

class RegistrationFormSetDepositTypeValue extends RegistrationFormEvent {
  final dynamic depositTypeValue;
  RegistrationFormSetDepositTypeValue({required this.depositTypeValue});
  @override
  // TODO: implement props
  List<Object?> get props => [depositTypeValue];
}

class RegistrationFormSetModeDepositValue extends RegistrationFormEvent {
  final dynamic modeDepositValue;
  RegistrationFormSetModeDepositValue({required this.modeDepositValue});
  @override
  // TODO: implement props
  List<Object?> get props => [modeDepositValue];
}

class RegistrationFormSetLocation extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormSetLocation({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class RegistrationFormSetChequeDateEvent extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormSetChequeDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectIdFrontGalleryCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectIdFrontCameraCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectIdBackGalleryCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectIdBackCameraCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SelectAddFrontGalleryCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectAddFrontCameraCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class SelectAddBackGalleryCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectAddBackCameraCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectNocDocBackGalleryCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectNocDocCameraCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SelectCustomerGalleryCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectCustomerCameraCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectHouseGalleryCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectHouseCameraCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectChqGalleryCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectChqCameraCapture extends RegistrationFormEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RegistrationFormPreviewPageEvent extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormPreviewPageEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class SchemeTypeDetailEvent extends RegistrationFormEvent {
  final BuildContext context;
  SchemeTypeDetailEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class RegistrationFormSaveLocalDataEvent extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormSaveLocalDataEvent({required this.context});
  @override
  List<Object?> get props => [context];
}


class RegistrationFormLoadUpdateLocalDataEvent extends RegistrationFormEvent {
  final BuildContext context;
  final int index;
  RegistrationFormLoadUpdateLocalDataEvent({required this.context, required this.index,});
  @override
  List<Object?> get props => [context, index];
}

